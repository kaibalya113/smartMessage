package com.blog.main.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.blog.main.dao.ContactDao;
import com.blog.main.dao.UserDao;
import com.blog.main.model.User;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ApiController {

	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ContactDao contactDao;
	
	@GetMapping("/user/onlinecontact")
	public ResponseEntity<?> getListOfOnlineContacts(Principal principal){
		
		User user = userDao.getUserByUsername(principal.getName());
		List<User> onlineUser = null;
		List<User> userList = new ArrayList<>();
		if(user != null) {
			// get list of user other are online 
			String usrId = String.valueOf(user.getuId());
			onlineUser = userDao.getListOfOnlineUser(user.getuId());
			if(onlineUser.size() ==0) {
				log.info("Online user not found");
			}
			for (User u : onlineUser) {
				//List<User> user1 = new ArrayList<>();
				User uo = new User();
				uo.setuId(u.getuId());
				uo.setName(u.getName());
				uo.setEmailId(u.getEmailId());
				uo.setImageUrl(u.getImageUrl());
				
				userList.add(uo);
				
			}
		}
		
		//return ResponseEntity.;
		return ResponseEntity.ok(userList);
	}
	@PostMapping("/user/uploadImage")
	public ResponseEntity<?> uploadProfilePic(HttpServletRequest req, MultipartFile file, Principal principal){
		User user = userDao.getUserByUsername(principal.getName());
		
		
		if(!file.isEmpty()) {
			//String fileName = user.ge.getPhoneNumber()+file.getOriginalFilename();
			
//			contact.setImage(fileName);
//			InputStream is = file.getInputStream();
//			byte b[] = new byte[is.available()];
//			is.read(b);
//			
//			// write
//			FileOutputStream fos = new FileOutputStream(UserController.EXTERNAL_FILE_PATH+"/"+fileName);
//			fos.write(b);
//			fos.close();
		}
		//log.info(file1);
		return null;
	}
}
