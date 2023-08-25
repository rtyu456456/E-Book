package com.fp.eb.model;

import java.util.Date;

public class ReviewDTO {
	private int r_no;
	private String r_owner;
	private int r_b_no;
	private String r_contents;
	private int r_type;
	private int r_like;
	private int r_dislike;
	private Date r_date;
	private int positive_percentage;
	private String u_profile;
	
	private int likeCheck;
	
	
	public String getU_profile() {
		return u_profile;
	}
	

	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}

	public int getPositive_percentage() {
		return positive_percentage;
	}

	public void setPositive_percentage(int positive_percentage) {
		this.positive_percentage = positive_percentage;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_owner() {
		return r_owner;
	}

	public void setR_owner(String r_owner) {
		this.r_owner = r_owner;
	}

	public int getR_b_no() {
		return r_b_no;
	}

	public void setR_b_no(int r_b_no) {
		this.r_b_no = r_b_no;
	}

	public String getR_contents() {
		return r_contents;
	}

	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}

	public int getR_type() {
		return r_type;
	}

	public void setR_type(int r_type) {
		this.r_type = r_type;
	}

	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	public int getR_dislike() {
		return r_dislike;
	}

	public void setR_dislike(int r_dislike) {
		this.r_dislike = r_dislike;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
	
}
