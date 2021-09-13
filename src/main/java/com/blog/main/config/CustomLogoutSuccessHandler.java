package com.blog.main.config;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import com.blog.main.dao.UserDao;
import com.blog.main.model.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler {


		@Autowired
		private UserDao dao;

	    @Override
	    public void onLogoutSuccess( HttpServletRequest request,  HttpServletResponse response, 
	    		Authentication authentication)  throws IOException, ServletException {
	 
	        String refererUrl = request.getHeader("Referer");
	        String name = authentication.getName();
	        
	        
	        try {
				User user = dao.getUserByUsername(name);
				if(user != null) {
					user.setOnline(false);
					dao.save(user);
				}
			} catch (Exception e) {
				log.error("Error while log out :: "+ e.getMessage());
			}

	        super.onLogoutSuccess(request, response, authentication);
	    }
}
