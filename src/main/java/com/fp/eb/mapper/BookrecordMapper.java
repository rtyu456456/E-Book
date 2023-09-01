package com.fp.eb.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.BookrecordDTO;
import com.fp.eb.model.ReviewDTO;
import com.fp.eb.model.UserDTO;

@Mapper
public interface BookrecordMapper {

	List<BookrecordDTO> getBookIng(UserDTO uDTO);

	List<BookrecordDTO> getBookFin(int cur_year, int cur_month, UserDTO uDTO);

	int updateCurPage(BookrecordDTO brDTO);

	int getCurPage(BookrecordDTO brDTO);

	List<BookrecordDTO> getBookWish(UserDTO uDTO);

	int delWish(BookrecordDTO brDTO);

	int regIng(BookrecordDTO brDTO, UserDTO uDTO);

	int regIngModal(BookDTO bDTO, UserDTO uDTO);

	int getIngByNo(BookrecordDTO brDTO, UserDTO uDTO);

	int delBr(BookrecordDTO brDTO);

	int getIngCnt(UserDTO uDTO);

	int regReview(UserDTO uDTO, ReviewDTO rDTO);

	int reviewCheck(ReviewDTO rDTO, UserDTO uDTO);

	BookrecordDTO getReviewBook(ReviewDTO rDTO, UserDTO uDTO);

	int updateReview(ReviewDTO rDTO);

}
