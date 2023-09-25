package com.Ecommerce.bookEcommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.Ecommerce.bookEcommerce.common.RoleUser;
import com.Ecommerce.bookEcommerce.dto.user.SignInDto;
import com.Ecommerce.bookEcommerce.dto.user.SignUpDto;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.service.UserService;

@Controller
public class AuthController {
	@Autowired
	UserService userService;

	@GetMapping("/signup")
	public String signUp(Model model) {
		model.addAttribute("signup", new SignUpDto());
		return "auth/signup";
		
	}
	
	
	@PostMapping("/signup-proccess")
	public String signup(@ModelAttribute("signup") SignUpDto signUpDto) {
		User createUser = userService.createUser(signUpDto, RoleUser.ROLE_USER);
		if(createUser != null)
			return "redirect:/signup-success";
		return "redirect:/login";
	}

	@GetMapping("/login")
	public ModelAndView signIn() {
		ModelAndView model = new ModelAndView("auth/signin");
		model.addObject("signInDto", new SignInDto());
		return model;
	}
	
	 @GetMapping("/login-error")
	 public String loginError(Model model) {
	        String errorMessage = "Email hoặc mật khẩu không hợp lệ";
	        model.addAttribute("errorMessage", errorMessage);
	        return "auth/signin";
	 }
	 
	 
	 @GetMapping("/signup-success")
		public ModelAndView signUpSuccess() {
			ModelAndView model = new ModelAndView("auth/success");
			model.addObject("message", "Đăng kí thành công");
			return model;
		}
	 
	 @PostMapping("/auth/email")
	 public boolean isEmailExist(@RequestBody String email) {
		 return userService.findUserByEmail(email);
	 }
	 
	 
	 
	 

	/*
	 * @PostMapping("/signin") public SignInResponseDto
	 * signIn(@ModelAttribute("signInDto") SignInDto signInDto){
	 * System.out.println(signInDto.getEmail() + " " + signInDto.getPassword());
	 * User user = userService.loadUserByUsername(signInDto.getEmail()); return
	 * userService.signIn(signInDto); }
	 */
}
