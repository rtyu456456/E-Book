package com.fp.eb.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.CommunityMapper;
import com.fp.eb.model.CommunityDTO;

@Service
public class CommunityDAO {
	
	@Autowired
	private SqlSession ss;

	public void getAllCommunity(Model model) {
	model.addAttribute("community", ss.getMapper(CommunityMapper.class).getAllCommunity());
	}

	public void getCommunity(CommunityDTO c, Model model) {
	model.addAttribute("communityName", ss.getMapper(CommunityMapper.class).getCommunity(c));
	}

	public void getAllCommunityPost(CommunityDTO c, Model model) {
	model.addAttribute("communityPost", ss.getMapper(CommunityMapper.class).getAllCommunityPost(c));
	}
	

	
}
