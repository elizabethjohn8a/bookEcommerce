package com.Ecommerce.bookEcommerce.service;

import com.Ecommerce.bookEcommerce.exceptions.AuthenticationFailException;
import com.Ecommerce.bookEcommerce.model.AuthenticationToken;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.repository.TokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class AuthenticationService {

    @Autowired
    TokenRepository tokenRepository;
    public void saveConfirmationToken(AuthenticationToken authenticationToken) {
        tokenRepository.save(authenticationToken);
    }

    public AuthenticationToken getToken(User user) {
        return tokenRepository.findByUser(user);
    }

    public User getUser(String token){
        final AuthenticationToken authenticationToken = tokenRepository.findByToken(token);
        if(Objects.isNull(authenticationToken)){
            return null;
        }
        return authenticationToken.getUser();
    }

    public  void authenticate(String token){
        if(Objects.isNull(token)){
            throw new AuthenticationFailException("Token is not present!");
        }
        if(Objects.isNull(getUser(token))){
            throw new AuthenticationFailException("Token is not valid");
        }
    }
}
