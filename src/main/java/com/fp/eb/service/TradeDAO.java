package com.fp.eb.service;

import java.math.BigDecimal;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.TradeMapper;
import com.fp.eb.mapper.User_tMapper;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.UserDTO_T;

@Service
public class TradeDAO {

	@Autowired
	private TradeMapper tradeMapper;
	

	public void getAlltradelist(TradeDTO tDTO, HttpServletRequest req) {
		List<TradeDTO> trades = tradeMapper.getAlltradelist();
		System.out.println(trades);
		req.setAttribute("trades", tradeMapper.getAlltradelist());
		System.out.println("중고거래 메인");

	}

	public void getTradeDetail(TradeDTO tDTO, HttpServletRequest req) {
		req.setAttribute("trade", tradeMapper.getTradeDetail(tDTO));
		System.out.println("거래 상품 상세 정보 조회");
	}

	public void getTradeList(TradeDTO tDTO, HttpServletRequest req) {
		req.setAttribute("trades", tradeMapper.getTradeList(tDTO));
		System.out.println("거래 상품 검색 조회");
	}

	public void getTradeListMe(UserDTO_T uDTO, HttpServletRequest req) {
		req.setAttribute("trades", tradeMapper.getTradelistMe(uDTO));
		System.out.println("내 판매 도서 목록 조회");
	}
	
}