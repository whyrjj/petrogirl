package com.petrogirl.petrol.web.controller;

import com.petrogirl.petrol.web.form.ProductCategoryForm;
import com.petrogirl.petrol.web.form.ProductForm;
import com.petrogirl.petrol.common.entity.Product;
import com.petrogirl.petrol.common.entity.ProductCategory;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.LangService;
import com.petrogirl.petrol.common.service.ProductCategoryService;
import com.petrogirl.petrol.common.service.ProductService;
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
@RequestMapping("/product")
public class ProductController {

private static final Logger LOG = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	LangService langService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductCategoryService productCategoryService;
	
	@Autowired 
	LocaleResolver resolver;

	@RequestMapping(value = {"index"})
	public String list(HttpServletRequest  request, @ModelAttribute("form") ProductForm productForm, Model model) {
		
		Product product = productForm.getQueryBean();
		Locale locale = resolver.resolveLocale(request);
		String language = locale.getLanguage();
		LOG.debug("请求 " +language+ " 语言的产品");
		product.setLang(language);
		
		QueryResult<Product> scrollData = productService.getScrollData(productForm.getPageView().getFirstResult(), productForm.getPageView().getMaxresult(), product);
		
		productForm.getPageView().setQueryResult(scrollData);
		
	    return "product/list";  
	}
	
	
	@RequestMapping(value = {"category"})
	public String category(HttpServletRequest  request, @ModelAttribute("form") ProductCategoryForm productCategoryForm, Model model) {
		
		ProductCategory productCategory = productCategoryForm.getQueryBean();
		Locale locale = resolver.resolveLocale(request);
		String language = locale.getLanguage();
		LOG.debug("请求 " +language+ " 语言的产品");
		productCategory.setLang(language);
		
		QueryResult<ProductCategory> scrollData = productCategoryService.getScrollData(productCategoryForm.getPageView().getFirstResult(), productCategoryForm.getPageView().getMaxresult(), productCategory);
		
		productCategoryForm.getPageView().setQueryResult(scrollData);
		
	    return "product/category";  
	}
	
}
