package com.petrogirl.petrol.common.service.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import com.petrogirl.petrol.common.entity.News;
import com.petrogirl.petrol.common.service.NewsService;
import com.petrogirl.petrol.common.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class NewsServiceImpl extends DaoSupport<News> implements NewsService {

	@Override
	public List<News> getIndexNews(String lang) {
		// TODO Auto-generated method stub
		TypedQuery<News> createNamedQuery = this.getEm().createQuery(" from News o where o.lang=? order by date desc",
				News.class);
		createNamedQuery.setParameter(1, lang);
		createNamedQuery.setMaxResults(2);
		return createNamedQuery.getResultList();
	}

}
