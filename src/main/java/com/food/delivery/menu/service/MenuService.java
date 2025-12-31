package com.food.delivery.menu.service;

import com.food.delivery.menu.entity.MenuResponse;
import com.food.delivery.menu.mapper.MenuMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuService {
    private final MenuMapper menuMapper;

    public List<MenuResponse> getMenusByStore(Long storeId) {
        return menuMapper.findMenusByStore(storeId);
    }
}
