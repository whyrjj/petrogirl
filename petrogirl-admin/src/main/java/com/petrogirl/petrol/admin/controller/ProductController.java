package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.admin.form.ProductCategoryForm;
import com.petrogirl.petrol.admin.form.ProductForm;
import com.petrogirl.petrol.common.entity.Product;
import com.petrogirl.petrol.common.entity.ProductCategory;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.LangService;
import com.petrogirl.petrol.common.service.ProductCategoryService;
import com.petrogirl.petrol.common.service.ProductService;
import com.petrogirl.petrol.common.utils.Global;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;


@Controller
@RequestMapping("${adminPath}/product")
public class ProductController {
	
	@Autowired
	LangService langService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductCategoryService productCategoryService;
	
	@RequestMapping(value = {"add"}, method = RequestMethod.GET)
	@RequiresPermissions(value = "product:add")
	public String addUI(@ModelAttribute("product") Product product, Model model) {
		
		model.addAttribute("languages", langService.getScrollData().getResultlist());
		ProductCategory category = productCategoryService.find(product.getCategory().getId());
		model.addAttribute("category", category);
	    return "product/add";  
	}
	
	
	@RequestMapping(value = {"add"}, method = RequestMethod.POST)
	@RequiresPermissions(value = "product:add")
	public String add(@ModelAttribute("product") Product product, Model model) {  
		
		ProductCategory category = productCategoryService.find(product.getCategory().getId());
		product.setDate(new Date());
		product.setLang(category.getLang());
		
		return "redirect:" + Global.getAdminPath() + "/product/list" + Global.getUrlSuffix() + "?queryBean.category.id=" + product.getCategory().getId();
	}
	
	@RequestMapping(value = {"del"})
	@RequiresPermissions(value = "product:del")
	public String del(@ModelAttribute("product") Product product) {  
		
		Product productdb = productService.find(product.getId());
		productService.delete(productdb.getId());
		
		return "redirect:" + Global.getAdminPath() + "/product/list" + Global.getUrlSuffix() + "?queryBean.category.id=" + productdb.getCategory().getId();
	}
	
	
	@RequestMapping(value = {"", "list"})
	@RequiresPermissions(value = "product:list")
	public String list(@ModelAttribute("form") ProductForm productForm, Model model) {
		
		QueryResult<Product> scrollData = productService.getScrollData(productForm.getPageView().getFirstResult(), productForm.getPageView().getMaxresult(), productForm.getQueryBean());
		Long categoryId = productForm.getQueryBean().getCategory().getId();
		ProductCategory category = productCategoryService.find(categoryId);
		model.addAttribute("category", category);
		
		productForm.getPageView().setQueryResult(scrollData);
		
	    return "product/list";  
	}
	
	
	@RequestMapping(value = {"category/add"}, method = RequestMethod.GET)
	@RequiresPermissions(value = "product:category:add")
	public String categoryAddUI(@ModelAttribute("category") ProductCategory category, Model model) {  
		
		model.addAttribute("languages", langService.getScrollData().getResultlist());
		
	    return "product/categoryAdd";  
	}
	
	
	@RequestMapping(value = {"category/add"}, method = RequestMethod.POST)
	@RequiresPermissions(value = "product:category:add")
	public String categoryAdd(@ModelAttribute("category") ProductCategory category, Model model) {  
		
		category.setDate(new Date());
		productCategoryService.save(category);
		
		return "redirect:" + Global.getAdminPath() + "/product/category/list" + Global.getUrlSuffix();
	}
	
	@RequestMapping(value = {"category/del"})
	@RequiresPermissions(value = "product:category:del")
	public String delCategory(@ModelAttribute("category") ProductCategory category) {  
		
		String wherejpql = "o.category.id=?";
		productService.delete(wherejpql , new Object[]{category.getId()});
		
		productCategoryService.delete(category.getId());
		
		return "redirect:" + Global.getAdminPath() + "/product/category/list" + Global.getUrlSuffix();
	}
	
	
	@RequestMapping(value = {"category/list"})
	@RequiresPermissions(value = "product:category:list")
	public String categoryList(@ModelAttribute("form") ProductCategoryForm productCategoryForm, Model model) {
		
		QueryResult<ProductCategory> scrollData = productCategoryService.getScrollData(productCategoryForm.getPageView().getFirstResult(), productCategoryForm.getPageView().getMaxresult());
		
		productCategoryForm.getPageView().setQueryResult(scrollData);
		
	    return "product/categoryList";  
	}
}
