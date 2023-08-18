package com.fp.eb.controller;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fp.eb.model.MsgDTO;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.TradeTotalDTO;
import com.fp.eb.model.UserDTO;
import com.fp.eb.service.TradeDAO;

@Controller
public class TradeController {

	@Autowired
	private TradeDAO tDAO;
	@Autowired
	private ServletContext ServletContext;

	@GetMapping("/trade.go")
	public String goTrade(TradeDTO tDTO, HttpServletRequest req) {
		UserDTO uDTO = new UserDTO("hm", "hm", "하민", "img_test", "hmin0701@naver.com", "male", 27, 230203, 10, 30,
				"초심자", "0");
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
		model.addAttribute("contentPage", "infoReg.jsp");
		return "trade/tradeIndex";
	}

	@GetMapping("/trade.search.title")
	public String searchTrade(TradeDTO tDTO, HttpServletRequest req) {
		tDAO.getTradeList(tDTO, req);
		req.setAttribute("contentPage", "tradeMain.jsp");
		return "trade/tradeIndex";
	}

	@GetMapping("/trade.sale.now")
	public String goTradeMyBook(UserDTO uDTO, HttpServletRequest req) {
		tDAO.getTradeListMe(uDTO, req);
		req.setAttribute("contentPage", "saleNow.jsp");
		return "trade/tradeIndex";
	}

// 쪽지 기능 컨트롤
	//받은거 조회
	@GetMapping("/trade.Msg.get.to") 
	public String getToMsg(UserDTO uDTO, HttpServletRequest req) {
		tDAO.getToMsg(uDTO, req);
		req.setAttribute("contentPage", "tradeMsg.jsp");
		req.setAttribute("msgpage", "tradeMsgTo.jsp");
		return "trade/tradeIndex";
	}
	
	//보낸거 조회
	@GetMapping("/trade.Msg.get.from")
	public String getFromMsg(UserDTO uDTO, HttpServletRequest req) {
		tDAO.getFromMsg(uDTO, req); 
		req.setAttribute("contentPage", "tradeMsg.jsp");
		req.setAttribute("msgpage", "tradeMsgFrom.jsp");
		return "trade/tradeIndex";
	}

	@GetMapping("/trade.Send.Msg")
	public String sendMsg(MsgDTO mDTO, HttpServletRequest req, Date d) {
		tDAO.sendMsg(mDTO, req, d);
		req.setAttribute("contentPage", "tradeMsg.jsp");
		return "trade/tradeIndex";
	}
//
//	@GetMapping("/trade.Msg.choose")
//	public String getMsg(UserDTO uDTO, HttpServletRequest req) {
//		tDAO.chooseTradeMsg(uDTO, req);
//		req.setAttribute("contentPage", "tradeMsg.jsp");
//		return "trade/tradeIndex";
//	}
//	
	
	
	
	
	
	
// 거래 등록 기능
	@PostMapping("/reg.trade.book")
	public String regTradeBook(@RequestParam("t_thumbnail") MultipartFile file, Model model) {

		return "/trade.sale.now";

	}

}
