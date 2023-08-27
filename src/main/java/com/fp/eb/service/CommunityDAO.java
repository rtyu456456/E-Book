package com.fp.eb.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.CommunityMapper;
import com.fp.eb.model.CommunityDTO;
import com.fp.eb.model.CommunityLikeDTO;
import com.fp.eb.model.CommunityPinned;
import com.fp.eb.model.CommunityPostDTO;
import com.fp.eb.model.CommunityReplyDTO;

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
		List<CommunityPostDTO> posts = ss.getMapper(CommunityMapper.class).getAllCommunityPost(c);
		for (CommunityPostDTO cp : posts) {
			cp.setCp_reviewCnt(getCountReplys(cp.getCp_no()));
		}

		model.addAttribute("communityPosts", posts);
	}

	public void getCommunityPost(CommunityPostDTO cp, Model model) {
		model.addAttribute("communityPost", ss.getMapper(CommunityMapper.class).getCommunityPost(cp));
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

	public void insertWritingPost(CommunityPostDTO cp) {
		if (ss.getMapper(CommunityMapper.class).insertWritingPost(cp) == 1) {
			System.out.println("글쓰기 등록 성공");
		} else {
			System.out.println("글쓰기 등록 실패");
		}

	}

	public void regReply(CommunityReplyDTO cr) {
		if (ss.getMapper(CommunityMapper.class).regReply(cr) == 1) {
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

	public void insertPinnedCommu(CommunityLikeDTO cl) {
		if (ss.getMapper(CommunityMapper.class).insertPinnedCommu(cl) == 1) {
			System.out.println("핀 등록 성공");
		} else {
			System.out.println("핀 등록 실패");
		}

	}

	public CommunityPinned getAllPinnedCommu() {
	 return new CommunityPinned((ss.getMapper(CommunityMapper.class).getAllPinnedCommu()));
	}

	public int updatePinnedCommuZero(CommunityLikeDTO cl) {
		if (ss.getMapper(CommunityMapper.class).updatePinnedCommuZero(cl) == 1) {
			System.out.println("핀 0으로 업뎃 성공");
		} else {
			System.out.println("핀 0으로 업뎃 실패");
		}
		return ss.getMapper(CommunityMapper.class).updatePinnedCommuZero(cl);
	}

	public void checkPinnedCommu(CommunityLikeDTO cl) {
		if (ss.getMapper(CommunityMapper.class).checkPinnedCommu(cl) == 1) {
			if ((ss.getMapper(CommunityMapper.class).cheakPinnedTypeCommu(cl) == 0)) {
				ss.getMapper(CommunityMapper.class).updatePinnedCommuOne(cl);
				System.out.println("핀 1로 업뎃 성공");
			} else {
				System.out.println("이미 등록된 커뮤니티 입니다.");
				return;

			}
		} else if (ss.getMapper(CommunityMapper.class).checkPinnedCommu(cl) == 0) {
			insertPinnedCommu(cl);
			System.out.println("등록 성공");
		}

	}

	public void commentMyPost(Model model) {
		model.addAttribute("comment", ss.getMapper(CommunityMapper.class).commentMyPost());
	}

}
