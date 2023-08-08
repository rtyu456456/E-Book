package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.eb.model.TradeDTO;
import com.fp.eb.service.TradeDAO;

@Controller
public class TradeController {
	
	@Autowired
	private TradeDAO tDAO;
	
	@GetMapping("/trade.go")
	public String goTrade(TradeDTO tDTO, HttpServletRequest req) {
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
	
	@GetMapping("/trade.search.title")
	public String searchTitle(TradeDTO tDTO, HttpServletRequest req) {
		tDAO.getTradeList(tDTO, req);
		req.setAttribute("contentPage", "tradeMain.jsp");
		return "trade/tradeIndex";
	}

	
	
}
