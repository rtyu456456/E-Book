package com.fp.eb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.TradeMapper;
import com.fp.eb.model.TradeDTO;

@Service
public class TradeDAO {

	@Autowired
	private TradeMapper tradeMapper;

	
	public void getAlltradelist(TradeDTO tDTO , HttpServletRequest req) {
		List<TradeDTO> trades =  tradeMapper.getAlltradelist();
		System.out.println(trades);
		req.setAttribute("trades", tradeMapper.getAlltradelist());
		System.out.println("중고거래 메인");
		
	}


	public void getTradeDetail(TradeDTO tDTO, HttpServletRequest req) {
		req.setAttribute("trade", tradeMapper.getTradeDetail(tDTO));
		System.out.println("거래 상품 상세 정보 조회");
	}
	
	
	
	
}
