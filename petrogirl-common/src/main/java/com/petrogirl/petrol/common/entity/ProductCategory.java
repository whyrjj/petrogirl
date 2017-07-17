package com.petrogirl.petrol.common.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.GroupSequence;
import javax.validation.constraints.Size;

import com.petrogirl.petrol.common.entity.validate.First;
import com.petrogirl.petrol.common.entity.validate.Second;
import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name = "product_category")
@GroupSequence({First.class, Second.class, ProductCategory.class})
public class ProductCategory implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(length = 255)
	@NotBlank(message = "{valid.required}", groups = First.class)
	@Size(min = 3, max = 255, message = "{valid.size}", groups = Second.class)
	private String title;
	
	@Column(length = 32, name = "summary")
	@Lob
	@NotBlank(message = "{valid.required}", groups = First.class)
	private String summary;
	
	@Column(length = 255)
	@NotBlank(message = "{valid.required}", groups = First.class)
	private String imgPath;
	
	@Column(length = 30)
	private String lang;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;

	@OneToMany(cascade = {CascadeType.REMOVE}, mappedBy = "category")
	private List<Product> products;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
	
}
