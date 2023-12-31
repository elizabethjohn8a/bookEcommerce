package com.Ecommerce.bookEcommerce.repository;

import com.Ecommerce.bookEcommerce.model.AuthenticationToken;
import com.Ecommerce.bookEcommerce.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TokenRepository extends JpaRepository<AuthenticationToken, Integer> {
    AuthenticationToken findByUser(User user);
    AuthenticationToken findByToken(String token);

}
