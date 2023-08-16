package com.fp.eb.service;

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
	
	public void bookSearch(BookDTO bDTO, Model model) {
		model.addAttribute("bookSearch", ss.getMapper(MainMapper.class).bookSearch(bDTO));
	}
	
}
