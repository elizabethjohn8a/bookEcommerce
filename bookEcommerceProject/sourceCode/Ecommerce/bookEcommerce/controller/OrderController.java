package com.Ecommerce.bookEcommerce.controller;

import com.Ecommerce.bookEcommerce.dto.cart.CartDto;
import com.Ecommerce.bookEcommerce.dto.cart.CartItemDto;
import com.Ecommerce.bookEcommerce.dto.checkout.CheckoutItemDto;
import com.Ecommerce.bookEcommerce.exceptions.AuthenticationFailException;
import com.Ecommerce.bookEcommerce.exceptions.OrderNotFoundException;
import com.Ecommerce.bookEcommerce.model.CustomUserDetails;
import com.Ecommerce.bookEcommerce.model.Order;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.repository.CategoryRepo;
import com.Ecommerce.bookEcommerce.service.AuthenticationService;
import com.Ecommerce.bookEcommerce.service.BookService;
import com.Ecommerce.bookEcommerce.service.CartService;
import com.Ecommerce.bookEcommerce.service.OrderService;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@PreAuthorize("isAuthenticated()")
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private AuthenticationService authenticationService;
	@Autowired
	BookService bookService;
	@Value("${BASE_URL}")
	private String baseURL;
	@Autowired
	CategoryRepo categoryRepo;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartSevice;

//    @PostMapping("/create-checkout-session")
//    public ResponseEntity<StripeResponse> checkoutList(@RequestBody List<CheckoutItemDto> checkoutItemDtoList)
//    throws StripeException{
//        Session session = orderService.createSession(checkoutItemDtoList);
//        StripeResponse stripeResponse = new StripeResponse(session.getId());
//        return new ResponseEntity<StripeResponse>(stripeResponse, HttpStatus.OK);
//    }

	@PostMapping("/create-checkout-session")
	public String checkoutList(Authentication authentication, RedirectAttributes redirectAttributes)
			throws StripeException {
		List<CheckoutItemDto> checkoutItemDtoList = new ArrayList<CheckoutItemDto>();
		CartDto cart = cartSevice.listCartItems(showLoggedInUser(authentication));

		// create payment session
		if (cart.getCartItems().isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "Giỏ hàng trống!");
			return "redirect:/cart";
		}

		for (CartItemDto item : cart.getCartItems()) {
			CheckoutItemDto checkouItem = new CheckoutItemDto();
			checkouItem.setBookId(item.getBook().getId());
			checkouItem.setBookName(item.getBook().getName());
			checkouItem.setPrice(item.getBook().getPrice());
			checkouItem.setQuantity(item.getQuantity());
			checkouItem.setUserId(showLoggedInUser(authentication).getId());
			checkoutItemDtoList.add(checkouItem);
		}
		Session session = orderService.createSession(checkoutItemDtoList);
		String checkoutUrl = session.getUrl();
		return "redirect:" + checkoutUrl;
	}

	@GetMapping("/success")
	public String placeOrder(Authentication authentication, @RequestParam String sessionId)
			throws AuthenticationFailException {
		// Place order
		User user = showLoggedInUser(authentication);
		orderService.placeOrder(user, sessionId);
		return "home/order-success";
	}

	@GetMapping("/list")
	public String getAllOrders(Authentication authentication, Model model) throws AuthenticationFailException {
		User user = showLoggedInUser(authentication);
		List<Order> orderDtoList = orderService.listOrders(user);
		getHomeContent(model, authentication);
		model.addAttribute("data", orderDtoList);
		return "home/orders";
	}

	@GetMapping("/{id}")
	public String getOrderById(@PathVariable("id") Integer id, Authentication authentication, Model model)
			throws AuthenticationFailException {
		try {
			getHomeContent(model, authentication);
			Order order = orderService.getOrder(id);
			model.addAttribute("order", order);
			return "home/order-detail";
		} catch (OrderNotFoundException e) {
			return "error/404";
		}
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
			CartDto cart = cartSevice.listCartItems(user);
			model.addAttribute("cart", cart);
			model.addAttribute("user", user);
		}
	}
}
