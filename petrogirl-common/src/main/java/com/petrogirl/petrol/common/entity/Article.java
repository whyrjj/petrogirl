package com.petrogirl.petrol.common.entity;

import com.petrogirl.petrol.common.entity.validate.First;
import com.petrogirl.petrol.common.entity.validate.Second;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.GroupSequence;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "articles")
@GroupSequence({ First.class, Second.class, Article.class })
public class Article implements Serializable {

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
	private ArticleCategory category;

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

	public ArticleCategory getCategory() {
		return category;
	}

	public void setCategory(ArticleCategory category) {
		this.category = category;
	}

}
