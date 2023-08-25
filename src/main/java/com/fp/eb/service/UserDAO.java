package com.fp.eb.service;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fp.eb.mapper.UserMapper;
import com.fp.eb.model.UserDTO;

@Service
public class UserDAO {

	@Autowired
	private UserMapper uMapper;
	
	@Autowired
	private BCryptPasswordEncoder bEncoder;

	public void regUser(HttpServletRequest req, UserDTO uDTO) {
		uDTO.setU_pw(bEncoder.encode(uDTO.getU_pw()));
		if (uMapper.regUser(uDTO) == 1) {
			System.out.println("등록성공");
		} else {
			System.out.println("등록실패...");
		}

	}

	public void login(HttpServletRequest req, UserDTO uDTO, String id) {
		UserDTO dbMember = uMapper.getUserById(id);

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
	
	public UserDTO getUserByID(String id) {
		return uMapper.getUserById(id);
	}

	public void login2(HttpServletRequest req, UserDTO uDTO) {
		UserDTO dbMember = uMapper.getUserById(uDTO.getU_id());
		System.out.println(">>" + dbMember);
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
