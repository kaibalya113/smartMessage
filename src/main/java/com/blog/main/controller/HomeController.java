package com.blog.main.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.blog.main.utils.PasswordDecryption;
import com.blog.main.utils.Response;
import com.blog.main.utils.Utils;

import lombok.extern.slf4j.Slf4j;
//import org.json.JSONObject;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;


@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private UserDao dao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping({"/"})
	public String index(Model model) {
		return "landingpage";
	}
	
	@GetMapping({"/forgotpassword"})
	public String forgotPassword(Model model) {
		return "forgotPassword";
	}
	
	@GetMapping({"/postregister"})
	public String postRegister(Model model) {
		model.addAttribute("pageName", "Smart-Contact");
		model.addAttribute("user", new User());
		model.addAttribute("isLogin", false);
		return "home";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("pageName", "Smart-Contact");
		model.addAttribute("isLogin", true);
		return "home";
	}
	
	@PostMapping("/register")
	public ResponseEntity<?> register( @RequestBody User user, HttpServletRequest req) {
		
		Response res = new Response();
		
		log.info("zzzzzzzzzz :: "+user.toString());
		if(user.getName().equals("") || user.getPassword().equals("") || user.getEmailId().equals("")) {
			res.setMsg("Insert data");
			return ResponseEntity.badRequest().body(res);
		}
		user.setRole("ROLE_USER");
		user.setEnabled(true);
		
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		
		log.info(user.getPassword());
		
		try {
			dao.save(user);
		}catch (Exception e) {
			log.info(e.getMessage().toString());
			res.setMsg(e.getMessage());
			return ResponseEntity.badRequest().body(res);
		}
		log.info(user.toString());
		res.setMsg("Successful, Please Login with your Email and Password");
		
		
		return ResponseEntity.accepted().body(res);
	}
	
	@PostMapping("/forgotpsw")
	public ResponseEntity<?> forgotPassword(HttpServletRequest req, Model model) {
		JSONObject js = new JSONObject();
		Response res = new Response();
		log.info("Entered Email :: "+ req.getParameter("emailId"));
		String email = req.getParameter("emailId");
		
		
		
		User user = dao.findByEmailId(email);
		boolean ischanged = false;
		String newPassword = "";
		if(user != null) {
			newPassword = Utils.randomPasswordGenerator();
			// this pass word will encrypt and save to the db
			user.setPassword(bCryptPasswordEncoder.encode(newPassword));
			try {
			dao.save(user);}catch(Exception e) {log.error(" "+e.getMessage());}
			ischanged = true;
			res.setMsg("password changed successfully : Password Is :: "+ newPassword);
			js.put("msg", "password changed successfully : Password Is :: "+ newPassword);
		}else {
			res.setMsg("Password is not changed...");
			js.put("msg", "Password is not changed...");
		}
		return ResponseEntity.accepted().body(js);  
		
	}
}
