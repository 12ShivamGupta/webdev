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
@Table(name = "answer")
public class Answer implements java.io.Serializable 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name="ansDesc" , length = 1000)
	private String ansDesc;
	
	@Column(name = "postedDate")
	private Timestamp postedDate;
	
	@OneToOne
	@JoinColumn(name = "questionID")
	private Question quest;
	
	@ManyToOne
	@JoinColumn(name ="expertID")
	private Expert exp;

	public Answer() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAnsDesc() {
		return ansDesc;
	}

	public void setAnsDesc(String ansDesc) {
		this.ansDesc = ansDesc;
	}

	public Timestamp getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Timestamp postedDate) {
		this.postedDate = postedDate;
	}

	public Question getQuest() {
		return quest;
	}

	public void setQuest(Question quest) {
		this.quest = quest;
	}

	public Expert getExp() {
		return exp;
	}

	public void setExp(Expert exp) {
		this.exp = exp;
	}
}
