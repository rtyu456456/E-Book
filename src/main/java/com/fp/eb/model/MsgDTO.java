package com.fp.eb.model;

import java.util.Date;

public class MsgDTO {
	
	private int m_no;
	private int m_trade;
	private String m_to;
	private String m_from;
	private String m_txt;
	private Date m_when;
	private int m_check;
	
	public MsgDTO() {
		// TODO Auto-generated constructor stub
	}

	public MsgDTO(int m_no, int m_trade, String m_to, String m_from, String m_txt, Date m_when, int m_check) {
		super();
		this.m_no = m_no;
		this.m_trade = m_trade;
		this.m_to = m_to;
		this.m_from = m_from;
		this.m_txt = m_txt;
		this.m_when = m_when;
		this.m_check = m_check;
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

	@Override
	public String toString() {
		return "MsgDTO [m_no=" + m_no + ", m_trade=" + m_trade + ", m_to=" + m_to + ", m_from=" + m_from + ", m_txt="
				+ m_txt + ", m_when=" + m_when + ", m_check=" + m_check + "]";
	}

}
