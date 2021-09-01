package com.blog.main.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blog.main.dao.ContactDao;
import com.blog.main.dao.UserDao;
import com.blog.main.model.Contact;
import com.blog.main.model.User;

@RestController
public class SearchController {
	@Autowired
	private UserDao dao;
	
	@Autowired
	private ContactDao contactDao;
	
	@GetMapping("/search/{name}")
	public ResponseEntity<List<Contact>> search(Principal principal, @PathVariable("name") String name){
		User user = dao.findByEmailId(principal.getName());
		List<Contact> contacts = contactDao.getSearchContacts(name,  user.getuId());
		
		return ResponseEntity.ok(contacts);
		
	}
}
