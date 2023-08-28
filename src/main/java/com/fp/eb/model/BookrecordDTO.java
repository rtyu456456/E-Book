package com.fp.eb.model;

import java.math.BigDecimal;
import java.util.Date;

public class BookrecordDTO {
	private int b_no;
	private String b_thumbnail;
	private String b_title;
	private BigDecimal b_page;
	private String b_authors;
	private BigDecimal br_no;
	private BigDecimal br_page;
	private Date br_date;
	private BigDecimal lr_no;
	private BigDecimal r_no;
	private BigDecimal r_type;
	private String r_contents;
	

	public BookrecordDTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public BigDecimal getR_no() {
		return r_no;
	}



	public void setR_no(BigDecimal r_no) {
		this.r_no = r_no;
	}



	public BigDecimal getR_type() {
		return r_type;
	}



	public void setR_type(BigDecimal r_type) {
		this.r_type = r_type;
	}


	public String getR_contents() {
		return r_contents;
	}



	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}



	public int getB_no() {
		return b_no;
	}


	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public BigDecimal getLr_no() {
		return lr_no;
	}

	public void setLr_no(BigDecimal lr_no) {
		this.lr_no = lr_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_thumbnail() {
		return b_thumbnail;
	}

	public void setB_thumbnail(String b_thumbnail) {
		this.b_thumbnail = b_thumbnail;
	}

	public BigDecimal getB_page() {
		return b_page;
	}

	public void setB_page(BigDecimal b_page) {
		this.b_page = b_page;
	}

	public String getB_authors() {
		return b_authors;
	}

	public void setB_authors(String b_authors) {
		this.b_authors = b_authors;
	}

	public BigDecimal getBr_no() {
		return br_no;
	}

	public void setBr_no(BigDecimal br_no) {
		this.br_no = br_no;
	}

	public BigDecimal getBr_page() {
		return br_page;
	}

	public void setBr_page(BigDecimal br_page) {
		this.br_page = br_page;
	}

	public Date getBr_date() {
		return br_date;
	}

	public void setBr_date(Date br_date) {
		this.br_date = br_date;
	}

}
