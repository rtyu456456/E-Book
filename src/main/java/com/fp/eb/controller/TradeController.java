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

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.TradeTotalDTO;
import com.fp.eb.model.UserDTO;
import com.fp.eb.service.TradeDAO;

@Controller
public class TradeController {

	@Autowired
	private TradeDAO tDAO;

	@GetMapping("/trade.go")
	public String goTrade(TradeDTO tDTO, HttpServletRequest req) {

//		 로그인 가 데이터
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

	@GetMapping("/trade.search.title")
	public String searchTrade(TradeDTO tDTO, HttpServletRequest req) {
		tDAO.getTradeList(tDTO, req);
		req.setAttribute("contentPage", "tradeMain.jsp");
		return "trade/tradeIndex";
	}
	
	
//판매중 도서
	@GetMapping("/trade.sale.now")
	public String goTradeMyBook(UserDTO uDTO, HttpServletRequest req) {

		UserDTO u = (UserDTO) req.getSession().getAttribute("loginMember");
		uDTO.setU_id(u.getU_id());
		tDAO.getTradeListMe(uDTO, req);
		req.setAttribute("contentPage", "sale.jsp");
		req.setAttribute("salePage", "saleNow.jsp");
		return "trade/tradeIndex";
	}
//판매 완료 도서	
	@GetMapping("/trade.sale.complete")
	public String goTradeMyBook2(UserDTO uDTO, HttpServletRequest req) {
		
		UserDTO u = (UserDTO) req.getSession().getAttribute("loginMember");
		uDTO.setU_id(u.getU_id());
		tDAO.getTradeListMeComplete(uDTO, req);
		req.setAttribute("contentPage", "sale.jsp");
		req.setAttribute("salePage", "saleComplete.jsp");
		return "trade/tradeIndex";
	}
	
// 쪽지 기능 컨트롤
	// 받은거 조회
	@GetMapping("/trade.Msg.get.to")
	public String getToMsg(TradeTotalDTO ttDTO, HttpServletRequest req) {
		UserDTO u = (UserDTO) req.getSession().getAttribute("loginMember");
		ttDTO.setU_id(u.getU_id());
		tDAO.getToMsg(ttDTO, req);
		System.out.println(ttDTO.getM_when());
		req.setAttribute("contentPage", "tradeMsg.jsp");
		req.setAttribute("msgpage", "tradeMsgTo.jsp");
		return "trade/tradeIndex";
	}

	// 보낸거 조회
	@GetMapping("/trade.Msg.get.from")
	public String getFromMsg(TradeTotalDTO ttDTO, HttpServletRequest req) {
		UserDTO u = (UserDTO) req.getSession().getAttribute("loginMember");
		ttDTO.setU_id(u.getU_id());
		tDAO.getFromMsg(ttDTO, req);
		req.setAttribute("contentPage", "tradeMsg.jsp");
		req.setAttribute("msgpage", "tradeMsgFrom.jsp");
		return "trade/tradeIndex";
	}

	@GetMapping("/trade.Send.Msg")
	public String sendMsg(TradeTotalDTO ttDTO, HttpServletRequest req, Date d) {
		UserDTO uDTO = (UserDTO) req.getSession().getAttribute("loginMember");
		ttDTO.setU_id(uDTO.getU_id());
		System.out.println(ttDTO.getM_to());
		tDAO.sendMsg(ttDTO, req, d);
		return "redirect:/trade.Msg.get.from";
	}

	// 내 쪽지 삭제
	@GetMapping("/delete.msg.to")
	public String deleteMsgTo(TradeTotalDTO ttDTO, HttpServletRequest req) {
		UserDTO uDTO = (UserDTO) req.getSession().getAttribute("loginMember");
		System.out.println(uDTO);
		tDAO.deleteMsg(ttDTO, req);
		// 받은 쪽지 조회 페이지로 리디렉션
		return "redirect:/trade.Msg.get.to";
	}

	@GetMapping("/delete.msg.from")
	public String deleteMsgFrom(TradeTotalDTO ttDTO, HttpServletRequest req) {
		UserDTO uDTO = (UserDTO) req.getSession().getAttribute("loginMember");
		System.out.println(uDTO);
		tDAO.deleteMsg(ttDTO, req);
		// 받은 쪽지 조회 페이지로 리디렉션
		return "redirect:/trade.Msg.get.from";
	}

// 거래 등록 기능
	@PostMapping("/reg.trade.book")
	public String regTradeBook(@RequestParam("t_file") MultipartFile file, TradeDTO tDTO, HttpServletRequest req) {
		tDAO.regTrade(file, tDTO, req);
		return "redirect:/trade.sale.now";
	}

// 수동 입력으로
	@GetMapping("/trade.reg.go")
	public String goTradeReg(Model model) {
		model.addAttribute("contentPage", "infoReg.jsp");
		return "trade/tradeIndex";
	}

// 입력 전 검색으로
	@GetMapping("/trade.reg.search")
	public String tradeRegSearch(BookDTO bDTO, HttpServletRequest req) {
		tDAO.tradeRegSearch(bDTO, req);
		req.setAttribute("contentPage", "tradeSerachBook.jsp");
		return "trade/tradeIndex";
	}
	@GetMapping("/trade.reg.search.name")
	public String tradeRegSearchName(BookDTO bDTO, HttpServletRequest req) {
		tDAO.tradeRegSearchName(bDTO, req);
		req.setAttribute("contentPage", "tradeSerachBook.jsp");
		return "trade/tradeIndex";
	}
	@GetMapping("/reg.Search.Book.Info")
	public String regSearchBookInfo(BookDTO bDTO, HttpServletRequest req) {
		req.setAttribute("contentPage", "infoReg.jsp");
		return "trade/tradeIndex";
	}


// 거래 완료 기능
	@GetMapping("/trade.complete")
	public String tradeComplete(TradeDTO tDTO, HttpServletRequest req) {
		tDAO.tradeComplete(tDTO, req);
		req.setAttribute("contentPage", "saleNow.jsp");
		return "redirect:/trade.sale.now";
	}
	
	
// 거래 정보 수정 기능 이동
	@GetMapping("/trade.update.go")
	public String updateTrade(TradeDTO tDTO, HttpServletRequest req) {
		tDAO.getTradeDetail(tDTO, req);
		req.setAttribute("contentPage", "infoUpdate.jsp");
		return "trade/tradeIndex";
	}
	
	@PostMapping("/trade.update.do")
	public String updateTradeinfo(@RequestParam("t_file") MultipartFile file , TradeDTO tDTO, HttpServletRequest req) {
		System.out.println(tDTO);
		tDAO.updateTrade(file, tDTO ,req);
		tDAO.getTradeDetail(tDTO, req);
		req.setAttribute("contentPage", "tradeBookDetail.jsp");
		return "trade/tradeIndex";
	}
	

}
