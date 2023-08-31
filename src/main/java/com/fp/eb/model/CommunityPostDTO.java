package com.fp.eb.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class CommunityPostDTO {

	private BigDecimal cp_no;
	private String cp_owner;
	private String cp_title;
	private String cp_contents;
	private int cp_community;
	private int cp_like;
	private int cp_dislike;
	private Date cp_date;
	private String cp_date2;
	private int cp_reviewCnt;
	private String cp_seach;
	
	
	private int c_no;
	private int likeCheck;
	
	
	
	
	






	public BigDecimal getCp_no() {
		return cp_no;
	}







	public void setCp_no(BigDecimal cp_no) {
		this.cp_no = cp_no;
	}







	public String getCp_owner() {
		return cp_owner;
	}







	public void setCp_owner(String cp_owner) {
		this.cp_owner = cp_owner;
	}







	public String getCp_title() {
		return cp_title;
	}







	public void setCp_title(String cp_title) {
		this.cp_title = cp_title;
	}







	public String getCp_contents() {
		return cp_contents;
	}







	public void setCp_contents(String cp_contents) {
		this.cp_contents = cp_contents;
	}







	public int getCp_community() {
		return cp_community;
	}







	public void setCp_community(int cp_community) {
		this.cp_community = cp_community;
	}







	public int getCp_like() {
		return cp_like;
	}







	public void setCp_like(int cp_like) {
		this.cp_like = cp_like;
	}







	public int getCp_dislike() {
		return cp_dislike;
	}







	public void setCp_dislike(int cp_dislike) {
		this.cp_dislike = cp_dislike;
	}







	public Date getCp_date() {
		return cp_date;
	}







	public void setCp_date(Date cp_date) {
		this.cp_date = cp_date;
		this.cp_date2 = Time.calculateTime(cp_date);
	}







	public String getCp_date2() {
		return cp_date2;
	}







	public void setCp_date2(String cp_date2) {
		this.cp_date2 = cp_date2;
	}







	public int getCp_reviewCnt() {
		return cp_reviewCnt;
	}







	public void setCp_reviewCnt(int cp_reviewCnt) {
		this.cp_reviewCnt = cp_reviewCnt;
	}







	public String getCp_seach() {
		return cp_seach;
	}







	public void setCp_seach(String cp_seach) {
		this.cp_seach = cp_seach;
	}







	public int getC_no() {
		return c_no;
	}







	public void setC_no(int c_no) {
		this.c_no = c_no;
	}







	public int getLikeCheck() {
		return likeCheck;
	}







	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}







	@Override
	public String toString() {
		return "CommunityPostDTO [cp_no=" + cp_no + ", cp_owner=" + cp_owner + ", cp_title=" + cp_title
				+ ", cp_contents=" + cp_contents + ", cp_community=" + cp_community + ", cp_like=" + cp_like
				+ ", cp_dislike=" + cp_dislike + ", cp_date=" + cp_date + "]";
	}

}
