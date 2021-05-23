package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "questionsubcategory")
public class QuestionSubCategory implements java.io.Serializable 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "subCategoryName" , length = 60)
	private String subCategoryName;
	
	@ManyToOne
	@JoinColumn(name = "categoryID")
	private QuestionCategory qcat;

	
	public QuestionSubCategory() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

	public QuestionCategory getQcat() {
		return qcat;
	}

	public void setQcat(QuestionCategory qcat) {
		this.qcat = qcat;
	}
}
