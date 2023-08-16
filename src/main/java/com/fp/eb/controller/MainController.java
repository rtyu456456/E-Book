package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.eb.model.BookDTO;
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
	public String bookSearchByName(BookDTO bDTO, Model model, HttpServletRequest req) {
		mDAO.bookSearchByName(bDTO, model, req);
		model.addAttribute("contentPage", "../EB_main/main_search.jsp");
		return "EB_main/main_index";
	}
	
	@GetMapping("/main.search")
	public String bookSearchByAuthor(BookDTO bDTO, Model model, HttpServletRequest req) {
		mDAO.bookSearchByAuthor(bDTO, model, req);
		model.addAttribute("contentPage", "../EB_main/main_search.jsp");
		return "EB_main/main_index";
	}

	@GetMapping("/review.detail")
	public String reviewDetail(Model model) {
		model.addAttribute("contentPage", "../EB_main/review_detail.jsp");
		return "EB_main/main_index";
	}

}
