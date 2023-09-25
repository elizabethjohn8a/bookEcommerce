package com.Ecommerce.bookEcommerce.dto.cart;

import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.Cart;

public class CartItemDto {
    private Integer id;
    private Integer quantity;
    private Book book;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public CartItemDto() {
    }

    public CartItemDto(Cart cart) {
        this.id = cart.getId();
        this.quantity = cart.getQuantity();
        this.setBook(cart.getBook());
    }


}
