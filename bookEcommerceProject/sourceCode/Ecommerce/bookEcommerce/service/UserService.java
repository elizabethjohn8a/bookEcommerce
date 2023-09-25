package com.Ecommerce.bookEcommerce.service;

import com.Ecommerce.bookEcommerce.common.RoleUser;
import com.Ecommerce.bookEcommerce.dto.ResponseDto;
import com.Ecommerce.bookEcommerce.dto.user.SignInDto;
import com.Ecommerce.bookEcommerce.dto.user.SignInResponseDto;
import com.Ecommerce.bookEcommerce.dto.user.SignUpDto;
import com.Ecommerce.bookEcommerce.exceptions.AuthenticationFailException;
import com.Ecommerce.bookEcommerce.exceptions.CustomException;
import com.Ecommerce.bookEcommerce.model.AuthenticationToken;
import com.Ecommerce.bookEcommerce.model.CustomUserDetails;
import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Set;

@Service
public class UserService{
    @Autowired
    UserRepository userRepository;

    @Autowired
    AuthenticationService authenticationService;

    @Autowired
    private BCryptPasswordEncoder encoderPassword;
    
    
    public boolean findUserByEmail(String email) {
    	User user = userRepository.findByEmail(email);
    	return user != null ? false : true;
    }
    
    public User createUser(SignUpDto signUpDto, RoleUser roleUser) {
    	try {
    		User user = new User(signUpDto.getFirstName(), signUpDto.getLastName(), 
        			signUpDto.getEmail(), encoderPassword.encode(signUpDto.getPassword()), roleUser);
        	
        	return userRepository.save(user);
    	}catch (Exception e) {
    		e.printStackTrace();
			return null;
		}
    }
    

    public ResponseDto signUp(SignUpDto signUpDto) {

        if(Objects.nonNull(userRepository.findByEmail(signUpDto.getEmail()))){
            throw new CustomException("User has been already present.");
        }

        String encryptedPassword = signUpDto.getPassword();
        try{
            encryptedPassword = hashPassword(signUpDto.getPassword());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        User user = new User(signUpDto.getFirstName(), signUpDto.getLastName(), signUpDto.getEmail(), encryptedPassword, RoleUser.ROLE_ADMIN);
        userRepository.save(user);

        final AuthenticationToken authenticationToken = new AuthenticationToken(user);
        authenticationService.saveConfirmationToken(authenticationToken);

        ResponseDto responseDto = new ResponseDto("success", "User is created successfully.");
        return responseDto;
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        messageDigest.update(password.getBytes());
        byte[] digest = messageDigest.digest();
        String hash = DatatypeConverter.printHexBinary(digest).toUpperCase();
        return hash;
    }

    public SignInResponseDto signIn(SignInDto signInDto) {
        User user = userRepository.findByEmail(signInDto.getEmail());
        if(Objects.isNull(user)){
            throw new AuthenticationFailException("User is not valid!");
        }
        try {
            if(!user.getPassword().equals(hashPassword(signInDto.getPassword()))){
                throw new AuthenticationFailException("Wrong password!");
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        AuthenticationToken token = authenticationService.getToken(user);
        if(Objects.isNull(token)){
            throw new CustomException("Token is not present!");
        }
        return new SignInResponseDto("success", token.getToken());
    }
    
    
    public void updateResetTokenPassword(String token, String email) {
 	   User user = userRepository.findByEmail(email);
 	   if(user != null) {
 		   user.setResetPasswordToken(token);
 		   userRepository.save(user);
 	   }else
 		   throw new NoSuchElementException("Cannot found email " + email);
    }
    
    public User getByResetPasswordToken(String token) {
        return userRepository.findByResetPasswordToken(token);
    }
    
    public void updatePassword(User user, String newPassword) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(newPassword);
        user.setPassword(encodedPassword);
        user.setResetPasswordToken(null);
        userRepository.save(user);
    }

    public User findById(Integer id) {
    	User user = userRepository.findById(id)
    			.orElseThrow(() -> new NoSuchElementException("Cannot found user have id" + id) );
    	return user;
    }
    
    public List<User> findAll(){
    	return userRepository.findAll();
    }
    
    public void deleteById(Integer id) throws Exception {
    	try {
    		userRepository.deleteById(id);
    	}catch (Exception e) {
			throw new Exception("Cannot delete user have id" + id);
		}
    }
    
    
    public User updateUser(User user) {
    	User userDb = userRepository.findById(user.getId()).get();
    	if(user != null) {
    		userDb.setFirstName(user.getFirstName());
    		userDb.setLastName(user.getLastName());
    		return userRepository.save(userDb);
    	}
    	return null;
    }
    
    
    public void updatePasswordUser(String oldPassword, String newPassword, Integer id) throws Exception {
    	User user = userRepository.findById(id).get();
    	boolean isMatchOld = encoderPassword.matches(oldPassword, user.getPassword());
    	if(isMatchOld) {
    		boolean isMatchNew = encoderPassword.matches(newPassword, user.getPassword());
    		if(isMatchNew)
    			throw new Exception("Mật khẩu mới không được trùng với mật khẩu hiện tại");
    		else {
    			user.setPassword(encoderPassword.encode(newPassword));
    			userRepository.save(user);
    		}
    			
    	}else {
    		throw new Exception("Mật khẩu hiện tại không trùng khớp");
    	}
    }
    
}
