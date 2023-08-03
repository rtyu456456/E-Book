package com.fp.eb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TradeController {
	
	
	
	@GetMapping("/trade.go")
	public String goTrade() {
		
		
		return "trade/tradeIndex";
	}
	
	
}
