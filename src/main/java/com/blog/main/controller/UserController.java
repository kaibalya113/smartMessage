package com.blog.main.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.main.dao.UserDao;
import com.blog.main.model.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {

	@Autowired
	private UserDao dao;
	@RequestMapping("/dashboard")
	public String dashboard( Model model, Principal principal ) {
		log.info(principal.getName());
		User user = dao.findByEmailId(principal.getName());
		model.addAttribute("username", user.getName());
		log.info("dashboard is calling...");
		return "dashboard";
	}
	
	
}
