package com.Ecommerce.bookEcommerce.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.Ecommerce.bookEcommerce.model.CustomUserDetails;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.repository.UserRepository;

public class UserServiceDetailImpl implements UserDetailsService{

	@Autowired
	private UserRepository iUserRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = iUserRepository.findByEmail(username);
		if(user == null) {
			throw new UsernameNotFoundException("Cannot found user have email " + username);
		}
		
		return new CustomUserDetails(user);
	}

}
