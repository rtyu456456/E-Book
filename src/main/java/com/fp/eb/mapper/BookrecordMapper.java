package com.fp.eb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.BookrecordDTO;
import com.fp.eb.model.UserDTO;

@Mapper
public interface BookrecordMapper {

	List<BookrecordDTO> getBookIng();

	List<BookrecordDTO> getBookFin();

	int updateCurPage(BookrecordDTO brDTO);

	int getCurPage(BookrecordDTO brDTO);

	List<BookrecordDTO> getBookWish();

	int delWish(BookrecordDTO brDTO);

	int regIng(BookrecordDTO brDTO, UserDTO uDTO);

	int regIngModal(BookDTO bDTO, UserDTO uDTO);

	int getIngByNo(BookrecordDTO brDTO, UserDTO uDTO);

	int delBr(BookrecordDTO brDTO);

	int getIngCnt(UserDTO uDTO);

}
