package com.fp.eb.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.CommunityMapper;
import com.fp.eb.model.CommunityDTO;
import com.fp.eb.model.CommunityPostDTO;

@Service
public class CommunityDAO {

	@Autowired
	private SqlSession ss;

	public void getAllCommunity(Model model) {
		model.addAttribute("communitys", ss.getMapper(CommunityMapper.class).getAllCommunity());
	}

	public void getCommunity(CommunityDTO c, Model model) {
		model.addAttribute("community", ss.getMapper(CommunityMapper.class).getCommunity(c));
	}

	public void getAllCommunityPost(CommunityDTO c, Model model) {
		model.addAttribute("communityPosts", ss.getMapper(CommunityMapper.class).getAllCommunityPost(c));
	}

	public void getCommunityPost(CommunityPostDTO cp, Model model) {
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

		// Timestamp to String
		String currentTimestampToString = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(currentTimestamp);
		
		
		model.addAttribute("realTime",currentTimestampToString);
		System.out.println(currentTimestampToString);
		model.addAttribute("communityPost", ss.getMapper(CommunityMapper.class).getCommunityPost(cp));
		
	}


}
