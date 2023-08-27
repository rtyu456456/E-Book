package com.fp.eb.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fp.eb.model.Community;
import com.fp.eb.model.CommunityDTO;
import com.fp.eb.model.CommunityLikeDTO;
import com.fp.eb.model.CommunityPostDTO;
import com.fp.eb.model.CommunityReplyDTO;
import com.fp.eb.model.Time;

@Mapper
public interface CommunityMapper {

	
	// 여기는 인터페이스 (Mapper) 넣는 곳입니다.
	// 아래 src/main/resources의 mybatis 폴더 안에 잘 넣어둔 mapper에다가
	// 연결할 interface를 만드셔서 사용하시면 됩니다.
	
	// ********** 주의 사항 *****************
	// Spring MVC (Legacy)와 다르게 (우리가 쓰던거)
	// 여기는 Mapper interface에도 @Mapper라는 annotation(어노테이션)을 걸어줘야한답니다.
	// 여러분 잊지말고 다세요
	
	// 홈키퍼도 아니고 홈매퍼인 이유는
	// 홈 쓰지마 제발 컨트롤러에서
	

	List<CommunityDTO> getAllCommunity();

	CommunityDTO getCommunity(CommunityDTO c);
	
	List<CommunityPostDTO> getAllCommunityPost(CommunityDTO c);

	CommunityPostDTO getCommunityPost(CommunityPostDTO cp);

	List<CommunityReplyDTO> getAllReplys(CommunityPostDTO cp);
	
	List<CommunityReplyDTO> commentMyPost();
	
	int getCountReplys(BigDecimal bigDecimal);

	int deleteCommunityPost(CommunityPostDTO cp);

	int updateCommunityPost(CommunityPostDTO cp);

	List<CommunityDTO>  seachAllCommunity(CommunityDTO c);

	int insertCommunity(CommunityDTO c);

	int insertWritingPost(CommunityPostDTO cp);
	
	int regReply(CommunityReplyDTO cr);

	List<CommunityPostDTO> seachAllCommunityPost(CommunityPostDTO cp);

	List<CommunityPostDTO> getAllMyPost(CommunityPostDTO cp);

	List<CommunityPostDTO> getAllMyReply(CommunityReplyDTO cr);

	int deleteMyReply(CommunityReplyDTO cr);

	int insertPinnedCommu(CommunityLikeDTO cl);

	List<CommunityLikeDTO> getAllPinnedCommu();

	int updatePinnedCommuZero(CommunityLikeDTO cl);

	int updatePinnedCommuOne(CommunityLikeDTO cl);
	
	int checkPinnedCommu(CommunityLikeDTO cl);
	
	int cheakPinnedTypeCommu(CommunityLikeDTO cl);

	
	
}
