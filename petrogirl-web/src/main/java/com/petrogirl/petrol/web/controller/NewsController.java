package com.petrogirl.petrol.web.controller;

import com.petrogirl.petrol.web.form.NewsCategoryForm;
import com.petrogirl.petrol.web.form.NewsForm;
import com.petrogirl.petrol.common.entity.News;
import com.petrogirl.petrol.common.entity.NewsCategory;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.LangService;
import com.petrogirl.petrol.common.service.NewsCategoryService;
import com.petrogirl.petrol.common.service.NewsService;
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
@RequestMapping("news")
public class NewsController {
	
	private static final Logger LOG = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	LangService langService;
	
	@Autowired
	NewsService newsService;
	
	@Autowired
	NewsCategoryService newsCategoryService;
	
	@Autowired 
	LocaleResolver resolver;

	@RequestMapping(value = {"index"})
	public String list(HttpServletRequest  request, @ModelAttribute("form") NewsForm newsForm, Model model) {
		
		News news = newsForm.getQueryBean();
		Locale locale = resolver.resolveLocale(request);
		String language = locale.getLanguage();
		LOG.debug("请求 " +language+ " 语言的新闻");
		news.setLang(language);
		
		QueryResult<News> scrollData = newsService.getScrollData(newsForm.getPageView().getFirstResult(), newsForm.getPageView().getMaxresult(), news);
		
		newsForm.getPageView().setQueryResult(scrollData);
		
	    return "news/list";  
	}
	
	@RequestMapping(value = {"newList"})
	public String newList(HttpServletRequest  request, @ModelAttribute("form") NewsCategoryForm newsCategoryForm, Model model) {
		
		
		NewsCategory newsCategory = newsCategoryForm.getQueryBean();
		Locale locale = resolver.resolveLocale(request);
		String language = locale.getLanguage();
		LOG.debug("请求 " +language+ " 语言的产品");
		newsCategory.setLang(language);
		
		QueryResult<NewsCategory> scrollData = newsCategoryService.getScrollData(newsCategoryForm.getPageView().getFirstResult(), newsCategoryForm.getPageView().getMaxresult(), newsCategory);
		
		newsCategoryForm.getPageView().setQueryResult(scrollData);
		
	    return "news/news_list";  
	}
	
}
