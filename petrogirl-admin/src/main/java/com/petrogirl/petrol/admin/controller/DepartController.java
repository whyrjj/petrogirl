package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.common.entity.Department;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.DepartmentService;
import com.petrogirl.petrol.common.utils.Global;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


@Controller
@RequestMapping("${adminPath}/depart")
public class DepartController {
	
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value = {"add"}, method = RequestMethod.GET)
	@RequiresPermissions(value = "depart:add")
	public String addUI(@ModelAttribute("department") Department department, Model model) {
		
		QueryResult<Department> queryResult = departmentService.getScrollData();
		List<Department> departs = queryResult.getResultlist();
		
		if (departs == null || departs.size()==0) {
			//现在数据库中没有部门，加入一个部门
			Department depart = new Department();
			depart.setName("总经办");
			departmentService.save(depart);
			
			departs = departmentService.getScrollData().getResultlist();
		}
		
		model.addAttribute("departs", departs);
	    return "depart/add";  
	}
	
	
	@RequestMapping(value = {"add"}, method = RequestMethod.POST)
	@RequiresPermissions(value = "depart:add")
	public String add(@ModelAttribute("department") Department department, Model model) {  
		
		//所属部门、
		if (department.getParentDepart() != null && department.getParentDepart().getId() != null && department.getParentDepart().getId() != -1) {
			//判断是否传过来父部门
			Department parentDepart = departmentService.find(department.getParentDepart().getId());
			department.setParentDepart(parentDepart);
		} else {
			return "forward:add";
		}
		
		//先判断是否存在该部门
		if ( departmentService.isExsitDepart(department.getParentDepart().getId(), department.getName()) ) {
			//存在
			model.addAttribute("exist", true);
			return "forward:add";
		}
		
		departmentService.save(department);
		
		return "redirect:" + Global.getAdminPath() + "/depart/list" + Global.getUrlSuffix();
	}
	
	
	@RequestMapping(value = {"", "list"})
	@RequiresPermissions(value = "depart:list")
	public String list(Model model) {  
		
		//把公司的顶级组织结构，全部查出来
		List<Department> departs = departmentService.getTopDepartments();
		model.addAttribute("departs", departs);
		
	    return "depart/list";  
	}
}
