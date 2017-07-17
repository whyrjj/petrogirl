package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.common.entity.User;
import com.petrogirl.petrol.common.utils.Global;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("${adminPath}")
public class LoginController {
	
	/**
	 * 登陆失败会到这个地方来，具体的登陆操作在FormAuthenticationFilter中处理
	 * @param user 登陆的用户
	 * @param result 用户名密码验证结果是否有错
	 * @param request
	 * @return 登陆失败的界面
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLogin(
			@Validated
			@ModelAttribute("user")
					User user, BindingResult result, HttpServletRequest request) {
		
		if (result.hasErrors()) {
			System.out.println("validate failed");
			return "user/login";
		}
		
		String exceptionClassName = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		
	    String msg = "";  
	    if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {  
	        msg = "登录密码错误. Password for account " + user.getUsername() + " was incorrect.";
	        result.addError(new FieldError("password", "password", msg));
	    } else if (ExcessiveAttemptsException.class.getName().equals(exceptionClassName)) {  
	        msg = "登录失败次数过多";  
	        result.addError(new FieldError("password", "password", msg));
	    } else if (LockedAccountException.class.getName().equals(exceptionClassName)) {  
	        msg = "帐号已被锁定. The account for username " + user.getUsername() + " was locked.";  
	        result.addError(new FieldError("username", "username", msg));
	    } else if (DisabledAccountException.class.getName().equals(exceptionClassName)) {  
	        msg = "帐号已被禁用. The account for username " + user.getUsername() + " was disabled.";  
	        result.addError(new FieldError("username", "username", msg));
	    } else if (ExpiredCredentialsException.class.getName().equals(exceptionClassName)) {  
	        msg = "帐号已过期. the account for username " + user.getUsername() + "  was expired.";  
	        result.addError(new FieldError("username", "username", msg));
	    } else if (UnknownAccountException.class.getName().equals(exceptionClassName)) {  
	        msg = "帐号不存在. There is no user with username of " + user.getUsername();  
	        result.addError(new FieldError("username", "username", msg));
	    } else  {  
	        msg = "您没有得到相应的授权！" + exceptionClassName;  
	        result.addError(new FieldError("username", "username", msg));
	    }  
	    return "user/login";  
	}  
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginUI(@ModelAttribute("user") User user) {  
		if (SecurityUtils.getSubject().isAuthenticated() || SecurityUtils.getSubject().isRemembered()) {
			return "redirect:" + Global.getAdminPath() + Global.getUrlSuffix();
		}
		
	    return "user/login";  
	}
}
