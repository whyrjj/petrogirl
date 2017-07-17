package com.petrogirl.petrol.common.service.base;


import com.petrogirl.petrol.common.entity.page.QueryResult;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;



/**
 * @author: whyrjj
 * @Contact: whyrjj@163.com 469241633
 * @date: 2016/9/26
 */
public interface DAO<T> {
	/**
	 * 获取记录总数
	 * 
	 * @return
	 */
	public long getCount();

	/**
	 * 清除一级缓存的数据
	 */
	public void clear();

	/**
	 * 保存实体
	 * 
	 * @param entity
	 */
	public void save(T entity);

	/**
	 * 保存传入的实体列表
	 * 
	 * @param entities
	 */
	@SuppressWarnings("unchecked")
	public void saveAll(T... entities);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 *            实体id
	 */
	public void update(T entity);

	/**
	 * 更新传入实体列表
	 * 
	 * @param entitys
	 */
	@SuppressWarnings("unchecked")
	public void updateAll(T... entitys);

	/**
	 * update set
	 * 
	 */
	public int updateSet(String setjpql, String wherejpql, Object[] queryParams);

	/**
	 * 删除实体
	 * 
	 * @param entityids
	 *            实体id数组
	 */
	public void delete(Serializable... entityids);

	/**
	 * 获取实体
	 * 
	 * @param <T>
	 *            实体类
	 * @param entityId
	 *            实体id
	 * @return
	 */
	public T find(Serializable entityId);

	public Long getCount(String wherejpql, Object[] queryParams);

	/**
	 * 获取分页数据 ,如果要获取所有数据,firstindex，maxresult这俩参数请都传-1
	 * 
	 * @param <T>
	 * @param firstindex
	 *            开始索引
	 * @param maxresult
	 *            需要获取的记录数
	 * @return
	 */
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams, LinkedHashMap<String, String> orderby);
	public <Q extends T> QueryResult<T> getScrollData(int firstindex, int maxresult, Q queryBean, LinkedHashMap<String, String> orderby);
	public <Q extends T> QueryResult<T> getScrollData(int firstindex, int maxresult, Q queryBean);

	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams);

	public QueryResult<T> getScrollData(int firstindex, int maxresult, LinkedHashMap<String, String> orderby);

	public QueryResult<T> getScrollData(int firstindex, int maxresult);

	public QueryResult<T> getScrollData();

	public int delete(String wherejpql, Object[] queryParams);
	
	public List<T> getByJpql(String wherejpql, Object[] queryParams);
	
}
