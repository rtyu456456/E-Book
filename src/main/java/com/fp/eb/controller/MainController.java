package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.ReviewDTO;
import com.fp.eb.service.MainDAO;

@Controller
public class MainController {

	@Autowired
	private MainDAO mDAO;

	@GetMapping("/main")
	public String mainMain(Model model) {
		model.addAttribute("contentPage", "../EB_main/main_main.jsp");
		return "EB_main/main_index";
	}

	@GetMapping("/main.search")
	public String bookSearch(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		mDAO.bookSearch(bDTO, model, req);
//		mDAO.getPercent1(bDTO, rDTO, model);
		model.addAttribute("contentPage", "../EB_main/main_search.jsp");
		return "EB_main/main_index";
	}

	@GetMapping("/book.detail")
	public String bookDetail(BookDTO bDTO, ReviewDTO rDTO, Model model, HttpServletRequest req) {
		mDAO.bookDetail(bDTO, rDTO, model);
		mDAO.reviews(bDTO, rDTO, model);
		mDAO.getPercent1(bDTO, rDTO, model);
		model.addAttribute("contentPage", "../EB_main/book_detail.jsp");
		return "EB_main/main_index";
	}




}
