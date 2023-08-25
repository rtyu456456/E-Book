package com.fp.eb.model;

import java.util.Date;

import lombok.Data;


@Data
public class UserDTO {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_profile;
	private String u_email;
	private String u_gender;
	private int u_age;
	private Date u_login;
	private int u_login_streak;
	private int u_login_total;
//	private BigDecimal u_login; 
//	private BigDecimal u_login_streak;
//	private BigDecimal u_login_total;
	private String u_achievement;
	private String u_achievement_show;
	private String u_auth;

	
	
}
