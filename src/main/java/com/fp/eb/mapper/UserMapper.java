package com.fp.eb.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.fp.eb.model.UserDTO;

@Mapper
public interface UserMapper {

	int regUser(UserDTO uDTO);

	UserDTO getUserById(String id);


}
