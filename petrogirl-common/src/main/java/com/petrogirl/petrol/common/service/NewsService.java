package com.petrogirl.petrol.common.service;


import com.petrogirl.petrol.common.entity.News;
import com.petrogirl.petrol.common.service.base.DAO;

import java.util.List;

public interface NewsService extends DAO<News> {
	/**
	 * 返回最新的新闻，默认两条
	 * @param language 
	 * 
	 * @return
	 */
	List<News> getIndexNews(String language);

}
