package com.blog.main.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.blog.main.dao.ContactDao;
import com.blog.main.dao.UserDao;
import com.blog.main.model.Contact;
import com.blog.main.model.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/contact")
@Slf4j
public class ContactController {
	public SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Autowired
	private UserDao dao;
	
	@Autowired
	private ContactDao contactDao;
	
	@GetMapping("/updatecontact/{cid}")
	public String getSpecificContactForUpdate(HttpServletRequest req, @PathVariable("cid") Integer cId
			, Principal principal, Model model){
		// we will validate session 
		
		log.info("hittng contact controller");
		log.info("current logged in user ID :: "+ principal.getName());
		
		User user = dao.findByEmailId(principal.getName());
		Contact con = null;
		Optional<Contact> contact = contactDao.findById(cId);
		if(contact.isPresent()) con = contact.get();
		log.info("cId :: "+cId);
		model.addAttribute("contact", con);
		model.addAttribute("username", user.getName());
		return "updatecontact";
		
	}
	
	@PostMapping("/update" )
	public String updateContact(@ModelAttribute Contact contact, BindingResult result, Model model, Principal principal
			,@RequestParam("image") MultipartFile file)  throws ParseException {
		User user = dao.findByEmailId(principal.getName());
		Contact con = contactDao.getOne(contact.getcId());
		contact.setUser(user);	
		// add image 
		try {
			if(!file.isEmpty()) {
				String fileName = contact.getPhoneNumber()+file.getOriginalFilename();
				
				contact.setImage(fileName);
				InputStream is = file.getInputStream();
				byte b[] = new byte[is.available()];
				is.read(b);
				
				// write
				FileOutputStream fos = new FileOutputStream(UserController.EXTERNAL_FILE_PATH+"/"+fileName);
				fos.write(b);
				fos.close();
				
				
			}else {
				
				contact.setImage(con.getImage());
			}
		}catch (Exception e) {
			e.printStackTrace();		}
		
		
		// add update time
		contact.setTime(formatter.format(new Date()));
		try {
			contactDao.save(contact);
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return "dashboard";
	}
}
