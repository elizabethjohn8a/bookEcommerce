package com.Ecommerce.bookEcommerce.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Ecommerce.bookEcommerce.model.CustomUserDetails;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.service.UserService;

@Controller
@RequestMapping("/profile")
@PreAuthorize("isAuthenticated()")
public class ProfileController {
	
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/details")
	public String profile(Model model, 
    @AuthenticationPrincipal CustomUserDetails loggedUser) {
		model.addAttribute("user", userService.findById(loggedUser.getUser().getId()));
		return "profile/details";
	}
	
	
	@PostMapping
	public String updateProfile(@ModelAttribute User user,
			@AuthenticationPrincipal CustomUserDetails loggedUser, Model model) {
		User updateUser = userService.updateUser(user);
		if(updateUser != null) {
			model.addAttribute("user", updateUser);
			model.addAttribute("message", "Update User Successful");
			loggedUser.getUser().setFirstName(user.getFirstName());
			loggedUser.getUser().setLastName(user.getLastName());
		}else {
			model.addAttribute("messageError", "Update User Failed");
		}
		
		return "profile/details";
	}
	
	
	
	@GetMapping("/change-password")
	public String changePassword() {
		return "profile/change-password";
	}
	
	
	@PostMapping("/change-password")
	public String changeUserPassword(HttpServletRequest request, 
			@AuthenticationPrincipal CustomUserDetails loggedUser, Model model) {
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");
		try {
			userService.updatePasswordUser(password, newPassword, loggedUser.getUser().getId());
			model.addAttribute("message", "Đổi mật khẩu thành công");
		}catch (Exception e) {
			model.addAttribute("messageError", e.getMessage().toString());
		}
		
		return "profile/change-password";
	}
	
	
	/*
	 * @PostMapping("/profile") public String profile(HttpServletRequest request,
	 * 
	 * @AuthenticationPrincipal CustomUserDetails userDetails) { String firstName =
	 * request.getParameter("firstName"); String lastName =
	 * request.getParameter("lastName"); return "admin/user/profile"; }
	 */
	
	
	
	
}
