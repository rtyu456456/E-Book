package com.fp.eb.model;

import java.math.BigDecimal;

public class Community {
	
	private BigDecimal c_no;
	private String c_name;
	
	public Community() {
		// TODO Auto-generated constructor stub
	}

	public Community(BigDecimal c_no, String c_name) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
	}

	public BigDecimal getC_no() {
		return c_no;
	}

	public void setC_no(BigDecimal c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	@Override
	public String toString() {
		return "Community [c_no=" + c_no + ", c_name=" + c_name + "]";
	}
	
	
	

}
