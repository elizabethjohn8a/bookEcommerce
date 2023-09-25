package com.Ecommerce.bookEcommerce.controller;

import com.Ecommerce.bookEcommerce.common.ApiResponse;
import com.Ecommerce.bookEcommerce.dto.cart.AddToCartDto;
import com.Ecommerce.bookEcommerce.dto.cart.CartDto;
import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.CustomUserDetails;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.service.AuthenticationService;
import com.Ecommerce.bookEcommerce.service.BookService;
import com.Ecommerce.bookEcommerce.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@Controller
@RequestMapping("/cart")
@PreAuthorize("isAuthenticated()")
public class CartController {
	@Autowired
	private CartService cartService;

	@Autowired
	private AuthenticationService authenticationService;

	@GetMapping("")
	public String viewCart(Model model, Authentication authentication) {
		model.addAttribute("cart", cartService.listCartItems(showLoggedInUser(authentication)));
		return "/home/cart";
	}

	@PostMapping("/add")
	public String addToCart(AddToCartDto addToCartDto , String returnURL, Authentication authentication) {
		User user = showLoggedInUser(authentication);
		cartService.addToCart(addToCartDto, user);
		return "redirect:"+returnURL;
	}
	
	@PostMapping("/update")
	@ResponseBody
	public ResponseEntity<Boolean> update(AddToCartDto addToCartDto , String returnURL, Authentication authentication) {
		User user = showLoggedInUser(authentication);
		cartService.update(addToCartDto, user);		
		return ResponseEntity.ok(true);
	}
	
	

	@GetMapping("/delete/{cartItemId}")
	public String deleteCartItem(@PathVariable("cartItemId") Integer itemId,Authentication authentication) {
		User user = showLoggedInUser(authentication);
		cartService.deleteCartItem(itemId, user);
		return "redirect:/cart";
	}

	private User showLoggedInUser(Authentication authentication) {
		return ((CustomUserDetails) authentication.getPrincipal()).getUser();
	};
}
