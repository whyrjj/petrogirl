package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.admin.form.NewsCategoryForm;
import com.petrogirl.petrol.admin.form.NewsForm;
import com.petrogirl.petrol.common.entity.News;
import com.petrogirl.petrol.common.entity.NewsCategory;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import com.petrogirl.petrol.common.service.LangService;
import com.petrogirl.petrol.common.service.NewsCategoryService;
import com.petrogirl.petrol.common.service.NewsService;
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
@RequestMapping("${adminPath}/news")
public class NewsController {

    @Autowired
    LangService langService;

    @Autowired
    NewsService newsService;

    @Autowired
    NewsCategoryService newsCategoryService;

    @RequestMapping(value = {"/add"}, method = RequestMethod.GET)
    @RequiresPermissions(value = "news:add")
    public String addUI(@ModelAttribute("news") News news, Model model) {


        model.addAttribute("languages", langService.getScrollData().getResultlist());
        NewsCategory category = newsCategoryService.find(news.getCategory().getId());
        model.addAttribute("category", category);


        return "news/add";
    }


    @RequestMapping(value = {"/add"}, method = RequestMethod.POST)
    @RequiresPermissions(value = "news:add")
    public String add(@ModelAttribute("news") News news, Model model) {

        NewsCategory category = newsCategoryService.find(news.getCategory().getId());
        news.setDate(new Date());
        news.setLang(category.getLang());
        newsService.save(news);

        return "redirect:" + Global.getAdminPath() + "/news/list" + Global.getUrlSuffix() + "?queryBean.category.id=" + category.getId();
    }

    @RequestMapping(value = {"del"})
    @RequiresPermissions(value = "news:del")
    public String del(@ModelAttribute("news") News news) {

        News newsdb = newsService.find(news.getId());
        newsService.delete(newsdb.getId());

        return "redirect:" + Global.getAdminPath() + "/news/list" + Global.getUrlSuffix() + "?queryBean.category.id=" + newsdb.getCategory().getId();
    }


    @RequestMapping(value = {"", "/list"})
    @RequiresPermissions(value = "news:list")
    public String list(@ModelAttribute("form") NewsForm newsForm, Model model) {

        QueryResult<News> scrollData = newsService.getScrollData(newsForm.getPageView().getFirstResult(), newsForm.getPageView().getMaxresult(), newsForm.getQueryBean());
        Long categoryId = newsForm.getQueryBean().getCategory().getId();
        NewsCategory category = newsCategoryService.find(categoryId);
        model.addAttribute("category", category);

        newsForm.getPageView().setQueryResult(scrollData);

        return "news/list";
    }


    @RequestMapping(value = {"category/add"}, method = RequestMethod.GET)
    @RequiresPermissions(value = "news:category:add")
    public String categoryAddUI(@ModelAttribute("category") NewsCategory category, Model model) {

        model.addAttribute("languages", langService.getScrollData().getResultlist());

        return "news/categoryAdd";
    }

    @RequestMapping(value = {"category/update"}, method = RequestMethod.GET)
    @RequiresPermissions(value = "news:category:add")
    public String categoryUpdateUI(NewsCategory category, Model model) {

        model.addAttribute("languages", langService.getScrollData().getResultlist());
        NewsCategory newsCategory = newsCategoryService.find(category.getId());
        model.addAttribute("category", newsCategory);

        return "news/categoryAdd";
    }

    @RequestMapping(value = {"category/del"})
    @RequiresPermissions(value = "news:category:del")
    public String delCategory(@ModelAttribute("category") NewsCategory category) {

        String wherejpql = "o.category.id=?";
        newsService.delete(wherejpql, new Object[]{category.getId()});
        newsCategoryService.delete(category.getId());

        return "redirect:" + Global.getAdminPath() + "/news/category/list" + Global.getUrlSuffix();
    }


    @RequestMapping(value = {"category/add"}, method = RequestMethod.POST)
    @RequiresPermissions(value = "news:category:add")
    public String categoryAdd(@ModelAttribute("category") NewsCategory category, Model model) {
        if (category.getId() != null) {
            newsCategoryService.update(category);
        } else {
            category.setDate(new Date());
            newsCategoryService.save(category);
        }
        return "redirect:" + Global.getAdminPath() + "/news/category/list" + Global.getUrlSuffix();
    }


    @RequestMapping(value = {"category/list"})
    @RequiresPermissions(value = "news:category:list")
    public String categoryList(@ModelAttribute("form") NewsCategoryForm newsCategoryForm, Model model) {

        QueryResult<NewsCategory> scrollData = newsCategoryService.getScrollData(newsCategoryForm.getPageView().getFirstResult(), newsCategoryForm.getPageView().getMaxresult());

        newsCategoryForm.getPageView().setQueryResult(scrollData);

        return "news/categoryList";
    }
}
