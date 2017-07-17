package com.petrogirl.petrol.common.service.impl;

import com.petrogirl.petrol.common.entity.Product;
import com.petrogirl.petrol.common.service.ProductService;
import com.petrogirl.petrol.common.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ProductServiceImpl extends DaoSupport<Product> implements ProductService {


}
