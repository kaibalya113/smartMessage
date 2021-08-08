package com.blog.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.blog.main.model.User;
@Repository
public interface UserDao extends JpaRepository<User, Long>{
	
	@Query("Select u from User u where u.emailId=:email")
	public User getUserByUsername(@Param("email") String eamil);

	public User findByEmailId(String name);
}
