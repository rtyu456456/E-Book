package com.fp.eb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.fp.eb.service.TradeDAO;

@Controller
public class TradeController {
	
	@Autowired
	private TradeDAO tDAO;
	
	
	
	@GetMapping("/trade.go")
	public String goTrade(HttpServletRequest req) {
		req.setAttribute("contentPage", "tradeMain.jsp");
		return "trade/tradeIndex";
	}
	
	
}
