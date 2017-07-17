package com.petrogirl.petrol.common.service;

import com.petrogirl.petrol.common.service.base.DAO;
import com.petrogirl.petrol.common.entity.User;

import java.util.Set;


public interface UserService extends DAO<User> {

	Set<String> getRoleNames(String username);

	/**
	 * 
	 * @return 如果存在则返回true， 否则返回false
	 */
	public boolean isExsitUsername(String username) ;
}
