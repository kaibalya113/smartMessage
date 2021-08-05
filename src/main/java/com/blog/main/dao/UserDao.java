package com.blog.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blog.main.model.User;

public interface UserDao extends JpaRepository<User, Long>{

}
