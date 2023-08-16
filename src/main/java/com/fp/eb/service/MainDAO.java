package com.fp.eb.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.MainMapper;
import com.fp.eb.model.BookDTO;

@Service
public class MainDAO {

	@Autowired
	private SqlSession ss;
	
	public void bookSearchByName(BookDTO bDTO, Model model, HttpServletRequest req) {
		String searchColumn;
		String searchOption = req.getParameter("searchOption");
		String searchText = req.getParameter("searchText");
		
		model.addAttribute("bookSearch", ss.getMapper(MainMapper.class).bookSearch(bDTO));
	}

	public void bookSearchByAuthor(BookDTO bDTO, Model model, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}
	
}
