package com.Ecommerce.bookEcommerce.service;

import com.Ecommerce.bookEcommerce.dto.cart.AddToCartDto;
import com.Ecommerce.bookEcommerce.dto.cart.CartDto;
import com.Ecommerce.bookEcommerce.dto.cart.CartItemDto;
import com.Ecommerce.bookEcommerce.exceptions.CustomException;
import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.Cart;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class CartService {
    @Autowired
    BookService bookService;
    @Autowired
    CartRepository cartRepository;
    public void addToCart(AddToCartDto addToCartDto, User user) {
        Book book = bookService.findById(addToCartDto.getBookId());
        Cart cart = new Cart();
        cart.setBook(book);
        cart.setUser(user);
        cart.setQuantity(addToCartDto.getQuantity());
        cart.setCreated_date(new Date());

        cartRepository.save(cart);
    }

    public CartDto listCartItems(User user) {
        List<Cart> allByUser = cartRepository.findAllByUser(user);
        List<CartItemDto> cartItemDtos = new ArrayList<>();
        int totalCost = 0;
        for(Cart cart: allByUser){
            CartItemDto cartItemDto = new CartItemDto(cart);
            totalCost += cart.getQuantity() * cart.getBook().getPrice();
            cartItemDtos.add(cartItemDto);
        }
        CartDto cartDto = new CartDto();
        cartDto.setTotalCost(totalCost);
        cartDto.setCartItems(cartItemDtos);
        return cartDto;
    }

    public void deleteCartItem(Integer cartItemId, User user) {
        Optional<Cart> optionalCart = cartRepository.findById(cartItemId);
        if(optionalCart.isEmpty()){
            throw new CustomException("Book id in the cart is not valid!");
        }
        Cart cart = optionalCart.get();
        if(cart.getUser().getId()!= user.getId()){
            throw new CustomException("This book doesn't belong to you!");
        }
        cartRepository.delete(cart);
    }

    public void deleteUserCartItems(User user) {
        cartRepository.deleteByUser(user);
    }

	  public void update(AddToCartDto addToCartDto, User user) {
       
        Cart cart=cartRepository.findById(addToCartDto.getBookId()).get();
        cart.setQuantity(addToCartDto.getQuantity());
        cartRepository.save(cart);
    }
}
