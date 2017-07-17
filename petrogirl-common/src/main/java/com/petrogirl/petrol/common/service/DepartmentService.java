package com.petrogirl.petrol.common.service;

import com.petrogirl.petrol.common.entity.Department;
import com.petrogirl.petrol.common.service.base.DAO;

import java.util.List;


public interface DepartmentService extends DAO<Department> {


	//判断组中是否存在该组名的组
	/**
	 * 
	 * @param parentDepart 父级部门, 如果为null或者-1那么说明是顶级部门
	 * @param departName   所添加部门名
	 * @return 如果存在则返回true， 否则返回false
	 */
	public boolean isExsitDepart(Integer parentDepart, String departName) ;
	
	
	/**
	 * 得到公司的顶级部门
	 * @return
	 */
	public List<Department> getTopDepartments();
}
