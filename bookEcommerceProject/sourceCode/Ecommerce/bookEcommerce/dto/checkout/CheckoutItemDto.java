package com.Ecommerce.bookEcommerce.dto.checkout;

public class CheckoutItemDto {
    private String bookName;
    private int quantity;
    private int price;
    private int bookId;
    private int userId;
    
    

    @Override
	public String toString() {
		return "CheckoutItemDto [bookName=" + bookName + ", quantity=" + quantity + ", price=" + price + ", bookId="
				+ bookId + ", userId=" + userId + "]";
	}

	public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public CheckoutItemDto() {
    }
}
