package com.fp.eb.model;

import java.math.BigDecimal;
import java.util.Date;

public class CommunityReplyDTO {

	private BigDecimal cr_no;
	private String cr_owner;
	private BigDecimal cr_cp_no;
	private String cr_contents;
	private BigDecimal cr_like;
	private BigDecimal cr_dislike;
	private Date cr_date;
	
	private int cp_no;
	
	private String c_name;
	private int c_no;
	
	
	
	public int getCp_no() {
		return cp_no;
	}
	
	
	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}
	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public int getC_no() {
		return c_no;
	}


	public void setC_no(int c_no) {
		this.c_no = c_no;
	}


	public CommunityReplyDTO() {
		// TODO Auto-generated constructor stub
	}


	public CommunityReplyDTO(BigDecimal cr_no, String cr_owner, BigDecimal cr_cp_no, String cr_contents,
			BigDecimal cr_like, BigDecimal cr_dislike, Date cr_date) {
		super();
		this.cr_no = cr_no;
		this.cr_owner = cr_owner;
		this.cr_cp_no = cr_cp_no;
		this.cr_contents = cr_contents;
		this.cr_like = cr_like;
		this.cr_dislike = cr_dislike;
		this.cr_date = cr_date;
	}


	public BigDecimal getCr_no() {
		return cr_no;
	}


	public void setCr_no(BigDecimal cr_no) {
		this.cr_no = cr_no;
	}


	public String getCr_owner() {
		return cr_owner;
	}


	public void setCr_owner(String cr_owner) {
		this.cr_owner = cr_owner;
	}


	public BigDecimal getCr_cp_no() {
		return cr_cp_no;
	}


	public void setCr_cp_no(BigDecimal cr_cp_no) {
		this.cr_cp_no = cr_cp_no;
	}


	public String getCr_contents() {
		return cr_contents;
	}


	public void setCr_contents(String cr_contents) {
		this.cr_contents = cr_contents;
	}


	public BigDecimal getCr_like() {
		return cr_like;
	}


	public void setCr_like(BigDecimal cr_like) {
		this.cr_like = cr_like;
	}


	public BigDecimal getCr_dislike() {
		return cr_dislike;
	}


	public void setCr_dislike(BigDecimal cr_dislike) {
		this.cr_dislike = cr_dislike;
	}


	public Date getCr_date() {
		return cr_date;
	}


	public void setCr_date(Date cr_date) {
		this.cr_date = cr_date;
	}


	@Override
	public String toString() {
		return "CommunityReplyDTO [cr_no=" + cr_no + ", cr_owner=" + cr_owner + ", cr_cp_no=" + cr_cp_no
				+ ", cr_contents=" + cr_contents + ", cr_like=" + cr_like + ", cr_dislike=" + cr_dislike + ", cr_date="
				+ cr_date + "]";
	}
	
	
	
	
}
