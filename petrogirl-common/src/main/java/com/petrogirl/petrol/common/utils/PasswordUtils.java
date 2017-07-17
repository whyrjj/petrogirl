package com.petrogirl.petrol.common.utils;

import org.apache.shiro.codec.Hex;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 * 密码工具
 * @author mac
 *
 */
public class PasswordUtils {
	
	private PasswordUtils() {};

	/**
	 * 将明文密码加密为密文存库
	 * @param password 密码
	 * @param salt 盐
	 * @return 加密后的密码
	 */
	public static String encrypt(String password, String salt) {
		
		try {
			String algorithmName = "MD5";
			MessageDigest messageDigest = MessageDigest.getInstance(algorithmName);
			messageDigest.reset();
			messageDigest.update(salt.getBytes(Charset.forName("UTF-8")));
			byte[] hashed = messageDigest.digest(password.getBytes(Charset.forName("UTF-8")));
			return new String( Hex.encode(hashed) );
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String randomSalt() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 5; i++) {
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}
}
