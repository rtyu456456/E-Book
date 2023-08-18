package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.eb.model.UserDTO;
import com.fp.eb.service.BookrecordDAO;

@Controller
public class BookrecordController {
	
	@Autowired
	BookrecordDAO brDAO;
	
	@GetMapping("/bookRecord.fin")
	public String bookRecordFin(HttpServletRequest req, UserDTO uDTO) {
		brDAO.getBookFin(req);
		req.setAttribute("contentPage", "bookrecord_fin.jsp");
		return "user/user_main";
	}

	@GetMapping("/bookRecord.ing")
	public String bookRecordIng(HttpServletRequest req, UserDTO uDTO) {
		brDAO.getBookIng(req);
		req.setAttribute("contentPage", "bookrecord_ing.jsp");
		return "user/user_main";
	}
	
	@GetMapping("/bookRecord.wish")
	public String bookRecordWish(HttpServletRequest req, UserDTO uDTO) {
		req.setAttribute("contentPage", "bookrecord_wish.jsp");
		return "user/user_main";
	}

	@GetMapping("/bookRecord.page")
	public String bookRecordpage(HttpServletRequest req, UserDTO uDTO) {
		req.setAttribute("contentPage", "bookrecord_wish.jsp");
		return "user/user_main";
	}
	
}
