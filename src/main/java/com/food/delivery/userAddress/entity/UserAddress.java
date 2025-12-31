package com.food.delivery.userAddress.entity;

import com.food.delivery.user.entity.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user_address")
public class UserAddress {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long addressId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(
			name="user_id",
			insertable=false,
			updatable = false
	)
	private User user;

	@Column(name = "address_name", nullable = false)
	private String addressName;

	@Column(name = "road_address", nullable = false)
	private String roadAddress;

	@Column(name = "detail_address", nullable = false)
	private String detailAddress;

	@Column(name = "latitude", nullable = false)
	private BigDecimal latitude;

	@Column(name = "longitude", nullable = false)
	private BigDecimal longitude;

	@Column(name = "is_default", nullable = false)
	private Boolean isDefault;

	@CreatedDate
	@Column(updatable = false)
	private LocalDateTime createdAt;

	@LastModifiedDate
	private LocalDateTime updatedAt;

}
