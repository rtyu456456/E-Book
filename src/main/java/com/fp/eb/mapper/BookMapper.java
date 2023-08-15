package com.fp.eb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fp.eb.model.BookDTO;

@Mapper
public interface BookMapper {
	
	List<BookDTO> getBooks(); 
	
	BookDTO getBookByISBN(BookDTO bDTO);
	
	int regBook(BookDTO bDTO);
}
