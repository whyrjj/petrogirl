package com.petrogirl.petrol.common.service.impl;

import com.petrogirl.petrol.common.entity.Department;
import com.petrogirl.petrol.common.service.DepartmentService;
import com.petrogirl.petrol.common.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class DepartmentServiceImpl extends DaoSupport<Department> implements DepartmentService {

	@Override
	public boolean isExsitDepart(Integer parentDepart, String departName) {

		String whereSql = " o.name=? ";
		List<Object> paras = new ArrayList<Object>();
		paras.add(departName);
		if (! (parentDepart == null || parentDepart == -1) ) {
			whereSql +=  " and o.parentDepart.id=?"  ;
			paras.add(parentDepart);
		}
		
		String jpql = "select o from Department o where " + whereSql;
		
		
		List<Department> deparst = getByJpql(jpql, paras.toArray());
		
		if (deparst != null && deparst.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	
	@Override
	public List<Department> getTopDepartments() {
		return getByJpql("select o from Department o where o.parentDepart is null", new Object[]{});
	}
}
