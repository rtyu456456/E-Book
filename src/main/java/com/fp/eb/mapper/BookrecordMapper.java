package com.fp.eb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fp.eb.model.BookrecordDTO;

@Mapper
public interface BookrecordMapper {

	List<BookrecordDTO> getBookIng();

	List<BookrecordDTO> getBookFin();

}
