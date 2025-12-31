package com.food.delivery.store.mapper;

import com.food.delivery.store.entity.StoreEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreMapper {
     // 사장님 가게 목록 조회
    List<StoreEntity> findStoresByOwner(@Param("ownerId") Long ownerId);
}
