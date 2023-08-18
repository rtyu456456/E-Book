package com.fp.eb.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.MainMapper;
import com.fp.eb.model.BookDTO;
import com.fp.eb.model.ReviewDTO;

@Service
public class MainDAO {

	@Autowired
	private MainMapper mainMapper;
	
	public void bookSearch(BookDTO bDTO, Model model, HttpServletRequest req) {
		String searchOption = req.getParameter("searchOption");
		String searchText = req.getParameter("searchText");
		System.out.println(searchOption);
		System.out.println(searchText);
		// 1. bean
		// 2. map
		model.addAttribute("bookSearch", mainMapper.bookSearch(searchOption, searchText));
	}

	public void bookDetail(BookDTO bDTO, ReviewDTO rDTO, Model model) {
		model.addAttribute("bookSearch", mainMapper.bookDetail(bDTO));
	}

	public void reviews(BookDTO bDTO, ReviewDTO rDTO, Model model) {
		model.addAttribute("reviews", mainMapper.reviews(bDTO));
		
	}

}
