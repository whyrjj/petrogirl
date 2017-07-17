package com.petrogirl.petrol.common.entity.page;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
public class QueryResult<T> implements Serializable {
	@Expose
	private List<T> resultlist = new ArrayList<T>();
	@Expose
	private long totalrecord;
	@Expose
	private long count;

	public void add(T t) {
		this.resultlist.add(t);
		this.count = resultlist.size();
		this.totalrecord = count;
	}

	public List<T> getResultlist() {
		return resultlist;
	}

	public void setResultlist(List<T> resultlist) {
		this.resultlist = resultlist;
		if (resultlist == null) {
			resultlist = new ArrayList<T>();
		}
		setCount(resultlist.size());
	}

	public long getTotalrecord() {
		return totalrecord;
	}

	public void setTotalrecord(long totalrecord) {
		this.totalrecord = totalrecord;
	}

	/**
	 * @return the count
	 */
	public long getCount() {
		return count;
	}

	/**
	 * @param count
	 *            the count to set
	 */
	public void setCount(long count) {
		this.count = count;
	}
}
