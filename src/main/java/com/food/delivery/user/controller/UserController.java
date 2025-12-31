package com.food.delivery.user.controller;

import com.food.delivery.user.dto.UserDTO;
import com.food.delivery.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;

	// TODO: PostMapping으로 바꿔야함
	// http://localhost:8080/findUser?username=tom
	@GetMapping("/findUser")
	public UserDTO findUser(@RequestParam String username) {
		return userService.findUser(username);
	}

	// POST맨으로 해야함
	@PostMapping("/insertUser")
	public int insertUser(@RequestBody UserDTO dto) {
		return userService.insertUser(dto);
	}

}
