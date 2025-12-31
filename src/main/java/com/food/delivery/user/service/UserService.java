package com.food.delivery.user.service;

import com.food.delivery.user.dto.UserDTO;
import com.food.delivery.user.entity.User;
import com.food.delivery.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {

	private final UserMapper userMapper;

	public UserDTO findUser(String username) {
		return userMapper.findUser(username);
	}

	public int insertUser(UserDTO dto) {
		return userMapper.insertUser(dto);
	}
}
