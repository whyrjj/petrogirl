package com.petrogirl.petrol.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contact")
public class ContactController {

	@RequestMapping("/index")
	public String index() {
		System.out.println("index");
		return "contact/index";
	}
	
}
