package com.petrogirl.petrol.common.service.impl;

import com.petrogirl.petrol.common.entity.ProductCategory;
import com.petrogirl.petrol.common.service.ProductCategoryService;
import com.petrogirl.petrol.common.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ProductCategoryServiceImpl extends DaoSupport<ProductCategory> implements ProductCategoryService {


}
