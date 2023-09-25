package com.Ecommerce.bookEcommerce.dto.cart;

import java.util.ArrayList;
import java.util.List;

public class CartDto {
    private List<CartItemDto> cartItems;
    private int totalCost;

    public CartDto() {
    	this.cartItems = new ArrayList<CartItemDto>() ;
        this.totalCost = 0;
    }

    public CartDto(List<CartItemDto> cartItems, int totalCost) {
        this.cartItems = cartItems;
        this.totalCost = totalCost;
    }

    public List<CartItemDto> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItemDto> cartItems) {
        this.cartItems = cartItems;
    }

    public int getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(int totalCost) {
        this.totalCost = totalCost;
    }


}
