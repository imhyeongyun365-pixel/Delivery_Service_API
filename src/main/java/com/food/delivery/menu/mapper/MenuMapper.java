package com.food.delivery.menu.mapper;

import com.food.delivery.menu.entity.MenuResponse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MenuMapper {
    List<MenuResponse> findMenusByStore(@Param("storeId") Long storeId);
}
