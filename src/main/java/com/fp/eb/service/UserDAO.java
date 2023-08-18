package com.fp.eb.service;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.eb.mapper.UserMapper;
import com.fp.eb.model.UserDTO;

@Service
public class UserDAO {

	@Autowired
	private UserMapper uMapper;

	public void regUser(HttpServletRequest req, UserDTO uDTO) {

		if (uMapper.regUser(uDTO) == 1) {
			System.out.println("등록성공");
		} else {
			System.out.println("등록실패...");
		}

	}

	public void login(HttpServletRequest req, UserDTO uDTO) {
		UserDTO dbMember = uMapper.getUserById(uDTO);

		if (dbMember != null) {
			if (uDTO.getU_pw().equals(dbMember.getU_pw())) {
				req.getSession().setAttribute("user", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				req.setAttribute("result", "password error!");
			}
		} else {
			req.setAttribute("result", "can't find user");
		}

	}

}
