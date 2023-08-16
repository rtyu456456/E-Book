package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {


	@GetMapping("/user")
	public String text(HttpServletRequest req) {
		req.setAttribute("loginPage", "user/login.jsp");
		return "user/index";
	}


}
