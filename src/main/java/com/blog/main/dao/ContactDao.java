package com.blog.main.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.blog.main.model.Contact;

public interface ContactDao extends JpaRepository<Contact, Integer>{
	
	
	@Query("from Contact c where c.user.uId=:userId and c.isDeleted=0")
	public Page<Contact> findContactsByUser(@Param("userId") Integer uId, Pageable pageable);
	
	@Query("from Contact c where c.isDeleted=0 and c.user.uId=?1 and c.time LIKE %?2% order by c.time desc")
	public List<Contact> getContactsByTime(Integer uId, String time);
	
	@Query("from Contact c where c.user.uId=:userId")
	public List<Contact> findContactsByUserId(@Param("userId") Integer uId);
	
	@Transactional
	@Modifying
	@Query("update Contact c  set  c.isDeleted = true where c.cId=:cId")
	public void deleteContact(@Param("cId") Integer cId);

	@Query("from Contact c where c.name LIKE %?1% and c.user.uId=?2")
	public List<Contact> getSearchContacts(String search, Integer userId);
}
