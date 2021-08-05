package com.blog.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.blog.main.dao.UserDao;
import com.blog.main.model.Contact;
import com.blog.main.model.User;
import com.blog.main.utils.Response;

import lombok.extern.slf4j.Slf4j;
//import org.json.JSONObject;
import java.util.stream.Collectors;


@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private UserDao dao;
	
	@GetMapping({"/"})
	public String index(Model model) {
		model.addAttribute("pageName", "Smart-Contact");
		model.addAttribute("user", new User());
		return "home";
	}
	
	@PostMapping("/register")
	public ResponseEntity<?> register( @RequestBody User user, Errors errors) {
		
		Response res = new Response();
		if(errors.hasErrors()) {
			log.info("aaaaaaaaaaa");
			res.setMsg(errors.getAllErrors().stream().map(x-> x.getDefaultMessage()).collect(Collectors.joining(",")));
			return ResponseEntity.badRequest().body(res);
		}
		
		log.info("zzzzzzzzzz :: "+user.toString());
		if(user.getName().equals("") || user.getPassword().equals("") || user.getEmailId().equals("")) {
			
			log.info("aaaaaaaaaaa");
			
			res.setMsg("Insert data");
			return ResponseEntity.badRequest().body(res);
		}
		user.setRole("USER");
		
		
		log.info(user.toString());
		res.setMsg("Successful");
		//return ResponseEntity.accepted().body(res);
		//redirect to dashboard
		return null;
	}
	
	@PostMapping("/save")
	public ResponseEntity<String> saveUser(@RequestBody User user) {
		
		try {
			dao.save(user);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Failed");
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("working");
		
	}
	@GetMapping("/savea")
	public ResponseEntity<String> saveaUser() {
		
		try {
			User user = new User();
			user.setEmailId("mp@gmail.com");
			user.setName("krishna");
			
			List<Contact> listOfContact = new ArrayList<>();
			Contact contact = new Contact();
			contact.setName("seela");
			contact.setEmailId("kai@gmail.com");
			listOfContact.add(contact);
			user.setContact(listOfContact);
			dao.save(user);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.toString());
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("working");
		
	}
}
