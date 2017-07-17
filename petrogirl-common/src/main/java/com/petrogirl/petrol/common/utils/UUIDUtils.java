package com.petrogirl.petrol.common.utils;

import java.util.UUID;

public class UUIDUtils {

	private UUIDUtils(){};
	
	public static String randomUUID() {
		UUID randomUUID = UUID.randomUUID();
		return randomUUID.toString().replace("-", "").toUpperCase();
	}
	
	
}
