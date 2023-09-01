package com.fp.eb.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.BookrecordDTO;
import com.fp.eb.model.ReviewDTO;
import com.fp.eb.model.UserDTO;
import com.fp.eb.service.BookDAO;
import com.fp.eb.service.BookrecordDAO;

@Controller
public class BookrecordController {

	@Autowired
	BookrecordDAO brDAO;

	@GetMapping("/bookRecord.fin")
	public String bookRecordFin(HttpServletRequest req, UserDTO uDTO) {
		
		
		
		if(req.getParameter("cur_year") == null) {
			LocalDateTime current_date = LocalDateTime.now();
			int cur_year = current_date.getYear();
			int cur_month = current_date.getMonthValue();
			req.setAttribute("cur_month", cur_month);
			req.setAttribute("cur_year", cur_year);
		}
		

		brDAO.getBookFin(req, uDTO);
		req.setAttribute("contentPage", "bookrecord_fin.jsp");
		
		return "user/user_main";
	}

	@GetMapping("/bookRecord.ing")
	public String bookRecordIng(HttpServletRequest req, UserDTO uDTO) {
		brDAO.getBookIng(req, uDTO);
		req.setAttribute("contentPage", "bookrecord_ing.jsp");
		return "user/user_main";
	}

	@GetMapping("/reg.ing")
	public String regIng(HttpServletRequest req, UserDTO uDTO, BookrecordDTO brDTO) {
		brDAO.regIng(req, brDTO, uDTO);
		brDAO.getBookIng(req, uDTO);
		req.setAttribute("contentPage", "bookrecord_ing.jsp");
		return "user/user_main";
	}

	@GetMapping("/bookRecord.wish")
	public String bookRecordWish(HttpServletRequest req, UserDTO uDTO) {
		brDAO.getBookWish(req, uDTO);
		req.setAttribute("contentPage", "bookrecord_wish.jsp");
		return "user/user_main";
	}

	@GetMapping("/del.fin")
	public String delFin(HttpServletRequest req, BookrecordDTO brDTO, UserDTO uDTO) {
		brDAO.delBr(brDTO);
		brDAO.getBookFin(req, uDTO);
		req.setAttribute("contentPage", "bookrecord_fin.jsp");
		return "user/user_main";
	}

	@GetMapping("/del.ing")
	public String delIng(HttpServletRequest req, BookrecordDTO brDTO, UserDTO uDTO) {
		brDAO.delBr(brDTO);
		brDAO.getBookIng(req, uDTO);
		req.setAttribute("contentPage", "bookrecord_ing.jsp");
		return "user/user_main";
	}
	
	@GetMapping("/del.wish")
	public String delWish(HttpServletRequest req, BookrecordDTO brDTO, UserDTO uDTO) {
		brDAO.delWish(brDTO);
		brDAO.getBookWish(req, uDTO);
		req.setAttribute("contentPage", "bookrecord_wish.jsp");
		return "user/user_main";
	}

	@ResponseBody
	@GetMapping("/bookRecord.page")
	public int getcurPage(HttpServletRequest req, BookrecordDTO brDTO) {
		return brDAO.getPage(brDTO);
	}
	
	@GetMapping("/regbooking.modalapi")
	public String regBookModalAPI(HttpServletRequest req, BookDTO bDTO, UserDTO uDTO) {
		brDAO.regBookModalAPI(bDTO, req, uDTO);
		
		return "redirect:/bookRecord.ing";
	}

	@GetMapping("/regReview.do")
	public String regReviewDo(HttpServletRequest req, ReviewDTO rDTO, UserDTO uDTO) {
		brDAO.regReview(rDTO, req, uDTO);
		
		return "redirect:/bookRecord.fin";
	}
	
	@ResponseBody
	@GetMapping("/reviewCheck.do")
	public int regCheckDo(HttpServletRequest req, ReviewDTO rDTO, UserDTO uDTO) {
		
		return brDAO.reviewCheck(rDTO, req, uDTO);
	}
	
	@ResponseBody
	@RequestMapping(value="/getReviewbyNo.do", method = RequestMethod.GET,
			produces = "application/json; charset=utf-8")
	public BookrecordDTO getReviewBook(ReviewDTO rDTO, HttpServletRequest req, UserDTO uDTO) {
		System.out.println(rDTO.getR_b_no());
		return brDAO.getReviewBook(rDTO, req, uDTO);
	}
	
	@GetMapping("/updateReview.do")
	public String updateReviewDo(HttpServletRequest req, ReviewDTO rDTO) {
		brDAO.updateReview(rDTO, req);
		
		return "redirect:/bookRecord.fin";
	}
	

}
