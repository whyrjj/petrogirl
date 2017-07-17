package com.petrogirl.petrol.common.entity;

/**
 * 性别
 *
 */
public enum Gender {
	MAN ,
	WOMEN;
	
	
	public int getIndex() {
		return ordinal();
	}
}
