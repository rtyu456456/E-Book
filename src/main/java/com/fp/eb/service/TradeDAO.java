package com.fp.eb.service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fp.eb.mapper.TradeMapper;
import com.fp.eb.model.MsgDTO;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.TradeTotalDTO;
import com.fp.eb.model.UserDTO;

@Service
public class TradeDAO {

	@Autowired
	private SqlSession ss;
	@Autowired
	private ServletContext sc;

// -------------------------------------------기본 조회 기능
	public void getAlltradelist(TradeDTO tDTO, HttpServletRequest req) {
		req.setAttribute("trades", ss.getMapper(TradeMapper.class).getAlltradelist(tDTO, req));
		System.out.println("중고거래 메인");
	}

	public void getTradeDetail(TradeDTO tDTO, HttpServletRequest req) {
		req.setAttribute("trade", ss.getMapper(TradeMapper.class).getTradeDetail(tDTO));
		System.out.println("거래 상품 상세 정보 조회");
	}

	public void getTradeList(TradeDTO tDTO, HttpServletRequest req) {
		req.setAttribute("trades", ss.getMapper(TradeMapper.class).getTradeList(tDTO));
		System.out.println("거래 상품 검색 조회");
	}

	public void getTradeListMe(UserDTO uDTO, HttpServletRequest req) {
		req.setAttribute("trades", ss.getMapper(TradeMapper.class).getTradelistMe(uDTO));
		System.out.println("내 판매 도서 목록 조회");
	}

// ---------------------------------- 쪽지 기능

	public void getToMsg(UserDTO uDTO ,HttpServletRequest req) {
		try {
			req.setAttribute("msgsTo", ss.getMapper(TradeMapper.class).getToMsg(uDTO));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getFromMsg(UserDTO uDTO ,HttpServletRequest req) {
		try {
			req.setAttribute("msgsFrom", ss.getMapper(TradeMapper.class).getFromMsg(uDTO));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
	public void sendMsg(MsgDTO mDTO, HttpServletRequest req, Date sysdate) {
		try {
			UserDTO uDTO = (UserDTO) req.getSession().getAttribute("loginMember");

			int trade = Integer.parseInt(req.getParameter("m_trade"));
			mDTO.setM_trade(trade);
			String to = req.getParameter("m_to");
			mDTO.setM_to(to);
			String from = req.getParameter("m_from");
			mDTO.setM_from(from);
			String txt = req.getParameter("m_txt");
			mDTO.setM_txt(txt);
			mDTO.setM_when(sysdate);
			mDTO.setM_check(0);

			if (ss.getMapper(TradeMapper.class).sendMsg(mDTO) == 1) {
				req.setAttribute("result", "쪽지보내기성공");

			} else {
				req.setAttribute("result", "쪽지보내기실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "쪽지보내기실패");
		}
	}


	
}
