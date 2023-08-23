package com.fp.eb.service;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.fp.eb.mapper.TradeMapper;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.TradeTotalDTO;
import com.fp.eb.model.UserDTO;

@Service
public class TradeDAO {

	@Autowired
	private SqlSession ss;
	@Autowired
	private ServletContext sc;
	
	@Value("${upload.path}")
	private String uploadPath;

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

	public void getToMsg(TradeTotalDTO ttDTO, HttpServletRequest req) {
		try {
			req.setAttribute("msgsTo", ss.getMapper(TradeMapper.class).getToMsg(ttDTO));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getFromMsg(TradeTotalDTO ttDTO, HttpServletRequest req) {
		try {
			req.setAttribute("msgsFrom", ss.getMapper(TradeMapper.class).getFromMsg(ttDTO));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sendMsg(TradeTotalDTO ttDTO, HttpServletRequest req, Date sysdate) {
		try {
			UserDTO uDTO = (UserDTO) req.getSession().getAttribute("loginMember");

			ttDTO.setM_trade(Integer.parseInt(req.getParameter("m_trade")));
			System.out.println(ttDTO.getM_trade());
			ttDTO.setM_to(req.getParameter("m_to"));
			System.out.println(ttDTO.getM_to());
			ttDTO.setM_from(req.getParameter("m_from"));
			System.out.println(ttDTO.getM_from());
			ttDTO.setM_txt(req.getParameter("m_txt"));
			ttDTO.setM_when(sysdate);
			ttDTO.setM_check(0);

			if (ss.getMapper(TradeMapper.class).sendMsg(ttDTO) == 1) {
				req.setAttribute("result", "쪽지보내기성공");

			} else {
				req.setAttribute("result", "쪽지보내기실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "쪽지보내기실패");
		}
	}

	public void deleteMsg(TradeTotalDTO ttDTO, HttpServletRequest req) {

		try {
			if (ss.getMapper(TradeMapper.class).deleteMsg(ttDTO) == 1) {
				req.setAttribute("result", "삭제 성공");
			} else {
				req.setAttribute("result", "삭제 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "삭제 실패");
		}
	}
//---------------------------------------- 등록기능

	public void regTrade(MultipartFile file, TradeDTO tDTO, HttpServletRequest req) {

		tDTO.setT_owner(req.getParameter("t_owner"));
		tDTO.setT_title(req.getParameter("t_title"));
		tDTO.setT_book_title(req.getParameter("t_book_title"));
		tDTO.setT_authors(req.getParameter("t_authors"));
		tDTO.setT_publisher(req.getParameter("t_publisher"));
		tDTO.setT_contents(req.getParameter("t_content"));
		tDTO.setT_price(Integer.parseInt(req.getParameter("t_price")));
		tDTO.setT_thumbnail(req.getParameter("t_thumbnail"));
		tDTO.setT_map_lat(Double.parseDouble(req.getParameter("t_map_lat")));
		tDTO.setT_map_lng(Double.parseDouble(req.getParameter("t_map_lng")));
		tDTO.setT_marker_lat(Double.parseDouble(req.getParameter("t_marker_lat")));
		tDTO.setT_marker_lng(Double.parseDouble(req.getParameter("t_marker_lng")));
		System.out.println(tDTO);
		System.out.println(uploadPath);
		
		try {
			String orgFileName = file.getOriginalFilename();
//			String savePath = sc.getRealPath("./imgs");
//			System.out.println(savePath);
			String saveFileName = UUID.randomUUID().toString().split("-")[0]
					+ orgFileName.substring(orgFileName.lastIndexOf("."), orgFileName.length());
			System.out.println(orgFileName);
			System.out.println(saveFileName);
			System.out.println("----------------");

			if (!file.getOriginalFilename().isEmpty()) {
				// 실제 업로드 코드
				file.transferTo(new File(uploadPath, saveFileName));
				req.setAttribute("r", "file uploaded successfully!");
				req.setAttribute("fileName", saveFileName);
				tDTO.setT_thumbnail(saveFileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			if (ss.getMapper(TradeMapper.class).regTradeBook(tDTO) == 1) {
					req.setAttribute("result", "등록 성공");
				} else {
					req.setAttribute("result", "등록 실패");
				}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	
	//------------------------ 내용 수정---------------
	public void tradeComplete(TradeDTO tDTO, HttpServletRequest req) {
		if (ss.getMapper(TradeMapper.class).tradeComplete(tDTO) == 1) {
			req.setAttribute("result", "삭제 성공");
		}else {
			req.setAttribute("result", "삭제 실패");
		}
	}
}
