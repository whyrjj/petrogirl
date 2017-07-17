package com.petrogirl.petrol.common.service.impl;

import com.petrogirl.petrol.common.entity.Permission;
import com.petrogirl.petrol.common.entity.Role;
import com.petrogirl.petrol.common.service.RoleService;
import com.petrogirl.petrol.common.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;


@Service
public class RoleServiceImpl extends DaoSupport<Role> implements RoleService {

	@Transactional
	public Set<String> getPermissions(String... roleNames) {
		Set<String> permissions = new HashSet<>();
		if (roleNames != null) {
			for (String roleName : roleNames) {
				Role role = find(roleName);
				Set<Permission> ps = role.getPermissions();
				for (Permission permission : ps) {
					permissions.add(permission.getName());
				}
			}
		}
		return permissions;
	}

	public boolean isExist(String name) {
		Role role = find(name);
		return role != null;
	}


}
