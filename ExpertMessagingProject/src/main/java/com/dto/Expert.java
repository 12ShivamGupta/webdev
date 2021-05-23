package com.dto;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "expert")
public class Expert implements java.io.Serializable 
{
	@Id
	@Column(name = "id", length = 40)
	private String id;
	
	@Column(name="password" , length = 20)
	private String password;
	
	@Column(name = "blocked")
	private boolean blocked;
	
	@OneToOne
	@JoinColumn(name = "categoryID")
	private QuestionCategory catid;
	
	@OneToOne
	@JoinColumn(name = "subCategoryID")
	private QuestionSubCategory subcatid;

	@OneToMany(mappedBy = "expertID",
			fetch=FetchType.EAGER)
	private Set<ReportedIncidentsByExperts> expincidents;
	
	@OneToMany(mappedBy = "exp" , 
			fetch = FetchType.EAGER)
	private Set<Answer> answers;
	
	public Expert() {
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

	public boolean isBlocked() {
		return blocked;
	}

	public void setBlocked(boolean blocked) {
		this.blocked = blocked;
	}

	public QuestionCategory getCatid() {
		return catid;
	}

	public void setCatid(QuestionCategory catid) {
		this.catid = catid;
	}

	public QuestionSubCategory getSubcatid() {
		return subcatid;
	}

	public void setSubcatid(QuestionSubCategory subcatid) {
		this.subcatid = subcatid;
	}

	public Set<ReportedIncidentsByExperts> getExpincidents() {
		return expincidents;
	}

	public void setExpincidents(Set<ReportedIncidentsByExperts> expincidents) {
		this.expincidents = expincidents;
	}
}
