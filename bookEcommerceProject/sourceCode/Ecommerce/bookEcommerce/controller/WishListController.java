package com.Ecommerce.bookEcommerce.controller;

import com.Ecommerce.bookEcommerce.common.ApiResponse;
import com.Ecommerce.bookEcommerce.dto.BookDto;
import com.Ecommerce.bookEcommerce.dto.cart.CartDto;
import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.CustomUserDetails;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.model.WishList;
import com.Ecommerce.bookEcommerce.repository.CategoryRepo;
import com.Ecommerce.bookEcommerce.service.AuthenticationService;
import com.Ecommerce.bookEcommerce.service.BookService;
import com.Ecommerce.bookEcommerce.service.CartService;
import com.Ecommerce.bookEcommerce.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/wishlist")
@PreAuthorize("isAuthenticated()")
public class WishListController {
	@Autowired
	WishListService wishListService;
	@Autowired
	CartService cartService;
	@Autowired
	BookService bookService;
	@Autowired
	CategoryRepo categoryRepo;

	@Autowired
	AuthenticationService authenticationService;

	@GetMapping("")
	public String viewWishList(Model model, Authentication authentication) {
		getHomeContent(model, authentication);
		User user = showLoggedInUser(authentication);
		model.addAttribute("data", wishListService.getWishList(user));
		return "/home/wishlist";
	}

	@PostMapping("/add")
	public String addToWishList(Integer bookId, String returnURL, Authentication authentication) {

		User user = showLoggedInUser(authentication);
		Book book = bookService.findById(bookId);

		WishList wishList = new WishList(user, book);
		wishListService.authenticateWishList(wishList);
		wishListService.createWishList(wishList);

		return "redirect:/wishlist";
	}

	@GetMapping("/delete/{id}")
	public String deleteWishListItem(@PathVariable("id") Integer wishListId,Authentication authentication) {
		
		User user = showLoggedInUser(authentication);
		wishListService.deleteById(wishListId);
		return "redirect:/wishlist";
	}
	
	
	private User showLoggedInUser(Authentication authentication) {
		return ((CustomUserDetails) authentication.getPrincipal()).getUser();
	};

	private void getHomeContent(Model model, Authentication authentication) {

		model.addAttribute("categories", categoryRepo.findAll());
		if (authentication == null || !authentication.isAuthenticated()) {
			model.addAttribute("cart", new CartDto());
		} else {
			User user = ((CustomUserDetails) authentication.getPrincipal()).getUser();
			CartDto cart = cartService.listCartItems(user);
			model.addAttribute("cart", cart);
			model.addAttribute("user", user);

		}
	}
}
