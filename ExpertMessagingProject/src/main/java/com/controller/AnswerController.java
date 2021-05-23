package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.AnswerDAO;
import com.dao.QuestionDAO;
import com.dto.Answer;
import com.dto.CustomerReply;
import com.dto.Expert;
import com.dto.Question;
import com.dto.QuestionSubCategory;

@Controller
public class AnswerController {
	
	private ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
	
	private AnswerDAO ad = (AnswerDAO)context.getBean("ansdao");

	private QuestionDAO questd = (QuestionDAO)context.getBean("questdao");
	
	@RequestMapping(value = "/addanswer",method = RequestMethod.POST)
	public String addAnswer(@RequestParam("ans") String ans,
			@RequestParam("questionId") String questionId,
			@RequestParam("expertId") String expertId)
	{
		Question quest = new Question();
		quest.setId(Integer.parseInt(questionId));
		
		Expert exp = new Expert();
		exp.setId(expertId);
		
		Answer obj = new Answer();
		obj.setExp(exp);
		obj.setQuest(quest);
		obj.setAnsDesc(ans);
		
		if(ad.addAnswer(obj))
		{
			if(questd.changeQuestionStatus(Integer.parseInt(questionId)))
				return "Answer_Success";
			else
				return "Answer_Failure";
		}
		else
			return "Answer_Failure";
	}

	@RequestMapping(value = "/getallanswersforcustomer")
	public String getAllAnswersForCustomer(HttpServletRequest request,Model m)
	{
		HttpSession hs = request.getSession();
		
		String custid = (String)hs.getAttribute("userid");
		
		List<Object[]> lst = ad.getAllAnswersForCustomer(custid);
		
		if(lst!=null)
		{
			m.addAttribute("ListOfAnswers",lst);
			return "";
		}
		else
			return "";
	}

	public String getAllAnswersForExpert(HttpServletRequest request,Model m)
	{
		HttpSession hs = request.getSession();
		
		String expid = (String)hs.getAttribute("userid");
		
		List<Answer> lst = ad.getAllAnswersForExpert(expid);
		
		if(lst != null)
		{
			m.addAttribute("ListOfAnswers", lst);
			return "";
		}
		else
			return "";
	}
	
	@RequestMapping(value = "/getanswerjson",method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody HashMap getAnswerJson(@RequestParam("qid") String qid)
	{
		Question quest = new Question();
		quest.setId(Integer.parseInt(qid));
		
		List<Answer> lst = ad.getAnswersByQuestion(quest); 
				
		if(lst != null)
		{
			List<Answer> sublist = new ArrayList<Answer>();
			
			for(Answer obj : lst)
			{
				Question qst = new Question();
				qst.setQuestionTitle(obj.getQuest().getQuestionTitle());
				qst.setQuestionDesc(obj.getQuest().getQuestionDesc());
				
					Answer ref = new Answer();
					ref.setQuest(qst);
					ref.setAnsDesc(obj.getAnsDesc());
					ref.setPostedDate(obj.getPostedDate());
					
					sublist.add(ref);
			}
	      HashMap<String, List<Answer>> hmap = new HashMap<String, List<Answer>>();
	      
	      hmap.put("subcat", sublist);
	      
	      return hmap;
		}
		else
		  return null;	
	}
	
	@RequestMapping(value = "/getquestionjson",method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody HashMap getQuestionJson(@RequestParam("cid") String cid,HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		String expid = (String)hs.getAttribute("userid"); 
		
		System.out.println(expid);
		
		List<Question> lst = questd.getAllQuestionsByCustomerandExpert(cid,expid);
				
		if(lst != null)
		{
			List<Question> sublist = new ArrayList<Question>();
			
			for(Question obj : lst)
			{
			    Question ref = new Question();
				ref.setId(obj.getId());
			    ref.setQuestionTitle(obj.getQuestionTitle());
				
				sublist.add(ref);
		    }
	      HashMap<String, List<Question>> hmap = new HashMap<String, List<Question>>();
	      
	      hmap.put("subcat", sublist);
	      
	      return hmap;
		}
		else
		  return null;	
	}
	
	@RequestMapping(value = "/getreplyfromcustomerjson",method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody HashMap getReplyFromCustomerJson(@RequestParam("cid") String cid,@RequestParam("qid") String qid,HttpServletRequest request)
	{
		List<CustomerReply> lst = ad.getAllReplyFromCustomer(cid, Integer.parseInt(qid));
	
		if(lst != null)
		{
			List<CustomerReply> sublist = new ArrayList<CustomerReply>();
			
			for(CustomerReply obj : lst)
			{
				CustomerReply ref = new CustomerReply();
				ref.setIncDesc(obj.getIncDesc());
				
			    sublist.add(ref);
		    }
	      HashMap<String, List<CustomerReply>> hmap = new HashMap<String, List<CustomerReply>>();
	      
	      hmap.put("subcat", sublist);
	      
	      return hmap;
		}
		else
		  return null;	
	}
}