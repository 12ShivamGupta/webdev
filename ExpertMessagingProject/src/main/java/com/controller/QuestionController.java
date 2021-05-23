package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.ExpertDAO;
import com.dao.QuestionDAO;
import com.dto.Answer;
import com.dto.Customer;
import com.dto.Expert;
import com.dto.Question;
import com.dto.QuestionCategory;
import com.dto.QuestionSubCategory;

@Controller
public class QuestionController 
{
   private ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
   
   private QuestionDAO qd = (QuestionDAO)context.getBean("questdao");
	
   private ExpertDAO ed = (ExpertDAO)context.getBean("expdao");

   @RequestMapping(value = "/addquestion")
	public String addQuestion(@RequestParam("questionTitle")
String questionTitle, @RequestParam("categoryID") String categoryID
, @RequestParam("subCategoryID") String subCategoryID , 
@RequestParam("questionDesc") String questionDesc , 
@RequestParam("visibility") String visibility, 
HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		
		String custid = (String)hs.getAttribute("userid");
		Customer cust = new Customer();
		cust.setId(custid);
		
		int catid = Integer.parseInt(categoryID);
		int subctid = Integer.parseInt(subCategoryID);
		
		QuestionCategory qcat = new QuestionCategory();
		qcat.setId(catid);
		
		QuestionSubCategory qsubcat = new QuestionSubCategory();
		qsubcat.setId(subctid);
		
		Expert exp = ed.getExpertByCatSubCat(catid, subctid);
		
		Question obj = new Question();
		obj.setQuestionDesc(questionDesc);
		obj.setQuestionTitle(questionTitle);
		obj.setStatus(false);
		
		if(visibility.equals("private"))
			obj.setVisibility(false);
		else
			obj.setVisibility(true);
		
		obj.setCatid(qcat);
		obj.setCust(cust);
		obj.setExp(exp);
		obj.setSubcatid(qsubcat);
		
		if(qd.addQuestion(obj))
		{
			System.out.println("success");
			return "Question_Success";
		}
		else
		{
			System.out.println("Failure");
			return "Question_Failure";
	    }
	}
   
   @RequestMapping(value = "/getallquestionsbycustomer")
	public String getAllQuestionsByCustomer(
			HttpServletRequest request , Model m)
	{
		HttpSession hs = request.getSession();
		String custid = (String)hs.getAttribute("userid");
		
		List<Question> lst = qd.getAllQuestionsByCustomer(custid);
		
		if(lst != null)
		{
			m.addAttribute("ListOfQuestions", lst);
			return "";
		}
		else
			return "";
	}

   @RequestMapping(value = "/getallquestionsbyexpert")
	public String getAllQuestionsByExpert(
			HttpServletRequest request , Model m)
	{
		HttpSession hs = request.getSession();
		String expid = (String)hs.getAttribute("userid");
		
		List<Question> lst = qd.getAllQuestionsByExpert(expid);
		
		if(lst != null)
		{
			m.addAttribute("ListOfQuestions", lst);
			return "";
		}
		else
			return "";
	}

   @RequestMapping(value = "/getallunansquestforexp")
	public String getAllUnansweredQuestionsForExpert(
			HttpServletRequest request , Model m)
	{
		HttpSession hs = request.getSession();
		String expid = (String)hs.getAttribute("userid");
		
		List<Question> lst = 
				qd.getAllUnansweredQuestionsForExpert(expid);
		
		if(lst != null)
		{
			m.addAttribute("ListOfUnAnsweredQuestions", lst);
			return "";
		}
		else
			return "";
	}

    @RequestMapping(value = "/getallunansquestforcust")
	public String getAllUnansweredQuestionsForCustomer(
			HttpServletRequest request , Model m)
	{
		HttpSession hs = request.getSession();
		String custid = (String)hs.getAttribute("userid");
		
		List<Question> lst = 
				qd.getAllUnansweredQuestionsForCustomer(custid);
		
		if(lst != null)
		{
			m.addAttribute("ListOfUnAnsweredQuestions", lst);
			return "";
		}
		else
			return "";
	}

    @RequestMapping(value = "/getquestionsearchresult")
	public String getQuestionSearchResult(
			@RequestParam("searchTerm") String searchTerm, Model m)
	{
		List<Question> lst = qd.getQuestionSearchResult(searchTerm);
		
		if(lst != null)
		{
			m.addAttribute("ListofQuestion",lst);
			return "";
		}
		else
			return "";
	}
    
    @RequestMapping(value = "/post-question")
	public String postQuestion()
	{
		return "post-question";
	}
    
    @RequestMapping(value = "/post-questionexpert")
   	public String postQuestionExpert()
   	{
   		return "post-questionexp";
   	}
}
