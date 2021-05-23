package com.dto;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="questioncategory")
public class QuestionCategory implements java.io.Serializable 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
	@Column(name = "categoryName", length = 40)
	private String categoryName;

	@OneToMany(mappedBy = "qcat",
			fetch=FetchType.EAGER)
	private Set<QuestionSubCategory> qsubcat;
	
	public QuestionCategory() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Set<QuestionSubCategory> getQsubcat() {
		return qsubcat;
	}

	public void setQsubcat(Set<QuestionSubCategory> qsubcat) {
		this.qsubcat = qsubcat;
	}
}
