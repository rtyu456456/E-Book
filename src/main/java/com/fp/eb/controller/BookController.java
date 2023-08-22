package com.fp.eb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@ResponseBody
	@RequestMapping(value="/getDBbook.do", method = RequestMethod.GET,
			produces = "application/json; charset=utf-8")
	public List<BookDTO> getDBBookTitle(BookDTO bDTO, HttpServletRequest req) {
		System.out.println(bDTO.getB_title());
		return bDAO.getDBBookData(bDTO, req);
	}
	

	@GetMapping("/getbook.detail")
	public String getBookDetail(HttpServletRequest req, BookDTO bDTO) {
		bDAO.showDetail(bDTO, req);
		return "index";
	}

	@GetMapping("/calendar.go")
	public String calendarGo() {
		return "user/calendar_test";
	}
	
	
	
}
