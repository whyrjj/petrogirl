package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.common.entity.Lang;
import com.petrogirl.petrol.common.service.LangService;
import com.petrogirl.petrol.common.utils.Global;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;


@Controller
@RequestMapping("${adminPath}/lang")
public class LangController {
	
	@Autowired
	LangService langService;
	
	@RequestMapping(value = {"/add"}, method = RequestMethod.GET)
	@RequiresPermissions(value = "lang:add")
	public String addUI(@ModelAttribute("longuage") Lang longuage, Model model) {
		
		List<Lang> exists = langService.getScrollData().getResultlist();
		
		Locale[] availableLocales = Locale.getAvailableLocales();
		String[] isoLanguages = Locale.getISOLanguages();
		
		Map<String, String> longuages = new HashMap<String, String>();
		for (String string : isoLanguages) {
			for (Locale locale : availableLocales) {
				if (locale.getLanguage().equals(string)) {
					Lang lang = new Lang();
					lang.setId(string);
					if (exists.contains(lang)) {
						continue;
					}
					longuages.put(string, locale.getDisplayLanguage());
				}
			}
		}
		
		model.addAttribute("longuages", longuages);
	    return "lang/add";  
	}
	
	@RequestMapping(value = {"/add"}, method = RequestMethod.POST)
	@RequiresPermissions(value = "lang:add")
	public String add(@ModelAttribute("longuage") Lang longuage, Model model) {  
		Locale[] availableLocales = Locale.getAvailableLocales();
		
		for (Locale locale : availableLocales) {
			if (locale.getLanguage().equals(longuage.getId())) {
				longuage.setName(locale.getDisplayLanguage());
				System.out.println(locale.getDisplayLanguage());
				break;
			}
		}
		langService.save(longuage);
		
		return "redirect:" + Global.getAdminPath() + "/lang/list" + Global.getUrlSuffix();
	}
	
	
	@RequestMapping(value = {"", "/list"}, method = RequestMethod.GET)
	@RequiresPermissions(value = "lang:list")
	public String list(@ModelAttribute("longuage") Lang longuage, Model model) {  
		
		model.addAttribute("languages", langService.getScrollData().getResultlist());
		
	    return "lang/list";  
	}
	
}
