package com.petrogirl.petrol.common.service.impl;

import com.petrogirl.petrol.common.entity.NewsCategory;
import com.petrogirl.petrol.common.service.NewsCategoryService;
import com.petrogirl.petrol.common.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class NewsCategoryServiceImpl extends DaoSupport<NewsCategory> implements NewsCategoryService {


}
