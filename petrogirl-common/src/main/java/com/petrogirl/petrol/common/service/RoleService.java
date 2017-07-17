package com.petrogirl.petrol.common.service;

import com.petrogirl.petrol.common.entity.Role;
import com.petrogirl.petrol.common.service.base.DAO;

import java.util.Set;


public interface RoleService extends DAO<Role> {

	Set<String> getPermissions(String... roleNames);

	boolean isExist(String name);

}
