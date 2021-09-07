package com.blog.main.utils;

import java.security.SecureRandom;

import org.springframework.stereotype.Component;

@Component
public class Utils {
	public static String randomPasswordGenerator() {
		String numericAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		
		SecureRandom random = new SecureRandom();
		StringBuilder sb = new StringBuilder();
		
		for(int i=0; i<6;i++) {
			int randomIndex = random.nextInt(numericAlphabet.charAt(i));
			sb.append(numericAlphabet.charAt(randomIndex-1));
		}
		
		
		return sb.toString();
	}
}
