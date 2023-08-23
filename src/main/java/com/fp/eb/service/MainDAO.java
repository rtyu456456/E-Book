package com.fp.eb.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.MainMapper;
import com.fp.eb.model.BookDTO;
import com.fp.eb.model.LikeDTO;
import com.fp.eb.model.ReviewDTO;

@Service
public class MainDAO {

	@Autowired
	private MainMapper mainMapper;
	
	public void bookSearch(BookDTO bDTO, Model model, HttpServletRequest req) {
		String searchOption = req.getParameter("searchOption");
		String searchText = req.getParameter("searchText");
		System.out.println(searchOption);
		System.out.println(searchText);
		// 1. bean
		// 2. map
		List<BookDTO> books = mainMapper.bookSearch(searchOption, searchText); // 검색어로 책 리스트 가져오기 (%가 없음)
		
		ArrayList<BookDTO> bookSearch = new ArrayList<BookDTO>(); // %를 포함한 bookDTO를 담아줄 새로운 그릇 준비
		BookDTO book2 = null;
		for (BookDTO book : books) {
			int percentage = 0; // 리뷰가 0개일때를 대비한 예외처리
			System.out.println("pk : " + book.getB_no());
			book2 =  mainMapper.getPercent(book);
			System.out.println(book2);
			if(book2 != null) {
				percentage =  mainMapper.getPercent(book).getPositive_percentage();
				book.setPositive_percentage(percentage); // 해당 percentage를 다시 각 bookDTO에 set
			}	
			//각 bookDTO에서 나온 b_no로 positive_percentage를 int로 추출
			bookSearch.add(book); // percentage까지 set 된 각 bookDTO를 ArrayList에 추가 */
		}
		model.addAttribute("bookSearch", bookSearch);
	}

	public void bookDetail(BookDTO bDTO, ReviewDTO rDTO, Model model) {
		model.addAttribute("bookSearch", mainMapper.bookDetail(bDTO));
	}

	public void reviews(BookDTO bDTO, ReviewDTO rDTO, Model model) {
		model.addAttribute("reviews", mainMapper.reviews(bDTO));
	}

	public void getPercent1(BookDTO bDTO, ReviewDTO rDTO, Model model) {
		model.addAttribute("getPercent1", mainMapper.getPercent(bDTO));
		
	}

	public int likeFunc(HttpServletRequest req, LikeDTO likeDTO) {
		System.out.println(likeDTO.getLr_where_no());
		System.out.println(likeDTO.getLr_owner());
		System.out.println(likeDTO.getLr_where_type());
		System.out.println(likeDTO.getLr_type());
		// 있나 없나   		
		LikeDTO likeDTO2 = mainMapper.getLikeInfo(likeDTO);
		if(likeDTO2 == null) {
			mainMapper.insertLike(likeDTO);
			return likeDTO.getLr_type();
		}else {
			// 이미 있었던 데이터에 lr_type을 보고
			// 그 내용을 유저가 누른값으로 세팅
			mainMapper.updateLike(likeDTO);
			return likeDTO.getLr_type();
		}
	}


	

}
