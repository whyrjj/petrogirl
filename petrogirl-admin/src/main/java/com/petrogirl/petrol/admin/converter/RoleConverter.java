package com.petrogirl.petrol.admin.converter;

import com.petrogirl.petrol.common.entity.Role;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;


@Component
public class RoleConverter implements Converter<String, Role> {

	@Override
	public Role convert(String source) {
		Role role = new Role();
		role.setName(source);
		return role;
	}

}
