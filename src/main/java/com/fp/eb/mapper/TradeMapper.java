package com.fp.eb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fp.eb.model.TradeDTO;
import com.fp.eb.model.UserDTO_T;

@Mapper
public interface TradeMapper {
	
	List<TradeDTO> getAlltradelist();

	TradeDTO getTradeDetail(TradeDTO tDTO);

	List<TradeDTO> getTradeList(TradeDTO tDTO);

	List<TradeDTO> getTradelistMe(UserDTO_T uDTO );

	TradeDTO locationChoose(TradeDTO tDTO);

	

}
