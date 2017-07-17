package com.petrogirl.petrol.common.service.impl;

import com.petrogirl.petrol.common.entity.Dict;
import com.petrogirl.petrol.common.entity.Lang;
import com.petrogirl.petrol.common.service.DictService;
import com.petrogirl.petrol.common.service.LangService;
import com.petrogirl.petrol.common.service.base.DaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LangServiceImpl extends DaoSupport<Lang> implements LangService {

	@Autowired
	DictService dictService;
	
	@Transactional
	public void save(Lang entity) {
		if (getCount() == 0) {
			Dict dict = new Dict();
			dict.setLabel("默认语言");
			dict.setType("defautLang");
			dict.setValue(entity.getId());
			dictService.save(dict);
		}
		em.persist(entity);
	}
}
