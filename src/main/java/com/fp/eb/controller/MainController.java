package com.fp.eb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main")
	public String reviewMain(Model model) {
		//model.addAttribute("contentPage", "../EB_review/main.jsp");
		return "EB_main/main_index";
	}
	
}
