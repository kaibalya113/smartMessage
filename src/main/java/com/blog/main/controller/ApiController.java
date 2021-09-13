package com.blog.main.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blog.main.dao.UserDao;
import com.blog.main.model.User;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ApiController {

	
	@Autowired
	private UserDao userDao;
	@GetMapping("/user/onlinecontact")
	public ResponseEntity<?> getListOfOnlineContacts(Principal principal){
		User user = userDao.getUserByUsername(principal.getName());
		List<User> onlineUser = null;
		if(user != null) {
			// get list of user other are online 
			String usrId = String.valueOf(user.getuId());
			onlineUser = userDao.getListOfOnlineUser(user.getuId());
			if(onlineUser.size() ==0) {
				log.info("Online user not found");
			}
		}
		
		return ResponseEntity.ok(onlineUser);
	}
	
}
