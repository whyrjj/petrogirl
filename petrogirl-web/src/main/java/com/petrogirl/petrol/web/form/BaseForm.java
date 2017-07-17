package com.petrogirl.petrol.web.form;


import com.petrogirl.petrol.common.entity.page.PageView;
import com.petrogirl.petrol.common.utils.GenericsUtils;

public  abstract  class  BaseForm<T> {


	private PageView<T> pageView = new PageView<>();
	
	private T queryBean;
	
	
	@SuppressWarnings("unchecked")
	public BaseForm() {
		Class<T> classGenricType = GenericsUtils.getSuperClassGenricType(this.getClass());
		try {
			queryBean = classGenricType.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	

	public PageView<T> getPageView() {
		return pageView;
	}

	public void setPageView(PageView<T> pageView) {
		this.pageView = pageView;
	}

	public T getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(T queryBean) {
		this.queryBean = queryBean;
	}
	
	

}
