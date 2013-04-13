package com.studentzone.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class MyUtilityFunctions {
	
	public static String createUUID() {
		UUID myUUID = UUID.randomUUID();
		return myUUID.toString();
	}
	
	public static String generateMD5(String inputtext) {
		//securing password
		//md5 hashing begins here
		MessageDigest mdAlgorithm = null;
		try {
			mdAlgorithm = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		mdAlgorithm.update(inputtext.getBytes());

		byte[] digest = mdAlgorithm.digest();
		StringBuffer hexString = new StringBuffer();

		for (int i = 0; i < digest.length; i++) {
			inputtext = Integer.toHexString(0xFF & digest[i]);

		    if (inputtext.length() < 2) {
		    	inputtext = "0" + inputtext;
		    }

		    hexString.append(inputtext);
		}
		//System.out.println((hexString.toString()));
		return hexString.toString();
		//md5 hashing ends here
	}
}
