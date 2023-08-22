package com.fp.eb.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.eb.mapper.BookrecordMapper;
import com.fp.eb.model.BookrecordDTO;
import com.fp.eb.model.UserDTO;

@Service
public class BookrecordDAO {

	@Autowired
	BookrecordMapper brMapper;

	public void getBookIng(HttpServletRequest req) {

		req.setAttribute("bookrecords", brMapper.getBookIng());

	}

	public void getBookFin(HttpServletRequest req) {

		req.setAttribute("bookrecords", brMapper.getBookFin());

	}

	public int getPage(BookrecordDTO brDTO) {

		brMapper.updateCurPage(brDTO);
		// br_page update
		return brMapper.getCurPage(brDTO);
		// get br_page
	}

	public void getBookWish(HttpServletRequest req) {

		req.setAttribute("bookrecords", brMapper.getBookWish());

	}

	public void delWish(BookrecordDTO brDTO) {

		brMapper.delWish(brDTO);
	}

	public void delBr(BookrecordDTO brDTO) {
		brMapper.delBr(brDTO);
	}

	public void regIng(BookrecordDTO brDTO, UserDTO uDTO) {
		System.out.println(brDTO.getB_no());
		System.out.println(brDTO.getLr_no());
		if (brMapper.getIngByNo(brDTO, uDTO) == 0) {
			brMapper.regIng(brDTO, uDTO);
		}
		
		brMapper.delWish(brDTO);
	}


}
