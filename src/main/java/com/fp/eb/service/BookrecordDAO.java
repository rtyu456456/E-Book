package com.fp.eb.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.eb.mapper.BookrecordMapper;
import com.fp.eb.model.BookrecordDTO;
import com.fp.eb.model.UserDTO;

@Service
public class BookrecordDAO {

	@Autowired
	BookrecordMapper brMapper;

	public void getBookIng(HttpServletRequest req) {

		req.setAttribute("bookrecords", brMapper.getBookIng());

	}

	public void getBookFin(HttpServletRequest req) {

		req.setAttribute("bookrecords", brMapper.getBookFin());

	}

	public int getPage(BookrecordDTO brDTO) {
		
		brMapper.updateCurPage(brDTO);
		// br_page update
		System.out.println(brDTO.getBr_no());
		System.out.println(brDTO.getBr_page());
		return brMapper.getCurPage(brDTO);
		// get br_page
	}

}
