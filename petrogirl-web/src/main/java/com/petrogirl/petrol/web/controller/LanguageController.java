package com.petrogirl.petrol.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

@Controller
public class LanguageController {

	
	@Autowired 
	LocaleResolver resolver;
    
    //@Autowired SessionLocaleResolver resolver;
     
    /**
     * 语言切换
     */
    @RequestMapping("language")
    public ModelAndView language(HttpServletRequest request,HttpServletResponse response,String language){
    	String referer = request.getHeader("referer");
    	if ( StringUtils.isEmpty(referer) ) {
    		referer = "/";
    	}
        language = language.toLowerCase();
        if( !StringUtils.isEmpty(language) ){
        	Locale locale = new Locale(language);
            resolver.setLocale(request, response, locale);
            
        }
        return new ModelAndView("redirect:" + referer);
    }
}
