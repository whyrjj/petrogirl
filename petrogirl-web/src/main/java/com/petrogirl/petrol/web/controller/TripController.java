package com.petrogirl.petrol.web.controller;

import com.petrogirl.petrol.web.form.ArticleForm;
import com.petrogirl.petrol.common.entity.Article;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.ArticleService;
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
@RequestMapping("/trip")
public class TripController {

	static final Logger LOG = LoggerFactory.getLogger(NewsController.class);

	@Autowired
	LangService langService;

	@Autowired
	ProductCategoryService productCategoryService;

	@Autowired
	LocaleResolver resolver;
	@Autowired
	ArticleService articleService;

	@RequestMapping(value = { "index" })
	public String list(HttpServletRequest request, @ModelAttribute("form") ArticleForm articleForm, Model model) {

		Article article = articleForm.getQueryBean();
		Locale locale = resolver.resolveLocale(request);
		String language = locale.getLanguage();
		LOG.debug("请求 " + language + " 语言的新闻");
		article.setLang(language);

		QueryResult<Article> scrollData = articleService.getScrollData(articleForm.getPageView().getFirstResult(),
				articleForm.getPageView().getMaxresult(), article);

		articleForm.getPageView().setQueryResult(scrollData);

		return "trip/trip_adviser";
	}

}
