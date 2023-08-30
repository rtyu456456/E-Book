package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.ReviewDTO;
import com.fp.eb.model.UserDTO;
import com.fp.eb.service.UserDAO;


@Controller
public class UserController {

	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private BCryptPasswordEncoder bEncoder;

	@GetMapping("/usermain")
	public String userMain(HttpServletRequest req) {
		req.setAttribute("contentPage", "detail_user.jsp");
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
	public String loginDo(HttpServletRequest req, UserDTO uDTO, String id) {
		
		return "redirect:/main";
	}
	
	@PostMapping("/login.dodo")
	public String loginDodo(HttpServletRequest req, UserDTO uDTO) {
		System.out.println(uDTO);
		uDAO.login2(req, uDTO);
		return "redirect:/usermain";
	}
	
	@ResponseBody
	@PostMapping("/pwCheck.do")
	public int pwCheck(HttpServletRequest req, UserDTO uDTO) {
		
		return uDAO.pwCheck(req, uDTO);
	}
	
	
	@PostMapping("/delUser.do")
	public String delUser(HttpServletRequest req, UserDTO uDTO) {
		System.out.println(uDTO);
		uDAO.login2(req, uDTO);
		return "redirect:/usermain";
	}
	
	
	@GetMapping("/logout.go")
	public String logoutGo(HttpServletRequest req, UserDTO uDTO) {
		req.getSession().removeAttribute("user");;
		return "redirect:/main";
	}
	
	@GetMapping("/userUpdate.go")
	public String userUpdateGo(HttpServletRequest req, UserDTO uDTO) {
		req.setAttribute("contentPage", "update_user.jsp");
		return "user/user_main";
	}
	

}
