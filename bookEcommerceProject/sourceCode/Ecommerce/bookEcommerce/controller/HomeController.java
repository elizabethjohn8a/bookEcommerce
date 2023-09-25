package com.Ecommerce.bookEcommerce.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.Ecommerce.bookEcommerce.dto.cart.CartDto;
import com.Ecommerce.bookEcommerce.model.Book;
import com.Ecommerce.bookEcommerce.model.Category;
import com.Ecommerce.bookEcommerce.model.CustomUserDetails;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.repository.BookRepository;
import com.Ecommerce.bookEcommerce.repository.CategoryRepo;
import com.Ecommerce.bookEcommerce.service.BookService;
import com.Ecommerce.bookEcommerce.service.CartService;

@Controller
public class HomeController {

	@Autowired
	BookService bookService;
	@Autowired
	BookRepository bookRepository;

	@Autowired
	CartService cartService;

	@Autowired
	CategoryRepo categoryRepo;

	@GetMapping
	public String homePage(Model model, Authentication authentication) {
		getHomeContent(model, authentication);
		model.addAttribute("products", bookService.showLastedProducts());
		model.addAttribute("title", "Sách mới");
		return "home/index";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam(name = "key", defaultValue = "") String key, Model model, Authentication authentication) {
		model.addAttribute("products", bookService.getAllBooks(key));
		model.addAttribute("title", "Tìm kiếm: "+key);
		model.addAttribute("key", key);
		getHomeContent(model, authentication);
		return "home/index";
	}

	@GetMapping("/category/{id}")
	public String homePageByCategory(@PathVariable int id, Model model, Authentication authentication) {

		Optional<Category> categoryResult = categoryRepo.findById(id);
		if (!categoryResult.isPresent())
			return "error/404";

		Category category = categoryResult.get();

		model.addAttribute("products", bookRepository.findByCategory(category));
		model.addAttribute("title", category.getCategoryName());
		getHomeContent(model, authentication);
		return "home/index";
	}

	@GetMapping("/book-detail/{id}")
	public String bookDetail(@PathVariable int id, Model model, Authentication authentication) {
		getHomeContent(model, authentication);
		Optional<Book> book = bookRepository.findById(id);
		if (!book.isPresent())
			return "error/404";

		model.addAttribute("book", book.get());
		return "home/book-detail";
	}

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
