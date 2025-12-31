package com.food.delivery.user.dto;

import com.food.delivery.user.entity.Role;
import com.food.delivery.user.entity.Status;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

	private Long userId;
	private String location;
	private String username;
	private String phone;
	private String email;
	private String passwordHash;
	private Status status;
	private Role role;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;

}
