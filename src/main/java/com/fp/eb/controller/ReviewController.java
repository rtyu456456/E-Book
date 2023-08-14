package com.fp.eb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	@GetMapping("/review")
	public String reviewMain(Model model) {
		model.addAttribute("contentPage", "../EB_review/review_main.jsp");
		return "EB_review/review_index";
	}
	
	@GetMapping("/review.search")
	public String reviewSearch(Model model) {
		model.addAttribute("contentPage", "../EB_review/review_search.jsp");
		return "EB_review/review_index";
	}
 
	@GetMapping("/review.write")
	public String reviewWrite(Model model) {
		model.addAttribute("contentPage", "../EB_review/review_write.jsp");
		return "EB_review/review_index";
	}

	@GetMapping("/review.detail")
	public String reviewDetail(Model model) {
		model.addAttribute("contentPage", "../EB_review/review_detail.jsp");
		return "EB_review/review_index";
	}
	
}
