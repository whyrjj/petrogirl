package com.petrogirl.petrol.common.entity;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 部门
 * @author mac
 *
 */
@Entity
@Table(name = "department")
public class Department {

	/**
	 * 部门id
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 部门名字
	 */
	private String name;
	
	
	/**
	 * 所属部门
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	private Department parentDepart;
	
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="parentDepart")
	private Set<Department> departs;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	
	public Set<Department> getDeparts() {
		return departs;
	}


	public void setDeparts(Set<Department> departs) {
		this.departs = departs;
	}


	public Department getParentDepart() {
		return parentDepart;
	}


	public void setParentDepart(Department parentDepart) {
		this.parentDepart = parentDepart;
	}
	
}
