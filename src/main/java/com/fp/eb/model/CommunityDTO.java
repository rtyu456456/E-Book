package com.fp.eb.model;

import java.math.BigDecimal;

public class CommunityDTO {
	
	// 여기는 뷰에서 보여줄 값을 쓰는 DTO를 만드는 폴더입니다.
	// DTO, model, 도메인 기타 등등으로 불리는 우리가 값을 받아오기 위해 필요한
	// 클래스를 만드는 곳입니다.
	// 주 사용처는 OOmapper.xml의 resultType 혹은 parameterType이 될거라고 생각합니다.
	// 홈은 제발 쓰지마세요
	
	
	private BigDecimal c_no;
	private String c_name;
	
	
	public CommunityDTO() {
		// TODO Auto-generated constructor stub
	}

	public CommunityDTO(BigDecimal c_no, String c_name) {
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
		return "CommunityDTO [c_no=" + c_no + ", c_name=" + c_name + "]";
	}
	
	
}
