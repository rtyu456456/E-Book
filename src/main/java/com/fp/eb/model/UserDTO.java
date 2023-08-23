package com.fp.eb.model;

import java.math.BigDecimal;

import java.util.Date;


public class UserDTO {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_profile;
	private String u_email;
	private String u_gender;
	private int u_age;
	private int u_login;
	private int u_login_streak;
	private int u_login_total;
//	private BigDecimal u_login; 
//	private BigDecimal u_login_streak;
//	private BigDecimal u_login_total;
	private String u_achievement;
	private String u_achievement_show;

	public UserDTO() {
		// TODO Auto-generated constructor stub
	}

	public UserDTO(String u_id, String u_pw, String u_name, String u_profile, String u_email, String u_gender,
			int u_age, int u_login, int u_login_streak, int u_login_total, String u_achievement,
			String u_achievement_show) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_profile = u_profile;
		this.u_email = u_email;
		this.u_gender = u_gender;
		this.u_age = u_age;
		this.u_login = u_login;
		this.u_login_streak = u_login_streak;
		this.u_login_total = u_login_total;
		this.u_achievement = u_achievement;
		this.u_achievement_show = u_achievement_show;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_profile() {
		return u_profile;
	}

	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public int getU_age() {
		return u_age;
	}

	public void setU_age(int u_age) {
		this.u_age = u_age;
	}

	public int getU_login() {
		return u_login;
	}

	public void setU_login(int u_login) {
		this.u_login = u_login;
	}

	public int getU_login_streak() {
		return u_login_streak;
	}

	public void setU_login_streak(int u_login_streak) {
		this.u_login_streak = u_login_streak;
	}

	public int getU_login_total() {
		return u_login_total;
	}

	public void setU_login_total(int u_login_total) {
		this.u_login_total = u_login_total;
	}

	public String getU_achievement() {
		return u_achievement;
	}

	public void setU_achievement(String u_achievement) {
		this.u_achievement = u_achievement;
	}

	public String getU_achievement_show() {
		return u_achievement_show;
	}

	public void setU_achievement_show(String u_achievement_show) {
		this.u_achievement_show = u_achievement_show;
	}

	@Override
	public String toString() {
		return "UserDTO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_profile=" + u_profile
				+ ", u_email=" + u_email + ", u_gender=" + u_gender + ", u_age=" + u_age + ", u_login=" + u_login
				+ ", u_login_streak=" + u_login_streak + ", u_login_total=" + u_login_total + ", u_achievement="
				+ u_achievement + ", u_achievement_show=" + u_achievement_show + "]";
	}

	
}
