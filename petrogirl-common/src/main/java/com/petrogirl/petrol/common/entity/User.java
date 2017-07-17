package com.petrogirl.petrol.common.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.GroupSequence;
import javax.validation.constraints.Size;

import com.petrogirl.petrol.common.entity.validate.First;
import com.petrogirl.petrol.common.entity.validate.Second;
import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name = "users")
@GroupSequence({First.class, Second.class, User.class})
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(length = 20)
	@NotBlank(message = "{valid.required}", groups = First.class)
	@Size(min = 3, max = 30, message = "{valid.size}", groups = Second.class)
	private String username;
	
	@Column(length = 20)
	@NotBlank(message = "{valid.required}", groups = First.class)
	@Size(min = 3, max = 30, message = "{valid.size}", groups = Second.class)
	private String name;
	
	@Column(length = 32)
	@NotBlank(message = "{valid.required}", groups = First.class)
	@Size(min = 3, max = 32, message = "{valid.size}", groups = Second.class)
	private String password;
	
	@Column(length = 32, name = "password_salt")
	private String passwordSalt;
	
	
	@ManyToMany(cascade = {
			CascadeType.REFRESH
		}, fetch = FetchType.LAZY)
    @JoinTable(name = "user_roles", joinColumns = { 
    		@JoinColumn(name ="username" )
    	}, inverseJoinColumns = { 
    			@JoinColumn(name = "role_name") })
	private Set<Role> roles;
	
	@Enumerated(EnumType.STRING)
	@Column(length = 5)
	private Gender gender;
	
	@ManyToOne
	private Department depart;
	
	//是否可用
	private Boolean enable = true;


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPasswordSalt() {
		return passwordSalt;
	}


	public void setPasswordSalt(String passwordSalt) {
		this.passwordSalt = passwordSalt;
	}


	public Set<Role> getRoles() {
		return roles;
	}


	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	
	public Gender getGender() {
		return gender;
	}


	public void setGender(Gender gender) {
		this.gender = gender;
	}


	public Department getDepart() {
		return depart;
	}


	public void setDepart(Department depart) {
		this.depart = depart;
	}


	public Boolean getEnable() {
		return enable;
	}


	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	
	
	
	
	
	
	
	
}
