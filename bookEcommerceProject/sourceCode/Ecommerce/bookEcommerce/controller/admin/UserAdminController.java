package com.Ecommerce.bookEcommerce.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Ecommerce.bookEcommerce.common.RoleUser;
import com.Ecommerce.bookEcommerce.dto.user.SignUpDto;
import com.Ecommerce.bookEcommerce.model.CustomUserDetails;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.service.UserService;

@Controller
@RequestMapping("/admin/user")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class UserAdminController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/create")
	public String createUser(Model model) {
		model.addAttribute("user", new SignUpDto());
		return "admin/user/create";
	}
	
	
	@PostMapping("/create")
	public String saveUser(@ModelAttribute(name = "user") SignUpDto user, Model model) {
		User savedUser = userService.createUser(user, RoleUser.ROLE_ADMIN);
		if(savedUser != null ) {
			model.addAttribute("message", "Create User Successful");
		}else {
			model.addAttribute("messageError", "Create User Failed");
		}
	
		return "admin/user/create";
	}
	
	
	@GetMapping("/list")
	public String listOfUser(Model model) {
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return "admin/user/list";
	}
	
	
	@GetMapping("/edit/{id}")
	public String detailOfUser(@PathVariable Integer id,Model model) {
		User user = userService.findById(id);
		model.addAttribute("user", user);
		return "admin/user/edit";
	}
	
	
	@PostMapping("/edit")
	public String updateUser(@ModelAttribute User user, Model model) {
		User updateUser = userService.updateUser(user);
		if(updateUser != null) {
			model.addAttribute("user", updateUser);
			model.addAttribute("message", "Update User Successful");
		}else {
			model.addAttribute("messageError", "Update User Failed");
		}
		return "admin/user/edit";
	}
	
	
	@GetMapping("/delete/{id}")
	public String deleteUserById(@PathVariable Integer id, RedirectAttributes redirect) {
		try {
			userService.deleteById(id);
			redirect.addFlashAttribute("message", "Delete User Successful");
		} catch (Exception e) {
			redirect.addFlashAttribute("messageError", e.getMessage());
		}
		return "redirect:/admin/user/list";
	}
	
	
	/*
	 * @PostMapping("/profile") public String profile(HttpServletRequest request,
	 * 
	 * @AuthenticationPrincipal CustomUserDetails userDetails) { String firstName =
	 * request.getParameter("firstName"); String lastName =
	 * request.getParameter("lastName"); return "admin/user/profile"; }
	 */
	
	
	
	
}
