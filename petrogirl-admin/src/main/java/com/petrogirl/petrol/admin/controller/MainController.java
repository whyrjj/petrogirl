package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.common.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("${adminPath}")
public class MainController {
	
	@RequestMapping(value = {"", "/main"}, method = RequestMethod.GET)
	public String main(@ModelAttribute("user") User user) {
	    return "main/index";  
	}
}
