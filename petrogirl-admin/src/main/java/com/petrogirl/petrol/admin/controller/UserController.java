package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.admin.form.UserForm;
import com.petrogirl.petrol.common.entity.Department;
import com.petrogirl.petrol.common.entity.Gender;
import com.petrogirl.petrol.common.entity.User;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.DepartmentService;
import com.petrogirl.petrol.common.service.UserService;
import com.petrogirl.petrol.common.utils.PasswordUtils;
import com.petrogirl.petrol.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


@Controller
@RequestMapping("${adminPath}/user")
public class UserController {
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = {"add"}, method = RequestMethod.GET)
	public String addUI(@ModelAttribute("user") User user, Model model) {
		
		model.addAttribute("genders", Gender.values());

		List<Department> departs = departmentService.getTopDepartments();
		model.addAttribute("departs", departs);
		
		
	    return "user/add";  
	}
	
	
	@RequestMapping(value = {"/add"}, method = RequestMethod.POST)
	public String add(@ModelAttribute("user") User user, Model model) {  
		
		boolean isExsit = userService.isExsitUsername(user.getUsername());

		if (isExsit) {
			model.addAttribute("exits", true);
			return "exist";
		}

		String randomSalt = PasswordUtils.randomSalt();
		user.setPasswordSalt(randomSalt);
		user.setPassword(PasswordUtils.encrypt(user.getPassword(), randomSalt));

		userService.save(user);
		
		return "redirect:list";
	}
	
	
	@RequestMapping(value = {"", "list"})
	public String list(@ModelAttribute("form") UserForm userForm, Model model) {
		
			if (userForm.getQueryBean().getDepart() !=null) {
				if (userForm.getQueryBean().getDepart().getId() != null) {
					if (userForm.getQueryBean().getDepart().getId() <= 0) {
						userForm.getQueryBean().setDepart(null);
					}
				}
				
			}
			
			if (StringUtils.isBlank(userForm.getQueryBean().getName())) {
				userForm.getQueryBean().setName(null);
			}
			
			if (StringUtils.isBlank(userForm.getQueryBean().getUsername())) {
				userForm.getQueryBean().setUsername(null);
			}
			
			userForm.getQueryBean().setEnable(null);
		
		QueryResult<User> scrollData = userService.getScrollData(userForm.getPageView().getFirstResult(), userForm.getPageView().getMaxresult(), userForm.getQueryBean());
		
		userForm.getPageView().setQueryResult(scrollData);

		List<Department> departs = departmentService.getScrollData().getResultlist();
		model.addAttribute("departs", departs);
		
	    return "user/list";  
	}
}
