package com.dto;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class Customer implements java.io.Serializable 
{
	@Id
	@Column(name="id", length = 40)
	private String id;
	
	@Column(name = "password", length = 20)
	private String password;

	@Column(name = "firstName" , length = 40)
	private String firstName;
	
	@Column(name = "lastName" , length = 40)
	private String lastName;
	
	@Column(name = "mobileNumber" , length = 10)
	private String mobileNumber;
	
	@Column(name = "verified")
	private boolean verified;
	
	@Column(name = "blocked")
	private boolean blocked;

	@OneToMany(mappedBy = "customerID",
			fetch=FetchType.EAGER)
	private Set<ReportedIncidentsByCustomer> custincidents;
	
	@OneToMany(mappedBy = "cust",
			fetch=FetchType.EAGER)
	private Set<Question> questions;
	
	public Customer() {
		super();
	}

	public Set<ReportedIncidentsByCustomer> getCustincidents() {
		return custincidents;
	}


	public void setCustincidents(Set<ReportedIncidentsByCustomer> custincidents) {
		this.custincidents = custincidents;
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public boolean isVerified() {
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
	}

	public boolean isBlocked() {
		return blocked;
	}

	public void setBlocked(boolean blocked) {
		this.blocked = blocked;
	}
}
