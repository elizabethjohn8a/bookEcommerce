package com.Ecommerce.bookEcommerce.repository;

import com.Ecommerce.bookEcommerce.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);
    
    User findByResetPasswordToken(String token);
}
