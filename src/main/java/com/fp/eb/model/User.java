package com.fp.eb.model;

import lombok.Data;

@Data
public class User {

	private String username;
	private String password;
	
	// jwtAuthenticationFilter에서 유저 정보를 받을 때 사용됨. userDTO에 id, pw와 일치하는지 인증과정 후 토큰 발급.
}
