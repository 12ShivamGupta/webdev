package com.dto;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="question")
public class Question implements java.io.Serializable 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "questionTitle" , length = 50)
	private String questionTitle;
	
	@Column(name = "questionDesc" , length = 200)
	private String questionDesc;

	@Column(name ="postedDate")
	private Timestamp postedDate;
	
	@Column(name ="status")
	private boolean status;
	
	@Column(name ="visibility")
	private boolean visibility;
	
	@OneToOne
	@JoinColumn(name ="categoryID")
	private QuestionCategory catid;
	
	@OneToOne
	@JoinColumn(name ="subCategoryID")
	private QuestionSubCategory subcatid;
	
	@ManyToOne
	@JoinColumn(name ="customerID")
	private Customer cust;
	
	@OneToOne
	@JoinColumn(name ="expertID")
	private Expert exp;
	
	public Question() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionDesc() {
		return questionDesc;
	}

	public void setQuestionDesc(String questionDesc) {
		this.questionDesc = questionDesc;
	}

	public Timestamp getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Timestamp postedDate) {
		this.postedDate = postedDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isVisibility() {
		return visibility;
	}

	public void setVisibility(boolean visibility) {
		this.visibility = visibility;
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

	public Customer getCust() {
		return cust;
	}

	public void setCust(Customer cust) {
		this.cust = cust;
	}

	public Expert getExp() {
		return exp;
	}

	public void setExp(Expert exp) {
		this.exp = exp;
	}
}
