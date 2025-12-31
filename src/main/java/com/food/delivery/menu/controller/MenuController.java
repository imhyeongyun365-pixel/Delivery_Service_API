package com.food.delivery.menu.controller;

import com.food.delivery.menu.entity.MenuResponse;
import com.food.delivery.menu.service.MenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/menus")
public class MenuController {
    // 특정 가게 메뉴 조회
    
    private final MenuService menuService;

    @GetMapping("/store/{storeId}")
    public List<MenuResponse> getMenus(@PathVariable Long storeId) {
        return menuService.getMenusByStore(storeId);
    }
}
