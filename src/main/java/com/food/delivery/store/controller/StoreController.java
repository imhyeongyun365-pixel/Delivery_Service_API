package com.food.delivery.store.controller;

import com.food.delivery.store.entity.StoreEntity;
import com.food.delivery.store.service.StoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/stores")
public class StoreController {
    private final StoreService storeService;

    // 사장님 가게 목록 조회
    // GET /stores/owner/1
    @GetMapping("/owner/{ownerId}")
    public List<StoreEntity> getStoresByOwner(@PathVariable Long ownerId) {
        return storeService.getStoresByOwner(ownerId);
    }
}
