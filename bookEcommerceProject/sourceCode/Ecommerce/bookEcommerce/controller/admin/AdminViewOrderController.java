package com.Ecommerce.bookEcommerce.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

@Controller
@PreAuthorize("hasRole('ROLE_ADMIN')")
@RequestMapping("/admin/order")
public class AdminViewOrderController {
	@Autowired
	private AuthenticationService authenticationService;
	@Autowired
	BookService bookService;

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
	@GetMapping("/{id}")
	public String getOrderById(@PathVariable("id") Integer id, Authentication authentication, Model model)
			throws AuthenticationFailException {
		try {
			getHomeContent(model, authentication);
			Order order = orderService.getOrder(id);
			model.addAttribute("order", order);
			return "admin/order/order-detail";
		} catch (OrderNotFoundException e) {
			return "error/404";
		}

	}
	
	@GetMapping("/list")
	public String getAllOrders(Authentication authentication, Model model) throws AuthenticationFailException {
		
		
		List<Order> orderDtoList = orderService.listAllOrders();
		
		model.addAttribute("data", orderDtoList);

		return "admin/order/orders";
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
