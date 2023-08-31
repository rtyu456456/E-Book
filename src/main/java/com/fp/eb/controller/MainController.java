package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.LikeDTO;
import com.fp.eb.model.ReviewDTO;
import com.fp.eb.model.UserDTO;
import com.fp.eb.service.MainDAO;

@Controller
public class MainController {

	@Autowired
	private MainDAO mDAO;

	@GetMapping("/main")
	public String mainMain(BookDTO bDTO, LikeDTO lDTO, ReviewDTO rDTO, UserDTO uDTO, Model model, HttpServletRequest req) {
		UserDTO user =(UserDTO) req.getSession().getAttribute("user");
		uDTO.setU_id(user.getU_id());
		mDAO.hotBook(bDTO, lDTO, model, req);
		mDAO.dailyBest(bDTO, rDTO, model, req);
		mDAO.dailyBook(bDTO, rDTO, model, req);
		mDAO.dailyUser(uDTO, rDTO, model, req);
		mDAO.weeklyBest(bDTO, rDTO, model, req);
		mDAO.weeklyBook(bDTO, rDTO, model, req);
		mDAO.weeklyUser(uDTO, rDTO, model, req);
		mDAO.monthlyBest(bDTO, rDTO, model, req);
		mDAO.monthlyBook(bDTO, rDTO, model, req);
		mDAO.monthlyUser(uDTO, rDTO, model, req);
		model.addAttribute("contentPage", "../EB_main/main_main.jsp");
		return "EB_main/main_index";
	}

	@GetMapping("/main.search")
	public String bookSearch(BookDTO bDTO, ReviewDTO rDTO, Model model, UserDTO uDTO, HttpServletRequest req) {
		UserDTO user =(UserDTO) req.getSession().getAttribute("user");
		uDTO.setU_id(user.getU_id());
		mDAO.bookSearch(bDTO, model, req);
//		mDAO.getPercent1(bDTO, rDTO, model);
		model.addAttribute("contentPage", "../EB_main/main_search.jsp");
		return "EB_main/main_index";
	}

	@GetMapping("/book.detail")
	public String bookDetail(UserDTO uDTO,LikeDTO lDTO, BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		UserDTO user =(UserDTO) req.getSession().getAttribute("user");
		uDTO.setU_id(user.getU_id());
		System.out.println("이거 한번 보여줘" + bDTO);
		mDAO.bookDetail(req, bDTO, rDTO, model, lDTO);
		mDAO.reviews(bDTO, rDTO, model, req);
		mDAO.getPercent1(bDTO, rDTO, model);
		model.addAttribute("contentPage", "../EB_main/book_detail.jsp");
		return "EB_main/main_index";
	}




}
