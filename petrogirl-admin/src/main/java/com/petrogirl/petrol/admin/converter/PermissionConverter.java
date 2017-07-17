package com.petrogirl.petrol.admin.converter;

import com.petrogirl.petrol.common.entity.Permission;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;


@Component
public class PermissionConverter implements Converter<String, Permission> {

	@Override
	public Permission convert(String source) {
		Permission permission = new Permission();
		permission.setName(source);
		return permission;
	}

}
