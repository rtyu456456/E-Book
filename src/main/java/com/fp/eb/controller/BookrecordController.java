package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.BookrecordDTO;
import com.fp.eb.model.UserDTO;
import com.fp.eb.service.BookDAO;
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

	@GetMapping("/reg.ing")
	public String regIng(HttpServletRequest req, UserDTO uDTO, BookrecordDTO brDTO) {
		brDAO.regIng(brDTO, uDTO);
		brDAO.getBookIng(req);
		req.setAttribute("contentPage", "bookrecord_ing.jsp");
		return "user/user_main";
	}

	@GetMapping("/bookRecord.wish")
	public String bookRecordWish(HttpServletRequest req, UserDTO uDTO) {
		brDAO.getBookWish(req);
		req.setAttribute("contentPage", "bookrecord_wish.jsp");
		return "user/user_main";
	}

	@GetMapping("/del.fin")
	public String delFin(HttpServletRequest req, BookrecordDTO brDTO) {
		brDAO.delBr(brDTO);
		brDAO.getBookFin(req);
		req.setAttribute("contentPage", "bookrecord_fin.jsp");
		return "user/user_main";
	}

	@GetMapping("/del.ing")
	public String delIng(HttpServletRequest req, BookrecordDTO brDTO) {
		brDAO.delBr(brDTO);
		brDAO.getBookIng(req);
		req.setAttribute("contentPage", "bookrecord_ing.jsp");
		return "user/user_main";
	}
	
	@GetMapping("/del.wish")
	public String delWish(HttpServletRequest req, BookrecordDTO brDTO) {
		brDAO.delWish(brDTO);
		brDAO.getBookWish(req);
		req.setAttribute("contentPage", "bookrecord_wish.jsp");
		return "user/user_main";
	}

	@ResponseBody
	@GetMapping("/bookRecord.page")
	public int getcurPage(HttpServletRequest req, BookrecordDTO brDTO) {
		return brDAO.getPage(brDTO);
	}
	
	@GetMapping("/regbooking.modalapi")
	public String regBookModalAPI(HttpServletRequest req, BookDTO bDTO, UserDTO uDTO) {
		brDAO.regBookModalAPI(bDTO, req, uDTO);
		
		return "redirect:/bookRecord.ing";
	}

}
