package com.blog.main.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.blog.main.model.Contact;

public interface ContactDao extends JpaRepository<Contact, Integer>{
	
	
	@Query("from Contact c where c.user.uId=:userId")
	public Page<Contact> findContactsByUser(@Param("userId") Integer uId, Pageable pageable);
	
	@Query("from Contact c where c.user.uId=?1 and c.time LIKE %?2% order by c.time desc")
	public List<Contact> getContactsByTime(Integer uId, String time);
	// pagination
}
