package com.petrogirl.petrol.common.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.GroupSequence;
import javax.validation.constraints.Size;

import com.petrogirl.petrol.common.entity.validate.First;
import com.petrogirl.petrol.common.entity.validate.Second;
import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name = "lang")
@GroupSequence({First.class, Second.class, Lang.class})
public class Lang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(length = 30)
	@NotBlank(message = "{valid.required}", groups = First.class)
	@Size(min = 2, max = 30, message = "{valid.size}", groups = Second.class)
	private String id;
	
	@Column(length = 32)
	@NotBlank(message = "{valid.required}", groups = First.class)
	@Size(min = 2, max = 32, message = "{valid.size}", groups = Second.class)
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Lang other = (Lang) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
}
