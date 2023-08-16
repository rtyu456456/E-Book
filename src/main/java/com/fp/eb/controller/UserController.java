package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.fp.eb.model.UserDTO;
import com.fp.eb.service.UserDAO;


@Controller
public class UserController {

	@Autowired
	private UserDAO uDAO;

	@GetMapping("/usermain")
	public String userMain() {
		
		return "user/user_main";
	}
	
	@GetMapping("/reguser.go")
	public String regUserGo() {
		
		return "user/reg_user";
	}
	
	@PostMapping("/reguser.do")
	public String regUserDo(HttpServletRequest req, UserDTO uDTO) {
		uDAO.regUser(req, uDTO);
		return "redirect:/";
	}

	@GetMapping("/login.go")
	public String loginGo(HttpServletRequest req, UserDTO uDTO) {
		return "user/login";
	}

	@GetMapping("/login.do")
	public String loginDo(HttpServletRequest req, UserDTO uDTO) {
		uDAO.login(req, uDTO);
		return "user/detail_user";
	}
	
	@PostMapping("/userUpdate.go")
	public String userUpdateGo(HttpServletRequest req, UserDTO uDTO) {
		return "user/update_user";
	}
	

}
