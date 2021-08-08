package com.blog.main.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.blog.main.dao.UserDao;
import com.blog.main.model.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserDetailServiceImpl implements UserDetailsService{

	@Autowired
	private UserDao dao;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = dao.getUserByUsername(username);
		log.info("User Details ::: "+ user.toString());
		if(user == null) {
			throw new UsernameNotFoundException("Could Not Found");
		}
		CustomUserDetails userDetails = new CustomUserDetails(user);
//		UserDetails userDetails = User.emailId(user.getEmailId())
//	            .password(user.getPassword())
//	            .authorities("USER").build();
		log.info("userDetails :: "+ userDetails.toString());
		return userDetails;
	}

}
