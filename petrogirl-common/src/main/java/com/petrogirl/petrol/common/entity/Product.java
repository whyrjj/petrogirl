package com.petrogirl.petrol.common.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.GroupSequence;
import javax.validation.constraints.Size;

import com.petrogirl.petrol.common.entity.validate.First;
import com.petrogirl.petrol.common.entity.validate.Second;
import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name = "product")
@GroupSequence({First.class, Second.class, Product.class})
public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(length = 255)
	@NotBlank(message = "{valid.required}", groups = First.class)
	@Size(min = 3, max = 255, message = "{valid.size}", groups = Second.class)
	private String title;
	
	@Column(length = 32, name = "content")
	@Lob
	@NotBlank(message = "{valid.required}", groups = First.class)
	private String content;
	
	@Column(length = 255)
	@NotBlank(message = "{valid.required}", groups = First.class)
	private String imgPath;
	
	@Column(length = 30)
	private String lang;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	@ManyToOne
	private ProductCategory category;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public ProductCategory getCategory() {
		return category;
	}

	public void setCategory(ProductCategory category) {
		this.category = category;
	}
	
}
