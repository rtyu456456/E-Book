package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fp.eb.model.LikeDTO;
import com.fp.eb.service.MainDAO;

@RestController
public class APIController {
	@Autowired
	private MainDAO mDAO;
	
	@GetMapping("/like.do")
	public int likeFunc(HttpServletRequest req, LikeDTO likeDTO) {
		return mDAO.likeFunc(req,likeDTO);
	}
	
	
	
	
}
