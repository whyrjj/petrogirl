package com.petrogirl.petrol.web.controller;

import com.petrogirl.petrol.web.form.ProductForm;
import com.petrogirl.petrol.common.entity.ProductCategory;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.LangService;
import com.petrogirl.petrol.common.service.ProductCategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;


@Controller
@RequestMapping("/support")
public class SupportController {

	static final Logger LOG = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	LangService langService;
	
	@Autowired
	ProductCategoryService productCategoryService;
	
	
	@Autowired 
	LocaleResolver resolver;

	@RequestMapping(value = {"index"})
	public String list(HttpServletRequest  request, @ModelAttribute("form") ProductForm productForm, Model model) {
		
		Locale locale = resolver.resolveLocale(request);
		String language = locale.getLanguage();
		ProductCategory queryBean = new ProductCategory();
		queryBean.setLang(language);
		
		QueryResult<ProductCategory> scrollData = productCategoryService.getScrollData(0, 9, queryBean);
		model.addAttribute("productCategories", scrollData.getResultlist());
		
	    return "support/support_team";  
	}
	
}
