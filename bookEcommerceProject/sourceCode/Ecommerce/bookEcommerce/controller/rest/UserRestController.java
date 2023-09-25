package com.Ecommerce.bookEcommerce.controller.rest;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Ecommerce.bookEcommerce.common.RoleUser;
import com.Ecommerce.bookEcommerce.dto.user.SignInDto;
import com.Ecommerce.bookEcommerce.dto.user.SignUpDto;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.service.UserService;

@RestController
@RequestMapping("/rest/user")
public class UserRestController {
	@Autowired
	UserService userService;

	@GetMapping(value = "/existEmail")
	public ResponseEntity<Boolean> checkEmailExist(@RequestParam String email) {
	      return new ResponseEntity<Boolean>(userService.findUserByEmail(email), HttpStatus.OK);
	}

	/*
	 * @PostMapping("/signin") public SignInResponseDto
	 * signIn(@ModelAttribute("signInDto") SignInDto signInDto){
	 * System.out.println(signInDto.getEmail() + " " + signInDto.getPassword());
	 * User user = userService.loadUserByUsername(signInDto.getEmail()); return
	 * userService.signIn(signInDto); }
	 */
}
