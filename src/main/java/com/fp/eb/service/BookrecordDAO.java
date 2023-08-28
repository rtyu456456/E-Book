package com.fp.eb.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.eb.mapper.BookMapper;
import com.fp.eb.mapper.BookrecordMapper;
import com.fp.eb.model.BookDTO;
import com.fp.eb.model.BookrecordDTO;
import com.fp.eb.model.ReviewDTO;
import com.fp.eb.model.UserDTO;

@Service
public class BookrecordDAO {

	@Autowired
	BookrecordMapper brMapper;

	@Autowired
	BookMapper bMapper;

	public void getBookIng(HttpServletRequest req) {

		req.setAttribute("bookrecords", brMapper.getBookIng());

	}

	public void getBookFin(HttpServletRequest req) {
		
		req.setAttribute("bookrecords", brMapper.getBookFin());
		
	}

	public int getPage(BookrecordDTO brDTO) {

		brMapper.updateCurPage(brDTO);
		// br_page update
		return brMapper.getCurPage(brDTO);
		// get br_page
	}

	public void getBookWish(HttpServletRequest req) {

		req.setAttribute("bookrecords", brMapper.getBookWish());

	}

	public void delWish(BookrecordDTO brDTO) {

		brMapper.delWish(brDTO);
	}

	public void delBr(BookrecordDTO brDTO) {
		brMapper.delBr(brDTO);
	}

	public void regIng(BookrecordDTO brDTO, UserDTO uDTO) {
		System.out.println(brDTO.getB_no());
		System.out.println(brDTO.getLr_no());
		
		if (brMapper.getIngByNo(brDTO, uDTO) == 0) {
			if (brMapper.getIngCnt(uDTO) >= 5) {
				System.out.println("5개 넘어서 등록 x");
			} else {
				brMapper.regIng(brDTO, uDTO);
			}
		}

		if (brDTO.getLr_no() != null) {
			brMapper.delWish(brDTO);
		}
	}

	public void regBookModalAPI(BookDTO bDTO, HttpServletRequest req, UserDTO uDTO) {
		
		String url = bDTO.getB_url();
		System.out.println(url);

		try {
			// Jsoup로 크롤링한 페이지 전체

			Document doc = Jsoup.connect(url).get();

			// 페이지 크롤링해서 담기

			Element page = doc.select(".cont").get(2);

			String[] pages = page.text().toString().split(" | ");

			bDTO.setB_page(Integer.parseInt(pages[0]));

			System.out.println(bDTO.getB_page());

			// 책 줄거리가 없을 경우 처리

			if (bDTO.getB_contents().equals("")) {
				bDTO.setB_contents("책 줄거리가 없습니다.");
			}

			// 책 줄거리가 중간에 끊겨서 . ? ! " > 등으로 나오지 않았을 때

			String lastContents = bDTO.getB_contents().substring(bDTO.getB_contents().length() - 1);

			if (!lastContents.equals(".") && !lastContents.equals("!") && !lastContents.equals("?")
					&& !lastContents.equals("\"") && !lastContents.equals(">")) {
				String ellipsis = "...";
				bDTO.setB_contents(bDTO.getB_contents() + ellipsis);
			}

			// 책 설명 크롤링해서 담기 (성인인증 못피해서 폐기)

			/*
			 * Element desc = doc.select(".desc").get(0);
			 * 
			 * bDTO.setB_contents(desc.html());
			 * 
			 * System.out.println(bDTO.getB_contents());
			 */

			// 띄어쓰기 + ,(", ") 로 구분한 authors !로 구분해서 다시 넣어주기

			String authors = bDTO.getB_authors().replace(", ", "!");

			bDTO.setB_authors(authors);

			// ISBN으로 검사 뒤 있으면 그 정보 꺼내오기, 없으면 등록

			if (bMapper.getBookByISBN(bDTO) == null) {

				if (bMapper.regBook(bDTO) == 1) {
					System.out.println("등록성공");
				} else {
					System.out.println("등록실패");
				}
			}
			bDTO.setB_no(bMapper.getBookByISBN(bDTO).getB_no());

			System.out.println("값 싣기 성공");

			BookrecordDTO brDTO = new BookrecordDTO();

			brDTO.setB_no(bDTO.getB_no());

			if (brMapper.getIngByNo(brDTO, uDTO) == 0) {
				if (brMapper.getIngCnt(uDTO) >= 5) {
					System.out.println("5개 넘어서 등록 x");
				} else {
					brMapper.regIngModal(bDTO, uDTO);
				}
			}

			System.out.println("모달에서 등록 성공");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void regReview(ReviewDTO rDTO, HttpServletRequest req) {
		
		
		if(brMapper.regReview(rDTO) == 1) {
			System.out.println("등록성공");
		}
		
		
	}

	public int reviewCheck(ReviewDTO rDTO, HttpServletRequest req) {
		
		return brMapper.reviewCheck(rDTO);
	}

	public BookrecordDTO getReviewBook(ReviewDTO rDTO, HttpServletRequest req) {
		
		return brMapper.getReviewBook(rDTO);
	}

}
