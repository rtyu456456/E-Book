package com.fp.eb.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.eb.mapper.BookrecordMapper;

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

}
