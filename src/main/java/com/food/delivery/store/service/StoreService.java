package com.food.delivery.store.service;

import com.food.delivery.store.entity.StoreEntity;
import com.food.delivery.store.mapper.StoreMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StoreService {
    private final StoreMapper storeMapper;

    public List<StoreEntity> getStoresByOwner(Long ownerId) {
        return storeMapper.findStoresByOwner(ownerId);
    }
}
