package com.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customerreply")
public class CustomerReply implements Serializable
{
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="questionID")
	private int questionid;
	
	@Column(name="incdesc")
	private String incDesc;
	
	@Column(name="customerId")
	private String customerID;
	
	@Column(name="expertId")
	private String expertID;

	public CustomerReply() {
	   super();
	}

	public int getId() {
		return id;
	}

    public void setId(int id) {
		this.id = id;
	}



	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	public String getIncDesc() {
		return incDesc;
	}

	public void setIncDesc(String incDesc) {
		this.incDesc = incDesc;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getExpertID() {
		return expertID;
	}

	public void setExpertID(String expertID) {
		this.expertID = expertID;
	}

	@Override
	public String toString() {
		return "CustomerReply [id=" + id + ", questionid=" + questionid + ", incDesc=" + incDesc + ", customerID="
				+ customerID + ", expertID=" + expertID + "]";
	}
}

