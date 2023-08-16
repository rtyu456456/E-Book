package com.fp.eb.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.UserDTO_T;
import com.fp.eb.service.TradeDAO;
import com.fp.eb.service.UserDAO_T;

@Controller
public class TradeController {

	@Autowired
	private TradeDAO tDAO;


	@GetMapping("/trade.go")
	public String goTrade(TradeDTO tDTO, HttpServletRequest req) {
		
		UserDTO_T uDTO = new UserDTO_T("hm", "hm" , "하민", "img_test", "hmin0701@naver.com", "male", 27, 20203, 10, 30, "초심자", 0);
		req.getSession().setAttribute("loginMember", uDTO);
		
		tDAO.getAlltradelist(tDTO, req);
		req.setAttribute("contentPage", "tradeMain.jsp");
		return "trade/tradeIndex";
	}

	@GetMapping("/trade.detail.go")
	public String goTradeDetail(TradeDTO tDTO, HttpServletRequest req) {
		System.out.println(tDTO.getT_no());
		tDAO.getTradeDetail(tDTO, req);
		req.setAttribute("contentPage", "tradeBookDetail.jsp");
		return "trade/tradeIndex";
	}

	@GetMapping("/trade.choose.go")
	public String goTradeChoose(Model model) {
		model.addAttribute("contentPage", "infoRegChoose.jsp");
		return "trade/tradeIndex";
	}
	
	@GetMapping("/trade.map.go")
	public String goTradeMap(HttpServletRequest req) {
		return "trade/tradeMap";
	}
	
	
	@GetMapping("/trade.reg.go")
	public String goTradeReg(Model model) {
		model.addAttribute("contentPage","infoReg.jsp");
		return "trade/tradeIndex";
	}
		
	@GetMapping("/trade.search.title")
	public String searchTrade(TradeDTO tDTO, HttpServletRequest req) {
		tDAO.getTradeList(tDTO, req);
		req.setAttribute("contentPage", "tradeMain.jsp");
		return "trade/tradeIndex";
	}

	@GetMapping("/trade.sale.now")
	public String goTradeMyBook(UserDTO_T uDTO, HttpServletRequest req) {
		tDAO.getTradeListMe(uDTO, req);
		req.setAttribute("contentPage", "saleNow.jsp");
		return "trade/tradeIndex";
	}

	@GetMapping("/trade.Msg.go")
	public String tradMsg(Model model) {
		model.addAttribute("contentPage", "tradeMsg.jsp");
		return "trade/tradeIndex";
	}
	
	
	@GetMapping("/reg.trade.book")
	public String regTradeBook() {
		
		
		
		return "trade/tradeIndex";	
	}

}
