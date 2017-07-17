package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.admin.form.ArticleCategoryForm;
import com.petrogirl.petrol.admin.form.ArticleForm;
import com.petrogirl.petrol.common.entity.Article;
import com.petrogirl.petrol.common.entity.ArticleCategory;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.ArticleCategoryService;
import com.petrogirl.petrol.common.service.ArticleService;
import com.petrogirl.petrol.common.service.LangService;
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
@RequestMapping("${adminPath}/article")
public class ArticleController {

	@Autowired
	LangService langService;

	@Autowired
	ArticleCategoryService articleCategoryService;

	@Autowired
	ArticleService articleService;

	@RequestMapping(value = { "/add" }, method = RequestMethod.GET)
	@RequiresPermissions(value = "news:add")
	public String addUI(@ModelAttribute("article") Article article, Model model) {

		model.addAttribute("languages", langService.getScrollData().getResultlist());
		ArticleCategory category = articleCategoryService.find(article.getCategory().getId());
		model.addAttribute("category", category);

		return "article/add";
	}

	@RequestMapping(value = { "/add" }, method = RequestMethod.POST)
	@RequiresPermissions(value = "news:add")
	public String add(@ModelAttribute("article") Article article, Model model) {

		ArticleCategory category = articleCategoryService.find(article.getCategory().getId());
		article.setDate(new Date());
		article.setLang(category.getLang());
		articleService.save(article);

		return "redirect:" + Global.getAdminPath() + "/article/list" + Global.getUrlSuffix() + "?queryBean.category.id="
				+ category.getId();
	}

	@RequestMapping(value = { "del" })
	@RequiresPermissions(value = "news:del")
	public String del(@ModelAttribute("article") Article article) {

		Article articledb = articleService.find(article.getId());
		articleService.delete(articledb.getId());

		return "redirect:" + Global.getAdminPath() + "/article/list" + Global.getUrlSuffix() + "?queryBean.category.id="
				+ articledb.getCategory().getId();
	}

	@RequestMapping(value = { "", "/list" })
	@RequiresPermissions(value = "news:list")
	public String list(@ModelAttribute("form") ArticleForm articleForm, Model model) {

		QueryResult<Article> scrollData = articleService.getScrollData(articleForm.getPageView().getFirstResult(),
				articleForm.getPageView().getMaxresult(), articleForm.getQueryBean());
		Long categoryId = articleForm.getQueryBean().getCategory().getId();
		ArticleCategory category = articleCategoryService.find(categoryId);
		model.addAttribute("category", category);

		articleForm.getPageView().setQueryResult(scrollData);

		return "article/list";
	}

	@RequestMapping(value = { "category/add" }, method = RequestMethod.GET)
	@RequiresPermissions(value = "news:category:add")
	public String categoryAddUI(@ModelAttribute("category") ArticleCategory category, Model model) {

		model.addAttribute("languages", langService.getScrollData().getResultlist());

		return "article/categoryAdd";
	}

	@RequestMapping(value = { "category/del" })
	@RequiresPermissions(value = "news:category:del")
	public String delCategory(@ModelAttribute("category") ArticleCategory category) {

		String wherejpql = "o.category.id=?";
		articleService.delete(wherejpql, new Object[] { category.getId() });
		articleCategoryService.delete(category.getId());

		return "redirect:" + Global.getAdminPath() + "/article/category/list" + Global.getUrlSuffix();
	}

	@RequestMapping(value = { "category/add" }, method = RequestMethod.POST)
	@RequiresPermissions(value = "news:category:add")
	public String categoryAdd(@ModelAttribute("category") ArticleCategory category, Model model) {

		category.setDate(new Date());
		articleCategoryService.save(category);

		return "redirect:" + Global.getAdminPath() + "/article/category/list" + Global.getUrlSuffix();
	}

	@RequestMapping(value = { "category/list" })
	@RequiresPermissions(value = "news:category:list")
	public String categoryList(@ModelAttribute("form") ArticleCategoryForm articleCategoryForm, Model model) {

		QueryResult<ArticleCategory> scrollData = articleCategoryService.getScrollData(
				articleCategoryForm.getPageView().getFirstResult(), articleCategoryForm.getPageView().getMaxresult());

		articleCategoryForm.getPageView().setQueryResult(scrollData);

		return "article/categoryList";
	}
}
