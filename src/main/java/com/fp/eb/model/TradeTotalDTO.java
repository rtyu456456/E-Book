package com.fp.eb.model;

import java.util.Date;

public class TradeTotalDTO {

	private int m_no;
	private int m_trade;
	private String m_to;
	private String m_from;
	private String m_txt;
	private Date m_when;
	private int m_check;

	private int t_no;
	private String t_owner;
	private String t_title;
	private String t_book_title;
	private String t_authors;
	private String t_publisher;
	private String t_contents;
	private int t_price;
	private String t_thumbnail;

	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_profile;
	private String u_email;
	private String u_gender;
	private int u_age;
	private String u_achievement;

	public TradeTotalDTO() {
		// TODO Auto-generated constructor stub
	}

	public TradeTotalDTO(int m_no, int m_trade, String m_to, String m_from, String m_txt, Date m_when, int m_check,
			int t_no, String t_owner, String t_title, String t_book_title, String t_authors, String t_publisher,
			String t_contents, int t_price, String t_thumbnail, String u_id, String u_pw, String u_name,
			String u_profile, String u_email, String u_gender, int u_age, String u_achievement) {
		super();
		this.m_no = m_no;
		this.m_trade = m_trade;
		this.m_to = m_to;
		this.m_from = m_from;
		this.m_txt = m_txt;
		this.m_when = m_when;
		this.m_check = m_check;
		this.t_no = t_no;
		this.t_owner = t_owner;
		this.t_title = t_title;
		this.t_book_title = t_book_title;
		this.t_authors = t_authors;
		this.t_publisher = t_publisher;
		this.t_contents = t_contents;
		this.t_price = t_price;
		this.t_thumbnail = t_thumbnail;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_profile = u_profile;
		this.u_email = u_email;
		this.u_gender = u_gender;
		this.u_age = u_age;
		this.u_achievement = u_achievement;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getM_trade() {
		return m_trade;
	}

	public void setM_trade(int m_trade) {
		this.m_trade = m_trade;
	}

	public String getM_to() {
		return m_to;
	}

	public void setM_to(String m_to) {
		this.m_to = m_to;
	}

	public String getM_from() {
		return m_from;
	}

	public void setM_from(String m_from) {
		this.m_from = m_from;
	}

	public String getM_txt() {
		return m_txt;
	}

	public void setM_txt(String m_txt) {
		this.m_txt = m_txt;
	}

	public Date getM_when() {
		return m_when;
	}

	public void setM_when(Date m_when) {
		this.m_when = m_when;
	}

	public int getM_check() {
		return m_check;
	}

	public void setM_check(int m_check) {
		this.m_check = m_check;
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public String getT_owner() {
		return t_owner;
	}

	public void setT_owner(String t_owner) {
		this.t_owner = t_owner;
	}

	public String getT_title() {
		return t_title;
	}

	public void setT_title(String t_title) {
		this.t_title = t_title;
	}

	public String getT_book_title() {
		return t_book_title;
	}

	public void setT_book_title(String t_book_title) {
		this.t_book_title = t_book_title;
	}

	public String getT_authors() {
		return t_authors;
	}

	public void setT_authors(String t_authors) {
		this.t_authors = t_authors;
	}

	public String getT_publisher() {
		return t_publisher;
	}

	public void setT_publisher(String t_publisher) {
		this.t_publisher = t_publisher;
	}

	public String getT_contents() {
		return t_contents;
	}

	public void setT_contents(String t_contents) {
		this.t_contents = t_contents;
	}

	public int getT_price() {
		return t_price;
	}

	public void setT_price(int t_price) {
		this.t_price = t_price;
	}

	public String getT_thumbnail() {
		return t_thumbnail;
	}

	public void setT_thumbnail(String t_thumbnail) {
		this.t_thumbnail = t_thumbnail;
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

	public String getU_achievement() {
		return u_achievement;
	}

	public void setU_achievement(String u_achievement) {
		this.u_achievement = u_achievement;
	}

	

}
