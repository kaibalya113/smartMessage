package com.blog.main;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.blog.main.dao.UserDao;
import com.blog.main.model.User;

@SpringBootTest
class BlogApplicationTests {

	@Autowired
	private UserDao userDao;
	@Test
	void contextLoads() {
	}
	
//	@Test
//	public void saveUser() {
//		User user = User.builder().aboutMe("hi i am").
//	}

}
