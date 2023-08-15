package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.eb.model.BookDTO;
import com.fp.eb.service.BookDAO;

@Controller
public class BookController {
	
	@Autowired
	private BookDAO bDAO;
	
	
	@GetMapping("/getbook.do")
	public String getBookDo(BookDTO bDTO, HttpServletRequest req) {
		bDAO.getBookData(bDTO, req);
		
		return "index";
	}
	

	@GetMapping("/getbook.detail")
	public String getBookDetail(HttpServletRequest req, BookDTO bDTO) {
		bDAO.showDetail(bDTO, req);
		return "index";
	}

	@GetMapping("/calendar.go")
	public String calendarGo() {
		bDAO.getBookTest();
		return "user/calendar_test";
	}
	
	
	
}
