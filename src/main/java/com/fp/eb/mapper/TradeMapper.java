package com.fp.eb.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fp.eb.model.MsgDTO;
import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.TradeTotalDTO;
import com.fp.eb.model.UserDTO;

@Mapper
public interface TradeMapper {
	
	List<TradeDTO> getAlltradelist(TradeDTO tDTO, HttpServletRequest req);

	TradeDTO getTradeDetail(TradeDTO tDTO);

	List<TradeDTO> getTradeList(TradeDTO tDTO);

	List<TradeDTO> getTradelistMe(UserDTO uDTO);

	TradeDTO locationChoose(TradeDTO tDTO);

	List<TradeTotalDTO> getToMsg(UserDTO uDTO);
	List<TradeTotalDTO> getFromMsg(UserDTO uDTO);
	public int sendMsg(MsgDTO mDTO);



}
