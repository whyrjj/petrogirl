package com.petrogirl.petrol.web.controller;

import com.petrogirl.petrol.common.entity.News;
import com.petrogirl.petrol.common.entity.NewsCategory;
import com.petrogirl.petrol.common.entity.ProductCategory;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.NewsCategoryService;
import com.petrogirl.petrol.common.service.NewsService;
import com.petrogirl.petrol.common.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Locale;


@Controller
@RequestMapping("/index")
public class IndexController {

	@Autowired
	LocaleResolver resolver;

	@Autowired
	ProductCategoryService productCategoryService;

	@Autowired
	NewsCategoryService newsCategoryService;
	@Autowired
	NewsService newsService;

	@RequestMapping(value = "")
	public String index(HttpServletRequest request, Model model) {

		Locale locale = resolver.resolveLocale(request);
		String language = locale.getLanguage();
		ProductCategory queryBean = new ProductCategory();
		queryBean.setLang(language);

		QueryResult<ProductCategory> scrollData = productCategoryService.getScrollData(0, 9, queryBean);
		model.addAttribute("productCategories", scrollData.getResultlist());

		// =====加载所有的新闻类别
		NewsCategory newsCategory = new NewsCategory();
		newsCategory.setLang(language);
		QueryResult<NewsCategory> newsCategoryQueryResult = newsCategoryService.getScrollData(-1, -1, newsCategory);
		model.addAttribute("newsCategories", newsCategoryQueryResult.getResultlist());
		// 加载两条最新的新闻
		List<News> indexNews = newsService.getIndexNews(language);
		model.addAttribute("news", indexNews);
		return "index/index";
	}
}
