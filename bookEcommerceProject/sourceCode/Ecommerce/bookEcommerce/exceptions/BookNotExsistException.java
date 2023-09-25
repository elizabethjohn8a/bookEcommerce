package com.Ecommerce.bookEcommerce.exceptions;

public class BookNotExsistException extends IllegalArgumentException {
    public BookNotExsistException(String s) {
        super(s);
    }
}
