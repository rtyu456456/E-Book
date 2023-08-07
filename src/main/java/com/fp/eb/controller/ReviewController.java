package com.fp.eb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	@GetMapping("/review")
	public String reviewMain(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("contentPage", "EB_review/review_main.jsp");
		return "EB_review/review_index";
	}

	@GetMapping("/review.write")
	public String reviewWrite() {
		return "EB_review/review_write";
	}

	@GetMapping("/review.detail")
	public String reviewDetail() {
		return "EB_review/review_detail";
	}
	
}
