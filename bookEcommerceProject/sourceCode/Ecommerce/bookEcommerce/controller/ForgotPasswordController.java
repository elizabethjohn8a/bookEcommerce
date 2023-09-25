package com.Ecommerce.bookEcommerce.controller;

import java.io.UnsupportedEncodingException;
import java.util.NoSuchElementException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Ecommerce.bookEcommerce.model.User;
import com.Ecommerce.bookEcommerce.repository.UserRepository;
import com.Ecommerce.bookEcommerce.service.UserService;
import com.Ecommerce.bookEcommerce.util.Utility;

import net.bytebuddy.utility.RandomString;

@Controller
public class ForgotPasswordController {

	@Autowired
	private UserService userService;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
		return "auth/forgot_password";
    }
	
	
	@PostMapping("/forgot-password")
	public String processForgotPassword(HttpServletRequest request, Model model) {
	    String email = request.getParameter("email");
	    String token = RandomString.make(30);
	     
	    try {
	        userService.updateResetTokenPassword(token, email);
	        String resetPasswordLink = Utility.getSiteURL(request) + "/reset-password?token=" + token;
	        sendEmail(email, resetPasswordLink);
	        model.addAttribute("message", "Chúng tôi đã gửi một đường link đến e-mail của bạn ! Vui lòng kiểm tra");
	         
	    } catch (NoSuchElementException ex) {
	        model.addAttribute("error", ex.getMessage());
	    } catch (UnsupportedEncodingException | MessagingException e) {
	        model.addAttribute("error", "Đã xảy ra khi đang gửi mail! Vui lòng thử lại");
	    }
	         
	    return "auth/forgot_password";
	}
	
	
	public void sendEmail(String recipientEmail, String link)
	        throws MessagingException, UnsupportedEncodingException {
	    MimeMessage message = mailSender.createMimeMessage();              
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	     
	    helper.setFrom("contact@velzone.com", "Velzone Support");
	    helper.setTo(recipientEmail);
	     
	    String subject = "Đây là đường link để bạn thay đổi mật khẩu";
	     
	    String content = "<p>Xin chào,</p>"
	            + "<p>Bạn đã gửi cho chúng tôi yêu cầu để thay đổi mật khẩu</p>"
	            + "<p>Click đường link bên dưới để thay đổi mật khẩu</p>"
	            + "<p><a href=\"" + link + "\">Thay đổi mật khẩu của tôi</a></p>"
	            + "<br>"
	            + "<p>Hãy bỏ qua mail này nếu như bạn nhớ ra mật khẩu, "
	            + "hoặc bạn không phải là người gửi yêu cầu cho chúng tôi</p>";
	     
	    helper.setSubject(subject);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	}
	
	
	@GetMapping("/reset-password")
    public String showResetPasswordForm(@Param(value = "token") String token, Model model) {
		if(token != null) {
			User user = userService.getByResetPasswordToken(token);
		    model.addAttribute("token", token);
		    if (user == null) {
		        model.addAttribute("error", "Invalid Token");
		        return "auth/forgot_password";
		    }
		    return "auth/reset_password";
		}
		model.addAttribute("error", "Invalid Token");
		return "auth/forgot_password";
	    
    }
	
	@PostMapping("/reset-password")
	public String processResetPassword(HttpServletRequest request, Model model) {
	    String token = request.getParameter("token");
	    String password = request.getParameter("password");
	     
	    User user = userService.getByResetPasswordToken(token);
	     
	    if (user == null) {
	        model.addAttribute("message", "Invalid Token");
	        return "auth/forgot_password";
	    } else {           
	    	userService.updatePassword(user, password);
	        model.addAttribute("message", "You have successfully changed your password.");
	    }
	     
	    return "auth/success";
	}
	
	
}
