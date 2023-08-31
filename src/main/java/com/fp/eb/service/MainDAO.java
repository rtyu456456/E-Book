package com.fp.eb.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.MainMapper;
import com.fp.eb.model.BookDTO;
import com.fp.eb.model.LikeDTO;
import com.fp.eb.model.ReviewDTO;
import com.fp.eb.model.UserDTO;

@Service
public class MainDAO {

	@Autowired
	private MainMapper mainMapper;

	// --------------------------책 검색
	public void bookSearch(BookDTO bDTO, Model model, HttpServletRequest req) {
		String searchOption = req.getParameter("searchOption");
		String searchText = req.getParameter("searchText");
		System.out.println(searchOption);
		System.out.println(searchText);
		List<BookDTO> books = mainMapper.bookSearch(searchOption, searchText); // 검색어로 책 리스트 가져오기 (%가 없음)

		ArrayList<BookDTO> bookSearch = new ArrayList<BookDTO>(); // %를 포함한 bookDTO를 담아줄 새로운 그릇 준비
		BookDTO book2 = null;
		for (BookDTO book : books) {
			int percentage = 0; // 리뷰가 0개일때를 대비한 예외처리
			System.out.println("pk : " + book.getB_no());
			book2 = mainMapper.getPercent(book);
			System.out.println(book2);
			if (book2 != null) {
				percentage = mainMapper.getPercent(book).getPositive_percentage();
				book.setPositive_percentage(percentage); // 해당 percentage를 다시 각 bookDTO에 set
			}
			// 각 bookDTO에서 나온 b_no로 positive_percentage를 int로 추출
			bookSearch.add(book); // percentage까지 set 된 각 bookDTO를 ArrayList에 추가 */
		}
		model.addAttribute("bookSearch", bookSearch);
	}

	// --------------------------책 상세
	public void bookDetail(HttpServletRequest req, BookDTO bDTO, ReviewDTO rDTO, Model model, LikeDTO likeDTO) {
		System.out.println(bDTO.getB_no());
		// model.addAttribute("hotBook", mainMapper.bookDetail(bDTO));
		bDTO = mainMapper.bookDetail(bDTO);
		UserDTO user = (UserDTO) req.getSession().getAttribute("user");
		if (user != null) {
			likeDTO.setLr_owner(user.getU_id());
			likeDTO.setLr_where_type("BOOK");
			likeDTO.setLr_where_no(bDTO.getB_no());
		};
		
		if (mainMapper.likeCheck(likeDTO) != null) {
			bDTO.setBookmarkCheck(Integer.parseInt(mainMapper.likeCheck(likeDTO)));
		}
		BookDTO bookDetail = bDTO;
		System.out.println(bookDetail.getBookmarkCheck());
		model.addAttribute("bookSearch", bookDetail);
	}

	// --------------------------서평
	public void reviews(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		List<ReviewDTO> reviews = mainMapper.reviews(bDTO);
		LikeDTO likeDTO = new LikeDTO();
		UserDTO user = (UserDTO) req.getSession().getAttribute("user");
		// UserDTO user = new UserDTO();
		if (user != null) {
			likeDTO.setLr_owner(user.getU_id());
			likeDTO.setLr_where_type("REVIEW");
		}
		for (ReviewDTO r : reviews) {
			System.out.println(r.getR_no());
			likeDTO.setLr_where_no(r.getR_no());
			if (user != null) {
				if (mainMapper.getLikeInfo(likeDTO) != null) {
					r.setLikeCheck(mainMapper.getLikeInfo(likeDTO).getLr_type());
					System.out.println(mainMapper.getLikeInfo(likeDTO).getLr_type());
					Map<String, Object> likeDislike = mainMapper.likeDislikeCount(likeDTO);
					System.out.println("-----------------");
					System.out.println(likeDislike);
					System.out.println(likeDislike.get("LIKE_COUNT"));
					System.out.println(likeDislike.get("DISLIKE_COUNT"));
					BigDecimal like = (BigDecimal) likeDislike.get("LIKE_COUNT");
					BigDecimal dislike = (BigDecimal) likeDislike.get("DISLIKE_COUNT");
					r.setR_like(like.intValue());
					r.setR_dislike(dislike.intValue());
					System.out.println("-----------------");
				}
			}
		}
		model.addAttribute("reviews", reviews);
	}

	// --------------------------평가 퍼센트
	public void getPercent1(BookDTO bDTO, ReviewDTO rDTO, Model model) {
		model.addAttribute("getPercent1", mainMapper.getPercent(bDTO));
	}

	// --------------------------좋아요
	public int likeFunc(HttpServletRequest req, LikeDTO likeDTO) {
		System.out.println(likeDTO.getLr_where_no());
		System.out.println(likeDTO.getLr_owner());
		System.out.println(likeDTO.getLr_where_type());
		System.out.println(likeDTO.getLr_type());
		// 있나 없나
		LikeDTO likeDTO2 = mainMapper.getLikeInfo(likeDTO);
		if (likeDTO2 == null) {
			mainMapper.insertLike(likeDTO);
			return likeDTO.getLr_type();
		} else {
			// 이미 있었던 데이터의 lr_type을 보고
			// 그 내용을 유저가 누른값으로 세팅
			mainMapper.updateLike(likeDTO);
			return likeDTO.getLr_type();
		}
	}

	// 오늘의 베스트 서평
	public void dailyBest(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("dailyBest", mainMapper.dailyBest(bDTO, rDTO, model, req));
	}

	public void dailyBook(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("dailyBook", mainMapper.dailyBook(bDTO, rDTO, model, req));
	}

	public void dailyUser(UserDTO uDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("dailyUser", mainMapper.dailyUser(uDTO, rDTO, model, req));
	}

	// 이번주 베스트 서평
	public void weeklyBest(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("weeklyBest", mainMapper.weeklyBest(bDTO, rDTO, model, req));
	}

	public void weeklyBook(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("weeklyBook", mainMapper.weeklyBook(bDTO, rDTO, model, req));
	}

	public void weeklyUser(UserDTO uDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("weeklyUser", mainMapper.weeklyUser(uDTO, rDTO, model, req));
	}

	// 이번달 베스트 서평
	public void monthlyBest(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("monthlyBest", mainMapper.monthlyBest(bDTO, rDTO, model, req));
	}

	public void monthlyBook(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("monthlyBook", mainMapper.monthlyBook(bDTO, rDTO, model, req));
	}

	public void monthlyUser(UserDTO uDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		model.addAttribute("monthlyUser", mainMapper.monthlyUser(uDTO, rDTO, model, req));
	}

	// 인기 도서
	public void hotBook(BookDTO bDTO, LikeDTO lDTO, Model model, HttpServletRequest req) {
		List<BookDTO> HB = mainMapper.hotBooks(bDTO);
		model.addAttribute("hotBooks", mainMapper.hotBooks(bDTO));
		System.out.println(mainMapper.hotBooks(bDTO));
	}

}
