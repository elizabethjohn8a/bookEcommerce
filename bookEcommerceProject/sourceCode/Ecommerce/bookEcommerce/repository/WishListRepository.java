package com.Ecommerce.bookEcommerce.repository;

import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.model.WishList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WishListRepository extends JpaRepository<WishList, Integer> {
    WishList findByUser_idAndBook_id(Integer user_id, Integer book_id);
    List<WishList> findAllByUserOrderByCreatedDateDesc(User user);
    List<WishList> findByBook(Book book);
}
