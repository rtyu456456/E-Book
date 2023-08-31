package com.fp.eb.controller;

import java.sql.Time;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.eb.model.CommunityDTO;
import com.fp.eb.model.CommunityLikeDTO;
import com.fp.eb.model.CommunityPinned;
import com.fp.eb.model.CommunityPostDTO;
import com.fp.eb.model.CommunityReplyDTO;
import com.fp.eb.model.UserDTO;
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
	public String goCommunityMain(Model model, CommunityPostDTO cp, HttpServletRequest req, UserDTO uDTO) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id()); // 세션에 실린 유저 값을 넘겨주는것
		getPinndedCommu(req, uDTO);
		cDAO.commentAlarm(model, uDTO);
		cDAO.getAllCommunity(model);

		model.addAttribute("commu_header_page", "community_main_header.jsp");
		model.addAttribute("commu_contents_page", "community_main_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/comment.my.post")
	public String getMyReply(Model model, UserDTO uDTO, HttpServletRequest req) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id()); // 세션에 실린 유저 값을 넘겨주는것
		cDAO.commentMyPost(model, uDTO);

		model.addAttribute("commu_header_page", "community_commentMyPost_header.jsp");
		model.addAttribute("commu_contents_page", "community_commentMyPost_contents.jsp");
		return "community/community_page";
	}

	@RequestMapping(value = "/get.pinned.commu", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody CommunityPinned getPinndedCommu(HttpServletRequest req, UserDTO uDTO) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());
		System.out.println("aaaa");
		return cDAO.getAllPinnedCommu(uDTO);
	}

	@RequestMapping(value = "/do.pinned.commu", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody CommunityPinned doPinndedCommu(Model model, HttpServletRequest req, CommunityLikeDTO cl,
			UserDTO uDTO) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());
		System.out.println(uDTO);
		cDAO.checkPinnedCommu(cl, uDTO);
		return cDAO.getAllPinnedCommu(uDTO);
	}

	@RequestMapping(value = "/update.pinned.commu", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody CommunityPinned updatePinndedCommu(CommunityLikeDTO cl, UserDTO uDTO, HttpServletRequest req) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());
		cDAO.updatePinnedCommuZero(cl);
		return cDAO.getAllPinnedCommu(uDTO);
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
		cDAO.getAllCommunity(model);

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
	public String goBoard(Model model, CommunityDTO c, CommunityPostDTO cp, UserDTO uDTO, HttpServletRequest req) {

		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());
		cDAO.commentMyPost(model, uDTO);
		cDAO.getCommunity(c, model);
		cDAO.getAllCommunityPost(c, model);

		model.addAttribute("commu_header_page", "community_post_header.jsp");
		model.addAttribute("commu_contents_page", "community_post_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/go.my.post")
	public String goMyPost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.getAllMyPost(cp, model);

		model.addAttribute("commu_header_page", "community_mypost_header.jsp");
		model.addAttribute("commu_contents_page", "community_mypost_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/delete.my.post")
	public String deleteMyPost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.deleteCommunityPost(cp, model);
		cDAO.getAllMyPost(cp, model);

		model.addAttribute("commu_header_page", "community_mypost_header.jsp");
		model.addAttribute("commu_contents_page", "community_mypost_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/delete.my.reply")
	public String deleteMyReply(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr) {
		cDAO.deleteMyReply(cr, model);

		cDAO.getCommunity(c, model);
		cDAO.getCommunityPost(cp, model);
		cDAO.getReplys(cp, model);
		cDAO.getCountReplys(cp.getCp_no(), model);

		model.addAttribute("commu_header_page", "community_detail_header.jsp");
		model.addAttribute("commu_contents_page", "community_detail_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/go.my.reply")
	public String goMyReply(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr) {
		cDAO.getAllMyReply(cr, model);

		model.addAttribute("commu_header_page", "community_myreply_header.jsp");
		model.addAttribute("commu_contents_page", "community_myreply_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/go.seach.post")
	public String goSeachPost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.getCommunity(c, model);

		model.addAttribute("commu_header_page", "community_seach_post_header.jsp");
		model.addAttribute("commu_contents_page", "community_seach_post_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/do.seach.post")
	public String doSeachPost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.seachCommunityPost(cp, model);
		cDAO.getCommunity(c, model);

		model.addAttribute("commu_header_page", "community_post_header.jsp");
		model.addAttribute("commu_contents_page", "community_post_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/go.commu.detail.mycomment")
	public String goCommuDetailMyComment(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr, UserDTO uDTO,
			HttpServletRequest req) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());

		cDAO.getUserImg(cp, model);
		cDAO.getCommunity(c, model);
		cDAO.getCommunityPost(cp, model);
		cDAO.getReplys(cp, model);
		cDAO.getCountReplys(cp.getCp_no(), model);

		cDAO.updateCheckComment(cr);

		model.addAttribute("commu_header_page", "community_detail_header.jsp");
		model.addAttribute("commu_contents_page", "community_detail_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/go.commu.detail")
	public String goCommuDetail(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr, UserDTO uDTO,
			HttpServletRequest req) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());
		
		cDAO.getUserImg(cp, model);
		cDAO.getCommunity(c, model);
		cDAO.getCommunityPost(cp, model);
		cDAO.getReplys(cp, model);
		cDAO.getCountReplys(cp.getCp_no(), model);
		
		
		model.addAttribute("commu_header_page", "community_detail_header.jsp");
		model.addAttribute("commu_contents_page", "community_detail_contents.jsp");
		return "community/community_page";
	}
	@GetMapping("/reg.reply")
	public String regReply(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr, UserDTO uDTO,
			HttpServletRequest req) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());

		cDAO.regReply(cr, uDTO);
		cDAO.getCountReplys(cp.getCp_no(), model);
		cDAO.getUserImg(cp, model);
		cDAO.getCommunity(c, model);
		cDAO.getCommunityPost(cp, model);
		cDAO.getReplys(cp, model);

		model.addAttribute("commu_header_page", "community_detail_header.jsp");
		model.addAttribute("commu_contents_page", "community_detail_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/do.delete.post")
	public String doDeletePost(Model model, CommunityDTO c, CommunityPostDTO cp, CommunityReplyDTO cr,
			HttpServletRequest request) {
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
	public String doWritingPage(Model model, CommunityDTO c, CommunityPostDTO cp, HttpServletRequest req,
			UserDTO uDTO) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());

		cDAO.insertWritingPost(cp, uDTO);

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
	public String doUpdatePost(Model model, CommunityDTO c, CommunityPostDTO cp, HttpServletRequest req, UserDTO uDTO) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user"); // 세션에 실린 유저값
		uDTO.setU_id(user.getU_id());
		cDAO.getUserImg(cp, model);
		cDAO.updateCommunityPost(cp, model);
		cDAO.getCommunity(c, model);
		cDAO.getCommunityPost(cp, model);

		cDAO.getReplys(cp, model);
		cDAO.getCountReplys(cp.getCp_no(), model);

		model.addAttribute("commu_header_page", "community_detail_header.jsp");
		model.addAttribute("commu_contents_page", "community_detail_contents.jsp");
		return "community/community_page";
	}

	@GetMapping("/do.made.post")
	public String doMadePost(Model model, CommunityDTO c, CommunityPostDTO cp) {
		cDAO.insertCommunityPost(c, model);
		cDAO.getAllCommunity(model);

		model.addAttribute("commu_header_page", "community_main_header.jsp");
		model.addAttribute("commu_contents_page", "community_seach_main_contents.jsp");
		return "community/community_page";
	}

}
