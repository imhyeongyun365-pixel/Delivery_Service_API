package com.food.delivery.menu.entity;
    import lombok.Data;

@Data
public class MenuResponse {
    private Long menuId;
    private String name;
    private int price;
    private String categoryName;
}
