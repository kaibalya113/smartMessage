package com.blog.main.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.nio.file.Path;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.dom4j.io.SAXReader;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Attr;
import org.w3c.dom.DOMImplementation;
import org.w3c.dom.Document;
import org.w3c.dom.DocumentType;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.blog.main.dao.ContactDao;
import com.blog.main.dao.UserDao;
import com.blog.main.model.Contact;
import com.blog.main.model.User;
import com.opencsv.CSVParser;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ApiController {
	public SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ContactDao contactDao;
	
	@GetMapping("/user/onlinecontact")
	public ResponseEntity<?> getListOfOnlineContacts(Principal principal){
		
		User user = userDao.getUserByUsername(principal.getName());
		List<User> onlineUser = null;
		List<User> userList = new ArrayList<>();
		if(user != null) {
			// get list of user other are online 
			String usrId = String.valueOf(user.getuId());
			onlineUser = userDao.getListOfOnlineUser(user.getuId());
			if(onlineUser.size() ==0) {
				log.info("Online user not found");
			}
			for (User u : onlineUser) {
				//List<User> user1 = new ArrayList<>();
				User uo = new User();
				uo.setuId(u.getuId());
				uo.setName(u.getName());
				uo.setEmailId(u.getEmailId());
				uo.setImageUrl(u.getImageUrl());
				
				userList.add(uo);
				
			}
		}
		
		//return ResponseEntity.;
		return ResponseEntity.ok(userList);
	}
	@PostMapping("/user/uploadImage")
	public ResponseEntity<?> uploadProfilePic(HttpServletRequest req, MultipartFile file, Principal principal) throws ParserConfigurationException, SAXException, IOException{
		User user = userDao.getUserByUsername(principal.getName());
		// get the mobile no 
		
		if(user.getPhoneNumber() == null) {
			return ResponseEntity.ok("Mobile no is not set.. Please set Phone Number set.");
		}else {
			if(!file.isEmpty()) {
				String fileName = user.getPhoneNumber()+file.getOriginalFilename();
				user.setImageUrl(fileName);
				InputStream is = file.getInputStream();
				byte b[] = new byte[is.available()];
				is.read(b);
				
				// write
				FileOutputStream fos = new FileOutputStream(UserController.EXTERNAL_FILE_PATH+ File.separator+fileName);
				fos.write(b);
				fos.close();
				
				userDao.save(user);
				
			}else {
				return ResponseEntity.ok("Image can not be null.");
			}
		}
		
		return null;
	}
	//
	@PostMapping("/update/mobile")
	public ResponseEntity<?> updateMobile(HttpServletRequest req, Principal principal){
		String mobile = req.getParameter("mobile");
		User user = userDao.getUserByUsername(principal.getName());
		//log.info(mobile);
		if(mobile != null) {
			try {
				user.setPhoneNumber(mobile);
				userDao.save(user);
			}catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		
		return ResponseEntity.ok("Upadte Successful");
	}
	
	@PostMapping("/upload/csvfile")
	public ResponseEntity<?> uploadCSV(HttpServletRequest req, Principal principal, MultipartFile file) throws IOException, CsvException{
		
		User user = userDao.getUserByUsername(principal.getName());
		String fileName = null;
		if(user != null) {
			if(file!=null) {
				fileName = user.getPhoneNumber()+file.getOriginalFilename();
				
				try {
				InputStream is = file.getInputStream();
				byte b[] = new byte[is.available()];
				is.read(b);
				
				// write
				FileOutputStream fos = new FileOutputStream(UserController.EXTERNAL_CSV_FILE_PATH+ File.separator+fileName);
				fos.write(b);
				fos.close();
				}catch (Exception e) {
					log.error(e.getMessage());
				}
				
				
				// pick file 
				String path = UserController.EXTERNAL_CSV_FILE_PATH+ File.separator+fileName;
				
				CSVReader reader = new CSVReader(new FileReader(path));
				List<String[]> r = reader.readAll();
				ArrayList<Contact> lcontact = new ArrayList<>();
				r.forEach((data) ->{
					if(!data[0].contains("description")){
						
						Contact contact = new Contact();
						contact.setDescription(data[0]);
						contact.setEmailId(data[1]);
						contact.setImage(null);
						contact.setName(data[2]);
						contact.setPhoneNumber(data[3]);
						contact.setWork(data[4]);
						contact.setUser(user);
						contact.setTime(formatter.format(new Date()));
						lcontact.add(contact);
					}
				});
				
				
				try {
					contactDao.saveAll(lcontact);
				}catch (Exception e) {
					log.error(e.getMessage());
				}
				//lcontact.forEach(x -> log.info(x.getEmailId()));
				log.info("Sucessfully inserted...");
				
				
			}else{
				return ResponseEntity.ok("CSV file is needed...");
			}
			
		}else {
			return ResponseEntity.ok("User not Found");
		}
		
		return ResponseEntity.ok("Success");
	}
	
}
