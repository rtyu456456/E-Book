package com.fp.eb.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fp.eb.model.BookDTO;
import com.fp.eb.model.MsgDTO;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.TradeTotalDTO;
import com.fp.eb.model.UserDTO;
import com.fp.eb.service.TradeDAO;

@Mapper
public interface TradeMapper {
	
	List<TradeDTO> getAlltradelist(TradeDTO tDTO, HttpServletRequest req);

	TradeDTO getTradeDetail(TradeDTO tDTO);

	List<TradeDTO> getTradeList(TradeDTO tDTO);

	List<TradeDTO> getTradelistMe(UserDTO uDTO);
	List<TradeDTO> getTradeListMeComplete(UserDTO uDTO);
	
	TradeDTO locationChoose(TradeDTO tDTO);
	
	//쪽지기능
	List<TradeTotalDTO> getToMsg(TradeTotalDTO ttDTO);
	List<TradeTotalDTO> getFromMsg(TradeTotalDTO ttDTO);
	public int sendMsg(TradeTotalDTO ttDTO);
	public int deleteMsg(TradeTotalDTO ttDTO);


	//등록기능
	public int regTradeBook(TradeDTO tDTO);
	public int tradeComplete(TradeDTO tDTO);

	List<BookDTO> tradeRegSearch(BookDTO bDTO);
	List<BookDTO> tradeRegSearchName(BookDTO bDTO);

	public int updateInfo(TradeDTO tDTO);




}
