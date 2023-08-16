package com.fp.eb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String bookSearch(BookDTO bDTO, Model model) {
		mDAO.bookSearch(bDTO,model);
		model.addAttribute("contentPage", "../EB_main/main_search.jsp");
		return "EB_main/main_index";
	}
  
	@GetMapping("/review.detail")
	public String reviewDetail(Model model) {
		model.addAttribute("contentPage", "../EB_main/review_detail.jsp");
		return "EB_main/main_index";
	}
	
}
