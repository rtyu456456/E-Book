package com.fp.eb.model;

public class LikeDTO {
	private int lr_no;
	private String lr_owner;
	private String lr_where_type;
	private int lr_where_no;
	private int lr_type;
	public int getLr_no() {
		return lr_no;
	}
	public void setLr_no(int lr_no) {
		this.lr_no = lr_no;
	}
	public String getLr_owner() {
		return lr_owner;
	}
	public void setLr_owner(String lr_owner) {
		this.lr_owner = lr_owner;
	}
	public String getLr_where_type() {
		return lr_where_type;
	}
	public void setLr_where_type(String lr_where_type) {
		this.lr_where_type = lr_where_type;
	}
	public int getLr_where_no() {
		return lr_where_no;
	}
	public void setLr_where_no(int lr_where_no) {
		this.lr_where_no = lr_where_no;
	}
	public int getLr_type() {
		return lr_type;
	}
	public void setLr_type(int lr_type) {
		this.lr_type = lr_type;
	}
	@Override
	public String toString() {
		return "LikeDTO [lr_no=" + lr_no + ", lr_owner=" + lr_owner + ", lr_where_type=" + lr_where_type
				+ ", lr_where_no=" + lr_where_no + ", lr_type=" + lr_type + "]";
	}
	
	
}
