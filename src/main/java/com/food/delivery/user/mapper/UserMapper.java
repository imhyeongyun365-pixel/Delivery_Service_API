package com.food.delivery.user.mapper;

import com.food.delivery.user.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {
	UserDTO findUser(String username);
	int insertUser(UserDTO dto);
}
