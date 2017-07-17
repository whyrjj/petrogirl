package com.petrogirl.petrol.common.service.impl;

import com.petrogirl.petrol.common.service.ArticleService;
import com.petrogirl.petrol.common.entity.Article;
import com.petrogirl.petrol.common.service.base.DaoSupport;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticleServiceImpl extends DaoSupport<Article> implements ArticleService {

}
