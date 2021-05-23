package com.dto;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="reportedincidentsbycustomer")
public class ReportedIncidentsByCustomer implements
java.io.Serializable
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="id")
	private int id;
	
	@Column(name = "incDesc")
	private String incDesc;
	
	@Column(name = "postedDate")
	private Timestamp postedDate;
	
	@OneToOne
	@JoinColumn(name="expertID")
	private Expert expertID;
	
	@ManyToOne
	@JoinColumn(name ="customerID")
	private Customer customerID;
	
	@OneToOne
	@JoinColumn(name="questionID")
	private Question  questionID;

	public ReportedIncidentsByCustomer() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIncDesc() {
		return incDesc;
	}

	public void setIncDesc(String incDesc) {
		this.incDesc = incDesc;
	}

	public Timestamp getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Timestamp postedDate) {
		this.postedDate = postedDate;
	}

	public Expert getExpertID() {
		return expertID;
	}

	public void setExpertID(Expert expertID) {
		this.expertID = expertID;
	}

	public Customer getCustomerID() {
		return customerID;
	}

	public void setCustomerID(Customer customerID) {
		this.customerID = customerID;
	}

	public Question getQuestionID() {
		return questionID;
	}

	public void setQuestionID(Question questionID) {
		this.questionID = questionID;
	}

	@Override
	public String toString() {
		return "ReportedIncidentsByCustomer [id=" + id + ", incDesc=" + incDesc + ", postedDate=" + postedDate
				+ ", expertID=" + expertID + ", customerID=" + customerID + ", questionID=" + questionID + "]";
	}

	
    
}
