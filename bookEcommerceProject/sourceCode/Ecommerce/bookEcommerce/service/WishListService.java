package com.Ecommerce.bookEcommerce.service;

import com.Ecommerce.bookEcommerce.common.ApiResponse;
import com.Ecommerce.bookEcommerce.dto.BookDto;
import com.Ecommerce.bookEcommerce.exceptions.AuthenticationFailException;
import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.model.WishList;
import com.Ecommerce.bookEcommerce.repository.WishListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class WishListService {
    @Autowired
    WishListRepository wishListRepository;

    @Autowired
    BookService bookService;

    public void createWishList(WishList wishList) {
        wishListRepository.save(wishList);
    }

    public ResponseEntity<ApiResponse> authenticateWishList(WishList wishList){
        WishList tempWishList = wishListRepository.findByUser_idAndBook_id(wishList.getUser().getId(), wishList.getBook().getId());
        if(Objects.nonNull(tempWishList)){
            throw new AuthenticationFailException("You 've already added this book before!");
        }
        ApiResponse apiResponse = new ApiResponse(false, "Wishlist existed!");
        return new ResponseEntity<>(apiResponse, HttpStatus.BAD_REQUEST);
    }

    public List<WishList> getWishList(User user) {
        return wishListRepository.findAllByUserOrderByCreatedDateDesc(user);

    }

    public void deleteById(Integer wishListId){
        wishListRepository.deleteById(wishListId);
    }
}
