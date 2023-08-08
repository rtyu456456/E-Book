package com.fp.eb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fp.eb.model.TradeDTO;

@Mapper
public interface TradeMapper {
	
	List<TradeDTO> getAlltradelist();

	TradeDTO getTradeDetail(TradeDTO tDTO);

	List<TradeDTO> getTradeList(TradeDTO tDTO);

	

}
