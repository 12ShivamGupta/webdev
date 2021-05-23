package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="admin")
public class Admin implements java.io.Serializable 
{
	@Id
	@Column(name="id",length = 40)
	private String id;
	
	@Column(name="password", length = 20)
	private String password;

	public Admin() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
