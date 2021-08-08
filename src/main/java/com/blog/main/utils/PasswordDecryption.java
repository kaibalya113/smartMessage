package com.blog.main.utils;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class PasswordDecryption {
	
	public static String decrypt(String encrypted, String key) {
		 try {
	            String initVector = "3ad5485e60a4fecde36fa49ff63817dc";
	            // String encrypted =
	            // "zzNweS+ZhVlb9qH+TG/fwOBpa0S6+kMHcTY3LFt621aSd/thX3IZOQJqqvq2ePrx08cwdXyjzFoZWoERpNGIrU1kc+sExDyjD+S0HFEv1FM=";
	            IvParameterSpec iv = new IvParameterSpec(hex2ByteArray(initVector));
	            SecretKeySpec skeySpec = new SecretKeySpec(hex2ByteArray(key), "AES");// key as sessionID

	            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
	            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
	            byte[] original = cipher.doFinal(Base64.getDecoder().decode(encrypted));

	            log.info(new String(original));
	            return new String(original);
	        } catch (Exception e) {
	            log.error("", e);
	        }
	        return null;

		
	}
	
	private static byte[] hex2ByteArray(String sHexData) {
        byte rawData[] = new byte[sHexData.length() / 2];
        for (int i = 0; i < rawData.length; i++) {
            int index = i * 2;
            int v = Integer.parseInt(sHexData.substring(index, index + 2), 16);
            rawData[i] = (byte) v;
        }

        return rawData;
    }

}
