package com.Ecommerce.bookEcommerce.repository;

import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.Cart;
import com.Ecommerce.bookEcommerce.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
    List<Cart> findAllByUser(User user);
    List<Cart> findByBook(Book book);
    List<Cart> deleteByUser(User user);
    
}
