package com.fp.eb.controller;

import java.sql.Time;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.eb.model.CommunityDTO;
import com.fp.eb.model.CommunityPostDTO;
import com.fp.eb.model.CommunityReplyDTO;
import com.fp.eb.service.CommunityDAO;

@Controller
public class CommunityController {

	@Autowired
	private CommunityDAO cDAO;
	
	// 이 폴더는 컨트롤러 넣어놓는 폴더입니다.
	// 각자가 만드는 기능에 따른 컨트롤러를 넣어주시면 됩니다
	// 이 컨트롤러 이름은 HomeController로 만든 이유는
	// 홈컨 쓰는 사람은 제 손에 죽는다는 겁니다.
	// 여긴 아무도 못써, 홈컨이라는 이름도 못써
	// HC도 못써
	
	@GetMapping("/community_main")
	public String goCommunityMain(Model model) {
		cDAO.getAllCommunity (model); 
		
		 model.addAttribute("commu_header_page", "community_main_header.jsp"); 
		 model.addAttribute("commu_contents_page", "community_main_contents.jsp"); 
		 return "community/community_page";
	}
	
	@GetMapping("/seach.community")
	public String seachCommunity(Model model, CommunityDTO c) {
		cDAO.seachCommunity(c, model);
		
		
		model.addAttribute("commu_header_page", "community_main_header.jsp"); 
		model.addAttribute("commu_contents_page", "community_seach_contents.jsp"); 
		return "community/community_page";
	}
	
	@GetMapping("/seach.all.community")
	public String seachAllCommunity(Model model, CommunityDTO c) {
		cDAO.getAllCommunity (model); 
		
		
		model.addAttribute("commu_header_page", "community_main_header.jsp"); 
		model.addAttribute("commu_contents_page", "community_seach_main_contents.jsp"); 
		return "community/community_page";
	}
	
	@GetMapping("/go.made.post")
	public String goMadePost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		
		model.addAttribute("commu_header_page", "community_main_header.jsp"); 
		model.addAttribute("commu_contents_page", "community_madePost_contents.jsp"); 
		return "community/community_page";
	}
	
	@GetMapping("/go.commu.post")
	public String goBoard(Model model, CommunityDTO c) {
		cDAO.getCommunity(c, model);
		cDAO.getAllCommunityPost(c, model);
		
		 model.addAttribute("commu_header_page", "community_post_header.jsp"); 
		 model.addAttribute("commu_contents_page", "community_post_contents.jsp"); 
		return "community/community_page";
	}
	
	
	@GetMapping("/go.commu.detail")
	public String goCommuDetail(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr) {
		 cDAO.getCommunity(c, model); 
		 cDAO.getCommunityPost(cp, model);
		 cDAO.getReplys(cp, model);
		
		model.addAttribute("commu_header_page", "community_detail_header.jsp"); 
		model.addAttribute("commu_contents_page", "community_detail_contents.jsp");
		return "community/community_page";
	}
	
	@GetMapping("/reg.reply")
	public String regReply(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr) {
		cDAO.regReply(cr);
		
		cDAO.getCommunity(c, model); 
		cDAO.getCommunityPost(cp, model);
		cDAO.getReplys(cp, model);
		
		model.addAttribute("commu_header_page", "community_detail_header.jsp"); 
		model.addAttribute("commu_contents_page", "community_detail_contents.jsp");
		return "community/community_page";
	}
	
	@GetMapping("/do.delete.post")
	public String doDeletePost(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr, HttpServletRequest request) {
		cDAO.deleteCommunityPost(cp, model);
		cDAO.getCommunity(c, model);
		cDAO.getAllCommunityPost(c, model);
		
		
		 model.addAttribute("commu_header_page", "community_post_header.jsp"); 
		 model.addAttribute("commu_contents_page", "community_post_contents.jsp"); 
		return "community/community_page";
	}
	
	
	@GetMapping("/go.writing.page")
	public String goWritingPage(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.getCommunity(c, model);
		
		 model.addAttribute("commu_header_page", "community_writing_header.jsp"); 
		 model.addAttribute("commu_contents_page", "community_writing_contents.jsp"); 
		return "community/community_page";
	}
	
	@GetMapping("/do.writing.page")
	public String doWritingPage(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.insertWritingPost(cp);
		
		cDAO.getCommunity(c, model);
		cDAO.getAllCommunityPost(c, model);
		 model.addAttribute("commu_header_page", "community_post_header.jsp"); 
		 model.addAttribute("commu_contents_page", "community_post_contents.jsp"); 
		return "community/community_page";
	}
	
	
	@GetMapping("/go.update.post")
	public String goUpdatePost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.getCommunity(c, model);
		cDAO.getCommunityPost(cp, model);
		
		model.addAttribute("commu_header_page", "community_updateWriting_header.jsp"); 
		model.addAttribute("commu_contents_page", "community_updateWriting_contents.jsp"); 
		return "community/community_page";
	}
	
	
	@GetMapping("/do.update.post")
	public String doUpdatePost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.updateCommunityPost(cp, model);
		cDAO.getCommunity(c, model);
		cDAO.getCommunityPost(cp, model);
		
		model.addAttribute("commu_header_page", "community_detail_header.jsp"); 
		model.addAttribute("commu_contents_page", "community_detail_contents.jsp");
		return "community/community_page";
	}
	
	@GetMapping("/do.made.post")
	public String doMadePost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.insertCommunityPost(c, model);
		cDAO.getAllCommunity (model); 
		
		model.addAttribute("commu_header_page", "community_main_header.jsp"); 
		model.addAttribute("commu_contents_page", "community_seach_main_contents.jsp"); 
		return "community/community_page";
	}
	
	
	

}
