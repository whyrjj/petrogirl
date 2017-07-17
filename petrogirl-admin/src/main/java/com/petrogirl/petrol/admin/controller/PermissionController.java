package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.admin.form.PermissionForm;
import com.petrogirl.petrol.admin.form.RoleForm;
import com.petrogirl.petrol.common.entity.Role;
import com.petrogirl.petrol.common.entity.User;
import com.petrogirl.petrol.common.service.PermissionService;
import com.petrogirl.petrol.common.service.RoleService;
import com.petrogirl.petrol.common.service.UserService;
import com.petrogirl.petrol.common.utils.Global;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@Controller
@RequestMapping("${adminPath}/permission")
public class PermissionController {
	
	@Autowired
	PermissionService permissionService;
	
	@Autowired
	RoleService roleService;
	
	
	@Autowired
	UserService userService;
	
	
	@RequestMapping(value = {"addRole"}, method = RequestMethod.GET)
	@RequiresPermissions(value = "role:add")
	public String addRoleUI(@ModelAttribute("role") Role role, Model model) {
		
		model.addAttribute("privileges", permissionService.getScrollData().getResultlist());
		
	    return "permission/addRole";  
	}
	
	@RequestMapping(value = {"editRole"}, method = RequestMethod.GET)
	public String editRoleUI(Role role, Model model) {  
		
		Role roledb = roleService.find(role.getName());
		model.addAttribute("privileges", permissionService.getScrollData().getResultlist());
		model.addAttribute("role", roledb);
		
		return "permission/editRole";  
	}
	
	@RequestMapping(value = {"editRole"}, method = RequestMethod.POST)
	public String editRole(@ModelAttribute("role") Role role, Model model) {  
		
		Role roledb = roleService.find(role.getName());
		roledb.setPermissions(role.getPermissions());
		roleService.update(roledb);
		
		return "redirect:" + Global.getAdminPath() + "/permission/roleList" + Global.getUrlSuffix();
	}
	
	
	@RequestMapping(value = {"addRole"}, method = RequestMethod.POST)
	@RequiresPermissions(value = "role:add")
	public String addRole(@ModelAttribute("role") Role role, Model model) {  
		
		// 先判断该组名是否存在
		if (roleService.isExist(role.getName())) {
			model.addAttribute("exist", true);
			return "exist";
		} else {
			System.out.println(role.getPermissions().size());
			roleService.save(role);
		}
		return "redirect:" + Global.getAdminPath() + "/permission/roleList" + Global.getUrlSuffix();
	}
	
	@RequestMapping(value = {"delRole"})
	public String delRole(@ModelAttribute("role") Role role) {  
		
		roleService.delete(role.getName());
		
		return "redirect:" + Global.getAdminPath() + "/permission/roleList" + Global.getUrlSuffix();
	}
	
	
	@RequestMapping(value = "list")
	public String list(@ModelAttribute("form") PermissionForm permissionForm, Model model) {
		
		permissionForm.getPageView().setQueryResult(permissionService.getScrollData(permissionForm.getPageView().getFirstResult(), permissionForm.getPageView().getMaxresult()));
		
	    return "permission/list";  
	}
	
	
	@RequestMapping(value = "changePermission", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Collection<String>> changePermissionUI(@RequestParam("username") String username, Model model) {  
		
		User user = userService.find(username);
		List<Role> allRoles = roleService.getScrollData().getResultlist();
		
		Map<String, Collection<String>> result = new HashMap<String, Collection<String>>();
		List<String> has = new ArrayList<String>();
		for (Role role : user.getRoles()) {
			has.add(role.getName());
		}
		
		List<String> all = new ArrayList<String>();
		for (Role role : allRoles) {
			all.add(role.getName());
		}
		result.put("has", has);
		result.put("all", all);
		
		return result;
	}
	
	@RequestMapping(value = "changePermission", method = RequestMethod.POST)
	@ResponseBody
	public boolean changePermission(User user, Model model) {  
		
		User userdb = userService.find(user.getUsername());
		userdb.setRoles(user.getRoles());
		userService.update(userdb);
		
		return true;
	}
	
	
	@RequestMapping(value = {"", "roleList"})
	@RequiresPermissions(value = "role:list")
	public String roleList(@ModelAttribute("form") RoleForm roleForm, Model model) {
		
		roleForm.getPageView().setQueryResult(roleService.getScrollData(roleForm.getPageView().getFirstResult(), roleForm.getPageView().getMaxresult()));
		
	    return "permission/roleList";  
	}
}
