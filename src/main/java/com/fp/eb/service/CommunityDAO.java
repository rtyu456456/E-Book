package com.fp.eb.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.CommunityMapper;
import com.fp.eb.mapper.MainMapper;
import com.fp.eb.model.CommunityDTO;
import com.fp.eb.model.CommunityLikeDTO;
import com.fp.eb.model.CommunityPinned;
import com.fp.eb.model.CommunityPostDTO;
import com.fp.eb.model.CommunityReplyDTO;
import com.fp.eb.model.LikeDTO;
import com.fp.eb.model.UserDTO;

@Service
public class CommunityDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private MainMapper mainMapper;
	
	public void getAllCommunity(Model model) {
		model.addAttribute("communitys", ss.getMapper(CommunityMapper.class).getAllCommunity());
	}

	public void getCommunity(CommunityDTO c, Model model) {
		model.addAttribute("community", ss.getMapper(CommunityMapper.class).getCommunity(c));
	}

	public void getAllCommunityPost(CommunityDTO c, Model model, HttpServletRequest req) {
		List<CommunityPostDTO> posts = ss.getMapper(CommunityMapper.class).getAllCommunityPost(c);
		LikeDTO likeDTO = new LikeDTO();
		UserDTO user = (UserDTO) req.getSession().getAttribute("user");
		if (user != null) {
			likeDTO.setLr_owner(user.getU_id());
			likeDTO.setLr_where_type("CP");
		}
		for (CommunityPostDTO cpd : posts) {
			cpd.setCp_reviewCnt(getCountReplys(cpd.getCp_no()));
			System.out.println(cpd.getCp_no());
			likeDTO.setLr_where_no(cpd.getCp_no().intValue());
			if (user != null) {
				if (mainMapper.getLikeInfo(likeDTO) != null) {
					
					cpd.setLikeCheck(mainMapper.getLikeInfo(likeDTO).getLr_type());
					System.out.println(mainMapper.getLikeInfo(likeDTO).getLr_type());
					Map<String, Object> likeDislike = mainMapper.likeDislikeCount(likeDTO);
					System.out.println("-----------------");
					System.out.println(likeDislike);
					System.out.println(likeDislike.get("LIKE_COUNT"));
					System.out.println(likeDislike.get("DISLIKE_COUNT"));
					BigDecimal like = (BigDecimal) likeDislike.get("LIKE_COUNT");
					BigDecimal dislike = (BigDecimal) likeDislike.get("DISLIKE_COUNT");
					cpd.setCp_like(like.intValue());
					cpd.setCp_dislike(dislike.intValue());
					System.out.println("-----------------");
				}
			}
		}
	
		
		
		
		
		
		
		model.addAttribute("communityPosts", posts);
	}
	
	public void getCommunityPost(CommunityPostDTO cp, Model model, CommunityDTO c, HttpServletRequest req) {

		LikeDTO likeDTO = new LikeDTO();
		UserDTO user = (UserDTO) req.getSession().getAttribute("user");
		CommunityPostDTO post = ss.getMapper(CommunityMapper.class).getCommunityPost(cp);
		if (user != null) {
			likeDTO.setLr_owner(user.getU_id());
			likeDTO.setLr_where_type("CP");
			BigDecimal cpno = cp.getCp_no();
			System.out.println(cpno);
			likeDTO.setLr_where_no(cpno.intValue());
			if(mainMapper.likeCheck(likeDTO) != null){
				post.setLikeCheck(Integer.parseInt(mainMapper.likeCheck(likeDTO)));
			}
			
			
			Map<String, Object> like_dislike = mainMapper.likeDislikeCount(likeDTO);
			BigDecimal like = (BigDecimal)like_dislike.get("LIKE_COUNT");
			BigDecimal dislike = (BigDecimal)like_dislike.get("DISLIKE_COUNT");
			System.out.println(like);
			System.out.println(dislike);
			post.setCp_like(like.intValue());
			post.setCp_dislike(dislike.intValue());
		}
		
		model.addAttribute("communityPost", post);
	}

	
	
	public void getReplys(CommunityPostDTO cp, Model model) {
		model.addAttribute("communityReplys", ss.getMapper(CommunityMapper.class).getAllReplys(cp));
	}

	public void getCountReplys(BigDecimal bigDecimal, Model model) {
		model.addAttribute("countReplys", ss.getMapper(CommunityMapper.class).getCountReplys(bigDecimal));
	}

	private int getCountReplys(BigDecimal cp_no) {
		return ss.getMapper(CommunityMapper.class).getCountReplys(cp_no);
	}

	public void deleteCommunityPost(CommunityPostDTO cp, Model model) {

		if (ss.getMapper(CommunityMapper.class).deleteCommunityPost(cp) == 1) {
			System.out.println("커뮤니티 삭제 성공");
		} else {
			System.out.println("커뮤니티 삭제 실패");
		}

	}

	public void updateCommunityPost(CommunityPostDTO cp, Model model) {
		if (ss.getMapper(CommunityMapper.class).updateCommunityPost(cp) == 1) {
			System.out.println("커뮤니티 업뎃 성공");
		} else {
			System.out.println("커뮤니티 업뎃 실패");
		}

	}

	public void seachCommunity(CommunityDTO c, Model model) {
			model.addAttribute("communitys", ss.getMapper(CommunityMapper.class).seachAllCommunity(c));
	}

	public void insertCommunityPost(CommunityDTO c, Model model) {
		if (ss.getMapper(CommunityMapper.class).insertCommunity(c) == 1) {
			System.out.println("커뮤니티 등록 성공");
		} else {
			System.out.println("커뮤니티 등록 실패");
		}
	}

	public void insertWritingPost(CommunityPostDTO cp, UserDTO uDTO) {
		if (ss.getMapper(CommunityMapper.class).insertWritingPost(cp, uDTO) == 1) {
			System.out.println("글쓰기 등록 성공");
		} else {
			System.out.println("글쓰기 등록 실패");
		}

	}

	public void regReply(CommunityReplyDTO cr,  UserDTO uDTO) {
		if (ss.getMapper(CommunityMapper.class).regReply(cr, uDTO) == 1) {
			System.out.println("댓글 등록 성공");
		} else {
			System.out.println("댓글 등록 실패");
		}

	}

	public void seachCommunityPost(CommunityPostDTO cp, Model model) {
		List<CommunityPostDTO> posts = ss.getMapper(CommunityMapper.class).seachAllCommunityPost(cp);
		for (CommunityPostDTO scp : posts) {
			scp.setCp_reviewCnt(getCountReplys(scp.getCp_no()));
		}

		model.addAttribute("communityPosts", posts);
	}

	public void getAllMyPost(CommunityPostDTO cp, Model model) {
		List<CommunityPostDTO> posts = ss.getMapper(CommunityMapper.class).getAllMyPost(cp);
		for (CommunityPostDTO scp : posts) {
			scp.setCp_reviewCnt(getCountReplys(scp.getCp_no()));
		}

		model.addAttribute("communityPosts", posts);
	}

	public void getAllMyReply(CommunityReplyDTO cr, Model model) {
		List<CommunityPostDTO> posts = ss.getMapper(CommunityMapper.class).getAllMyReply(cr);
		for (CommunityPostDTO scp : posts) {
			scp.setCp_reviewCnt(getCountReplys(scp.getCp_no()));
		}

		model.addAttribute("communityPosts", posts);

	}

	public void deleteMyReply(CommunityReplyDTO cr, Model model) {
		if (ss.getMapper(CommunityMapper.class).deleteMyReply(cr) == 1) {
			System.out.println("내 댓글 삭제 성공");
		} else {
			System.out.println("내 댓글 삭제 실패");
		}
	}

	public void insertPinnedCommu(CommunityLikeDTO cl, UserDTO uDTO) {
		if (ss.getMapper(CommunityMapper.class).insertPinnedCommu(cl, uDTO) == 1) {
			System.out.println("핀 등록 성공");
		} else {
			System.out.println("핀 등록 실패");
		}

	}

	public CommunityPinned getAllPinnedCommu(UserDTO uDTO) {
	 return new CommunityPinned((ss.getMapper(CommunityMapper.class).getAllPinnedCommu(uDTO)));
	}

	public int updatePinnedCommuZero(CommunityLikeDTO cl) {
		if (ss.getMapper(CommunityMapper.class).updatePinnedCommuZero(cl) == 1) {
			System.out.println("핀 0으로 업뎃 성공");
		} else {
			System.out.println("핀 0으로 업뎃 실패");
		}
		return ss.getMapper(CommunityMapper.class).updatePinnedCommuZero(cl);
	}

	public void checkPinnedCommu(CommunityLikeDTO cl, UserDTO uDTO) {
		if (ss.getMapper(CommunityMapper.class).checkPinnedCommu(cl, uDTO) == 1) {
			if ((ss.getMapper(CommunityMapper.class).cheakPinnedTypeCommu(cl, uDTO) == 0)) {
				ss.getMapper(CommunityMapper.class).updatePinnedCommuOne(cl);
				System.out.println("핀 1로 업뎃 성공");
			} else {
				System.out.println("이미 등록된 커뮤니티 입니다.");
				return;

			}
		} else if (ss.getMapper(CommunityMapper.class).checkPinnedCommu(cl, uDTO) == 0) {
			insertPinnedCommu(cl, uDTO);
			System.out.println("등록 성공");
		}

	}

	public void commentMyPost(Model model, UserDTO uDTO) {
		model.addAttribute("comment", ss.getMapper(CommunityMapper.class).commentMyPost(uDTO));
	}

	public void updateCheckComment(CommunityReplyDTO cr) {
		
		if (ss.getMapper(CommunityMapper.class).updateCheckComment(cr) == 1) {
			System.out.println("like 1로 업뎃 성공");
		} else {
			System.out.println("like 1로 업뎃 실패");
		}
	}

	public void commentAlarm(Model model, UserDTO uDTO) {
		model.addAttribute("commentAlarm", ss.getMapper(CommunityMapper.class).commentAlarm(uDTO));
	}

	public void getUserImg(CommunityPostDTO cp, Model model) {
		model.addAttribute("userimg", ss.getMapper(CommunityMapper.class).getUserImg(cp));
		
	}


}
