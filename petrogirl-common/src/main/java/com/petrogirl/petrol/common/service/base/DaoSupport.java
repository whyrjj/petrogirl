package com.petrogirl.petrol.common.service.base;

import com.petrogirl.petrol.common.utils.GenericsUtils;
import com.petrogirl.petrol.common.entity.page.QueryResult;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;



/**
 * @author: whyrjj
 * @Contact: whyrjj@163.com 469241633
 * @date: 2016/9/26
 */
public abstract class DaoSupport<T> implements DAO<T> {
	
	@SuppressWarnings("unchecked")
	protected Class<T> entityClass = GenericsUtils.getSuperClassGenricType(this.getClass());
	
	@PersistenceContext
	protected EntityManager em;

	public void clear() {
		em.clear();
	}

	@Transactional
	public void delete(Serializable... entityids) {
		for (Serializable id : entityids) {
			em.remove(em.getReference(this.entityClass, id));
		}
	}

	public T find(Serializable entityId) {
		if (entityId == null)
			throw new RuntimeException(this.entityClass.getName()
					+ ":传入的实体id不能为空");
	
		T result = em.find(this.entityClass, entityId);
		return result;
	}

	public List<T> findAll(Serializable... entityids) {
		List<T> list = new ArrayList<T>();
		for (Object id : entityids) {
			list.add(em.find(this.entityClass, id));
		}
		return list;
	}

	@Transactional
	public void save(T entity) {
		em.persist(entity);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public void saveAll(T... entities) {
		for (int i = 0; i < entities.length; i++) {
			em.persist(entities[i]);
		}
	}

	public long getCount() {
		return (Long) em.createQuery(
				"select count(" + getCountField(this.entityClass) + ") from "
						+ getEntityName(this.entityClass) + " o")
				.getSingleResult();
	}

	@Transactional
	public void update(T entity) {
		em.merge(entity);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public void updateAll(T... entities) {
		for (int i = 0; i < entities.length; i++) {
			em.merge(entities[i]);
		}
	}

	@Transactional
	public int delete(String wherejpql, Object[] queryParams) {
		if (wherejpql == null || "".equals(wherejpql.trim())) {
			return 0;
		}
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("delete from " + entityname + " o where "
				+ wherejpql);
		setQueryParams(query, queryParams);
		return query.executeUpdate();
	}

	@Transactional
	public int updateSet(String setjpql, String wherejpql, Object[] queryParams) {
		if (setjpql == null || "".equals(setjpql.trim())) {
			return 0;
		}
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("update "
				+ entityname
				+ " o set "
				+ setjpql
				+ (wherejpql == null || "".equals(wherejpql.trim()) ? ""
						: " where " + wherejpql));
		setQueryParams(query, queryParams);
		return query.executeUpdate();
	}

	public QueryResult<T> getScrollData(int firstindex, int maxresult,
										LinkedHashMap<String, String> orderby) {
		return getScrollData(firstindex, maxresult, null, null, orderby);
	}

	public QueryResult<T> getScrollData(int firstindex, int maxresult,
			String wherejpql, Object[] queryParams) {
		return getScrollData(firstindex, maxresult, wherejpql, queryParams,
				null);
	}

	public QueryResult<T> getScrollData(int firstindex, int maxresult) {
		return getScrollData(firstindex, maxresult, null, null, null);
	}

	public QueryResult<T> getScrollData() {
		return getScrollData(-1, -1);
	}

	@SuppressWarnings("unchecked")
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams, LinkedHashMap<String, String> orderby) {
		QueryResult<T> qr = new QueryResult<T>();
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("select o from "
				+ entityname
				+ " o "
				+ (wherejpql == null || "".equals(wherejpql.trim()) ? ""
						: "where " + wherejpql) + buildOrderby(orderby));
		setQueryParams(query, queryParams);
		if (firstindex != -1 && maxresult != -1)
			query.setFirstResult(firstindex).setMaxResults(maxresult);
		qr.setResultlist(query.getResultList());
		query = em.createQuery("select count("
				+ getCountField(this.entityClass)
				+ ") from "
				+ entityname
				+ " o "
				+ (wherejpql == null || "".equals(wherejpql.trim()) ? ""
						: "where " + wherejpql));
		setQueryParams(query, queryParams);
		qr.setTotalrecord((Long) query.getSingleResult());
		return qr;
	}

	@SuppressWarnings("unchecked")
	public <Q extends T> QueryResult<T> getScrollData(int firstindex, int maxresult, Q queryBean, LinkedHashMap<String, String> orderby) {
		JpqlAndParams jpqlAndParams = buildJpqlAndParams(queryBean);
		String wherejpql = jpqlAndParams.getJpql();
		Object[] queryParams = jpqlAndParams.getQueryParams();

		QueryResult<T> qr = new QueryResult<T>();
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("select o from "
				+ entityname
				+ " o "
				+ (wherejpql == null || "".equals(wherejpql.trim()) ? ""
				: "where " + wherejpql) + buildOrderby(orderby));
		setQueryParams(query, queryParams);
		if (firstindex != -1 && maxresult != -1)
			query.setFirstResult(firstindex).setMaxResults(maxresult);
		qr.setResultlist(query.getResultList());
		query = em.createQuery("select count("
				+ getCountField(this.entityClass)
				+ ") from "
				+ entityname
				+ " o "
				+ (wherejpql == null || "".equals(wherejpql.trim()) ? ""
				: "where " + wherejpql));
		setQueryParams(query, queryParams);
		qr.setTotalrecord((Long) query.getSingleResult());
		return qr;
	}

	public <Q extends T> QueryResult<T> getScrollData(int firstindex, int maxresult, Q queryBean) {
		return getScrollData(firstindex, maxresult, queryBean, null);
	}

	static class JpqlAndParams {
		private String jpql;
		private Object[] queryParams;

		public String getJpql() {
			return jpql;
		}

		public void setJpql(String jpql) {
			this.jpql = jpql;
		}

		public Object[] getQueryParams() {
			return queryParams;
		}

		public void setQueryParams(Object[] queryParams) {
			this.queryParams = queryParams;
		}
	}

	private <Q extends T> JpqlAndParams buildJpqlAndParams(Q queryBean) {
		JpqlAndParams jpqlAndParams = new JpqlAndParams();
		Class<?> aClass = queryBean.getClass();
		StringBuilder sb = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		try {
			BeanInfo beanInfo = Introspector.getBeanInfo(aClass);
			PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
			if (propertyDescriptors != null) {
				for (PropertyDescriptor propertyDescriptor: propertyDescriptors) {
					String propertyName = propertyDescriptor.getName();
					if (propertyName.equals("class")) {
						continue;
					}
					Method readMethod = propertyDescriptor.getReadMethod();
					readMethod.setAccessible(true);
					Object invoke = readMethod.invoke(queryBean);
					if (invoke != null) {
						//如果是时间
						if (invoke instanceof Date) {
							if (propertyName.endsWith("QueryStart")) {
								sb.append(" o." + propertyName.substring(0, propertyName.indexOf("QueryStart")) + ">= ? and");
								params.add(invoke);
								continue;
							}

							if (propertyName.endsWith("QueryEnd")) {
								sb.append(" o." + propertyName.substring(0, propertyName.indexOf("QueryEnd")) + "<= ? and");
								params.add(invoke);
								continue;
							}

							sb.append(" o." + propertyName + "= ? and");
							params.add(invoke);
						} else {
							sb.append(" o." + propertyName + "= ? and");
							params.add(invoke);
						}
					}
				}
			}
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		if (sb.length() > 3) {
			jpqlAndParams.setJpql(sb.delete(sb.length()-3, sb.length()).toString());
		}
		jpqlAndParams.setQueryParams(params.toArray());
		return jpqlAndParams;
	}


	public Long getCount(String wherejpql, Object[] queryParams) {
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("select count("
				+ getCountField(this.entityClass)
				+ ") from "
				+ entityname
				+ " o "
				+ (wherejpql == null || "".equals(wherejpql.trim()) ? ""
						: "where " +wherejpql));
		setQueryParams(query, queryParams);
		return (Long) query.getSingleResult();
	}

	protected static void setQueryParams(Query query, Object[] queryParams) {
		if (queryParams != null && queryParams.length > 0) {
			for (int i = 0; i < queryParams.length; i++) {
				query.setParameter(i + 1, queryParams[i]);
			}
		}
	}

	/**
	 * 组装order by语句
	 * 
	 * @param orderby
	 * @return
	 */
	protected static String buildOrderby(LinkedHashMap<String, String> orderby) {
		StringBuffer orderbyql = new StringBuffer("");
		if (orderby != null && orderby.size() > 0) {
			orderbyql.append(" order by ");
			for (String key : orderby.keySet()) {
				orderbyql.append("o.").append(key).append(" ")
						.append(orderby.get(key)).append(",");
			}
			orderbyql.deleteCharAt(orderbyql.length() - 1);
		}
		return orderbyql.toString();
	}

	/**
	 * 获取实体的名称
	 * 
	 * @param <E>
	 * @param clazz
	 *            实体类
	 * @return
	 */
	protected static <E> String getEntityName(Class<E> clazz) {
		String entityname = clazz.getSimpleName();
		Entity entity = clazz.getAnnotation(Entity.class);
		if (entity.name() != null && !"".equals(entity.name())) {
			entityname = entity.name();
		}
		return entityname;
	}

	/**
	 * 获取统计属性,该方法是为了解决hibernate解析联合主键select count(o) from Xxx
	 * o语句BUG而增加,hibernate对此jpql解析后的sql为select
	 * count(field1,field2,...),显示使用count()统计多个字段是错误的
	 * 
	 * @param <E>
	 * @param clazz
	 * @return
	 */
	protected static <E> String getCountField(Class<E> clazz) {
		String out = "o";
		try {
			IdClass idClass = clazz.getAnnotation(IdClass.class);
			if (idClass != null) {
				return clazz.getSimpleName();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			PropertyDescriptor[] propertyDescriptors = Introspector
					.getBeanInfo(clazz).getPropertyDescriptors();
			for (PropertyDescriptor propertydesc : propertyDescriptors) {
				Method method = propertydesc.getReadMethod();
				if ((method != null && method
						.isAnnotationPresent(EmbeddedId.class))
						|| (propertydesc.getPropertyType() != null && propertydesc
								.getPropertyType().isAnnotationPresent(
										Embeddable.class))) {
					PropertyDescriptor[] ps = Introspector.getBeanInfo(
							propertydesc.getPropertyType())
							.getPropertyDescriptors();
					out = "o."
							+ propertydesc.getName()
							+ "."
							+ (!ps[1].getName().equals("class") ? ps[1]
									.getName() : ps[0].getName());
					break;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return out;
	}

	public EntityManager getEm() {
		return em;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<T> getByJpql(String wherejpql, Object[] queryParams){
		Query query = em.createQuery(wherejpql);
		setQueryParams(query, queryParams);
		return query.getResultList();
	}
	
}
