package com.food.delivery.store.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class StoreEntity {
    private Long storeId;
    private Long ownerId;
    private String storeName;
    private String storeLocation;
    private String phone;
    private LocalDateTime createdAt;
}
