package com.fp.eb.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fp.eb.mapper.TradeMapper;
import com.fp.eb.mapper.UserMapper;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.UserDTO;

@Service
public class UserDAO {

	@Autowired
	private UserMapper uMapper;

	@Autowired
	private BCryptPasswordEncoder bEncoder;

	@Autowired
	private ServletContext uploadPath;

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
		System.out.println(uDTO.getU_pw());
		System.out.println(">>" + dbMember);
		if (dbMember != null) {
			if (bEncoder.matches(uDTO.getU_pw(), dbMember.getU_pw())) {
				System.out.println("세션에 넣기 성공");
				req.getSession().setAttribute("user", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 60);
			} else {
				req.setAttribute("result", "password error!");
				return;
			}
		} else {
			req.setAttribute("result", "can't find user");
			return;
		}

	}

	public int pwCheck(HttpServletRequest req, UserDTO uDTO) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user");
		uDTO.setU_id(user.getU_id());
		UserDTO dbMember = uMapper.getUserById(uDTO.getU_id());
		System.out.println(uDTO.getU_pw());

		if (dbMember != null) {
			if (bEncoder.matches(uDTO.getU_pw(), dbMember.getU_pw())) {
				System.out.println("비밀번호 일치");
				return 1;
			} else {
				System.out.println("비밀번호 불일치");
				return 0;
			}
		}
		System.out.println("아이디가 업어");
		return 0;
	}

	public void delUser(HttpServletRequest req, UserDTO uDTO) {
		UserDTO user = (UserDTO) req.getSession().getAttribute("user");
		uDTO.setU_id(user.getU_id());
		System.out.println(uDTO.getU_id());
		if (uMapper.delUser(uDTO) == 1) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}

	}

	// ---------------------------------------- 유저정보 수정

	public void updateUser(UserDTO uDTO, HttpServletRequest req) {

		System.out.println(uDTO);
		UserDTO user = (UserDTO) req.getSession().getAttribute("user");
		
		uDTO.setU_id(user.getU_id());
		
		if(uDTO.getU_pw() != null) {
			uDTO.setU_pw(bEncoder.encode(uDTO.getU_pw()));
		} else {
			uDTO.setU_pw("nono");
		}
		
		String path = uploadPath.getRealPath("userProfile");
		System.out.println(path);

		if (uDTO.getU_file() != null) {
			try {
				String orgFileName = uDTO.getU_file().getOriginalFilename();
				String saveFileName = UUID.randomUUID().toString().split("-")[0]
						+ orgFileName.substring(orgFileName.lastIndexOf("."), orgFileName.length());
				System.out.println(orgFileName);
				System.out.println(saveFileName);
				System.out.println("----------------");
				String rootPath = req.getServletContext().getRealPath("/");
				System.out.println(rootPath);
				if (!uDTO.getU_file().getOriginalFilename().isEmpty()) { // 실제 업로드 코드
					uDTO.getU_file().transferTo(new File(path, saveFileName));
					req.setAttribute("r", "file uploaded successfully!");
					req.setAttribute("fileName", saveFileName);
					uDTO.setU_profile("userProfile/" + saveFileName);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			if (uMapper.updateUser(uDTO) == 1) {
				System.out.println("등록성공");
				req.getSession().setAttribute("user", uMapper.getUserById(uDTO.getU_id()));
			} else {
				req.setAttribute("result", "등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
