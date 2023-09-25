package com.Ecommerce.bookEcommerce.repository;


import com.Ecommerce.bookEcommerce.model.Order;
import com.Ecommerce.bookEcommerce.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository  extends JpaRepository<Order, Integer> {
    List<Order> findAllByUserOrderByCreatedDateDesc(User user);
   
}
