package com.fp.eb.model;

import java.math.BigDecimal;
import java.util.Date;

public class CommunityPostDTO {

	private BigDecimal cp_no;
	private String cp_owner;
	private String cp_title;
	private String cp_contents;
	private BigDecimal cp_community;
	private BigDecimal cp_like;
	private BigDecimal cp_dislike;
	private String cp_date;
	
	public CommunityPostDTO() {
		// TODO Auto-generated constructor stub
	}

	public CommunityPostDTO(BigDecimal cp_no, String cp_owner, String cp_title, String cp_contents,
			BigDecimal cp_community, BigDecimal cp_like, BigDecimal cp_dislike, String cp_date) {
		super();
		this.cp_no = cp_no;
		this.cp_owner = cp_owner;
		this.cp_title = cp_title;
		this.cp_contents = cp_contents;
		this.cp_community = cp_community;
		this.cp_like = cp_like;
		this.cp_dislike = cp_dislike;
		this.cp_date = cp_date;
	}

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

	public BigDecimal getCp_community() {
		return cp_community;
	}

	public void setCp_community(BigDecimal cp_community) {
		this.cp_community = cp_community;
	}

	public BigDecimal getCp_like() {
		return cp_like;
	}

	public void setCp_like(BigDecimal cp_like) {
		this.cp_like = cp_like;
	}

	public BigDecimal getCp_dislike() {
		return cp_dislike;
	}

	public void setCp_dislike(BigDecimal cp_dislike) {
		this.cp_dislike = cp_dislike;
	}

	public String getCp_date() {
		return cp_date;
	}

	public void setCp_date(Date cp_date) {
		this.cp_date = Time.calculateTime(cp_date);
	}

	@Override
	public String toString() {
		return "CommunityPostDTO [cp_no=" + cp_no + ", cp_owner=" + cp_owner + ", cp_title=" + cp_title
				+ ", cp_contents=" + cp_contents + ", cp_community=" + cp_community + ", cp_like=" + cp_like
				+ ", cp_dislike=" + cp_dislike + ", cp_date=" + cp_date + "]";
	}
	
	
	
	
	
}
