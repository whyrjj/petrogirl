package com.petrogirl.petrol.common.service.impl;

import com.petrogirl.petrol.common.entity.User;
import com.petrogirl.petrol.common.entity.Role;
import com.petrogirl.petrol.common.service.UserService;
import com.petrogirl.petrol.common.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Service
@Transactional
public class UserServiceImpl extends DaoSupport<User> implements UserService {

	@Override
	@Transactional
	public Set<String> getRoleNames(String username) {
		User user = find(username);
		Set<Role> roles = user.getRoles();
		Set<String> roleNames = new HashSet<>();
		if (roles != null) {
			for (Role role : roles) {
				roleNames.add(role.getName());
			}
		}
		return roleNames;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public boolean isExsitUsername(String username) {
		
		
		String jpql = "select o from User o where o.username=?";
		
		List<User> emploees = getByJpql(jpql, new Object[]{username});
		
		if (emploees.size() > 0) {
			return true;
		}
		
		return false;
	}


}
