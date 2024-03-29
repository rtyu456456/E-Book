package com.fp.eb.service;

import java.io.File;
import java.io.IOException;
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
import com.fp.eb.model.BookDTO;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.TradeTotalDTO;
import com.fp.eb.model.UserDTO;

@Service
public class TradeDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private ServletContext uploadPath;

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

	public void getTradeListMeComplete(UserDTO uDTO, HttpServletRequest req) {
		req.setAttribute("trades", ss.getMapper(TradeMapper.class).getTradeListMeComplete(uDTO));
		System.out.println("내 판매  완료 도서 목록 조회");
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
			UserDTO user = (UserDTO) req.getSession().getAttribute("user");
			req.getSession().setAttribute("user", user);

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

	public void regTrade(TradeDTO tDTO, HttpServletRequest req) {

		System.out.println(tDTO);
		String path = uploadPath.getRealPath("uploadFolder");
		System.out.println(path);
		if (tDTO.getT_file() != null) {
			try {
				String orgFileName = tDTO.getT_file().getOriginalFilename();
				String saveFileName = UUID.randomUUID().toString().split("-")[0]
						+ orgFileName.substring(orgFileName.lastIndexOf("."), orgFileName.length());
				System.out.println(orgFileName);
				System.out.println(saveFileName);
				System.out.println("----------------");
				String rootPath = req.getServletContext().getRealPath("/");
				System.out.println(rootPath);
				if (!tDTO.getT_file().getOriginalFilename().isEmpty()) {
					// 실제 업로드 코드
					tDTO.getT_file().transferTo(new File(path, saveFileName));
					req.setAttribute("r", "file uploaded successfully!");
					req.setAttribute("fileName", saveFileName);
					tDTO.setT_thumbnail("uploadFolder/" + saveFileName);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			if (ss.getMapper(TradeMapper.class).regTradeBook(tDTO) == 1) {
				req.setAttribute("result", "등록 성공");
			} else {
				req.setAttribute("result", "등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	등록전에 책 검색
	public void tradeRegSearch(BookDTO bDTO, HttpServletRequest req) {
		req.setAttribute("books", ss.getMapper(TradeMapper.class).tradeRegSearch(bDTO));
		System.out.println("책 정보 검색 페이지");
	}

	public void tradeRegSearchName(BookDTO bDTO, HttpServletRequest req) {
		req.setAttribute("books", ss.getMapper(TradeMapper.class).tradeRegSearchName(bDTO));
		System.out.println("책 정보 검색 입력");
	}

	// ------------------------ 내용 수정---------------
	public void tradeComplete(TradeDTO tDTO, HttpServletRequest req) {
		if (ss.getMapper(TradeMapper.class).tradeComplete(tDTO) == 1) {
			req.setAttribute("result", "변경 완료");
		} else {
			req.setAttribute("result", "변경 실패");
		}
	}

// 정보 수정
	public void updateTrade(TradeDTO tDTO, HttpServletRequest req) {
System.out.println(tDTO.getT_file().getOriginalFilename());
System.out.println("--------------asd-");
		if (!(tDTO.getT_file().getOriginalFilename().isEmpty())) {

		try {
			System.out.println(tDTO);
			String savepath = uploadPath.getRealPath("uploadFolder");
			System.out.println(savepath);
			System.out.println("-----------------------");
			String orgFileName = tDTO.getT_file().getOriginalFilename();

			String saveFileName = UUID.randomUUID().toString().split("-")[0]
					+ orgFileName.substring(orgFileName.lastIndexOf("."), orgFileName.length());

			System.out.println("오리지널널파일네임 : " + orgFileName);
			System.out.println("세이브파일네임 : " + saveFileName);
			String rootPath = req.getServletContext().getRealPath("/");
			System.out.println("a :" + rootPath);
		

			if (!tDTO.getT_file().getOriginalFilename().isEmpty()) {

				// 실제 업로드 코드
				tDTO.getT_file().transferTo(new File(savepath, saveFileName));
				tDTO.setT_thumbnail(saveFileName);
				System.out.println(tDTO);
				tDTO.setT_thumbnail("uploadFolder/" + saveFileName);

				if (ss.getMapper(TradeMapper.class).updateInfo(tDTO) == 1) {
					System.out.println("정보 변경 완료");
					req.setAttribute("result", "정보 변경 완료");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("실패");
		}

		} else {
			if (ss.getMapper(TradeMapper.class).updateInfo(tDTO) == 1) {
				System.out.println("정보 변경 완료");
				req.setAttribute("result", "정보 변경 완료");
			}
		}
	}

//책 판매 취소하기 == 등록 삭제
	public void tradeCancle(TradeDTO tDTO, HttpServletRequest req) {

		try {
			if (ss.getMapper(TradeMapper.class).tradeCancle(tDTO) == 1) {
				req.setAttribute("result", "삭제 성공");
			} else {
				req.setAttribute("result", "삭제 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "삭제 실패");
		}
	}
}