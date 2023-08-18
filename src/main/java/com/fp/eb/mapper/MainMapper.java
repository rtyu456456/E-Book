package com.fp.eb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.ReviewDTO;

@Mapper
public interface MainMapper {

	public List<BookDTO> bookSearch(String searchOption, String searchText);

	public BookDTO bookDetail(BookDTO bDTO);

	public List<ReviewDTO> reviews(BookDTO bDTO);

	
}

// 여기는 인터페이스 (Mapper) 넣는 곳입니다.
// 아래 src/main/resources의 mybatis 폴더 안에 잘 넣어둔 mapper에다가
// 연결할 interface를 만드셔서 사용하시면 됩니다.

// ********** 주의 사항 *****************
// Spring MVC (Legacy)와 다르게 (우리가 쓰던거)
// 여기는 Mapper interface에도 @Mapper라는 annotation(어노테이션)을 걸어줘야한답니다.
// 여러분 잊지말고 다세요

// 홈키퍼도 아니고 홈매퍼인 이유는
// 홈 쓰지마 제발 컨트롤러에서