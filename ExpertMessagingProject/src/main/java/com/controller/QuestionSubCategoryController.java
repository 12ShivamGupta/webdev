package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.AnswerDAO;
import com.dao.QuestionSubCategoryDAO;
import com.dto.Answer;
import com.dto.Expert;
import com.dto.Question;
import com.dto.QuestionCategory;
import com.dto.QuestionSubCategory;

@Controller
public class QuestionSubCategoryController {

	private ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
	
	private QuestionSubCategoryDAO qscd = (QuestionSubCategoryDAO)context.getBean("qsubcatdao");
	
	 @RequestMapping(value = "/questionsubcategory")
	 public String QuestionCategory()
	 {
	    return "questionsubcategory";
	 }
	
	@RequestMapping(value = "/addquestionsubcategory")
	public String addQuestionSubCategory(@RequestParam("catid") String qcatid,
			@RequestParam("subcatname") String subcatname)
	{
		int catid = Integer.parseInt(qcatid);
		QuestionCategory obj = new QuestionCategory();
		obj.setId(catid);
		
		QuestionSubCategory subcatobj = new QuestionSubCategory();
		subcatobj.setSubCategoryName(subcatname);
		subcatobj.setQcat(obj);
		
		if(qscd.addQuestionSubCategory(subcatobj))
			return "AddQuestionSubCat_Success";
		else
			return "AddQuestionSubCat_Failure";
	}

	@RequestMapping(value = "/deletequestionsubcategory")
	public String deleteQuestionSubCategory(@RequestParam("subcatid") String subcatid)
	{
		int id = Integer.parseInt(subcatid);
		
		if(qscd.deleteQuestionSubCategory(id))
		   return "DeleteQuestionSubCat_Success";
		else
		   return "DeleteQuestionSubCat_Failure";
	}
	
	@RequestMapping(value = "/getqsubcatbyqcat")
	public String getQSubCatByQCat(@RequestParam("catid") String catid, HttpServletRequest response)
	{
		int id = Integer.parseInt(catid);
		
		List<QuestionSubCategory> lst = qscd.getQuestionSubCategoriesByQuestionCategory(id);
		
		if(lst != null)
		{
			response.setAttribute("subcatlist", lst);
			return "showAllQuestSubCatwQCat";
		}
		else
			return "showAllQuestSubCatwQCat";
	}

	@RequestMapping(value = "/getsubcategoryjson",method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody HashMap getSubCategoryJson(@RequestParam("catid") String catid)
	{
		int mycatid = Integer.parseInt(catid);
		
		List<QuestionSubCategory> lst = qscd.getQuestionSubCategoriesByQuestionCategory(mycatid);

		if(lst != null)
		{
			List<QuestionSubCategory> sublist = new ArrayList<QuestionSubCategory>();
			
			for(QuestionSubCategory obj : lst)
			{
					QuestionSubCategory ref = new QuestionSubCategory();
					ref.setId(obj.getId());
					ref.setSubCategoryName(obj.getSubCategoryName());
					
					sublist.add(ref);
			}
	      HashMap<String, List<QuestionSubCategory>> hmap = new HashMap<String, List<QuestionSubCategory>>();
	      
	      hmap.put("subcat", sublist);
	      
	      return hmap;
		}
		else
		  return null;	
	}
	
	@RequestMapping(value = "/getsubcategoryjson1",method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody HashMap getSubCategoryJson1(@RequestParam("catid") String catid)
	{
		int mycatid = Integer.parseInt(catid);
		
		List<QuestionSubCategory> lst = qscd.getQuestionSubCategoriesByQuestionCategory(mycatid);

		if(lst != null)
		{
			List<QuestionSubCategory> sublist = new ArrayList<QuestionSubCategory>();
			
			for(QuestionSubCategory obj : lst)
			{
				Expert rf = qscd.getExpertByCatSubCat(mycatid, obj.getId());
				
				if(rf==null) 
				{
					QuestionSubCategory ref = new QuestionSubCategory();
					ref.setId(obj.getId());
					ref.setSubCategoryName(obj.getSubCategoryName());
					
					sublist.add(ref);
			    }
			}
	      HashMap<String, List<QuestionSubCategory>> hmap = new HashMap<String, List<QuestionSubCategory>>();
	      
	      hmap.put("subcat", sublist);
	      
	      return hmap;
		}
		else
		  return null;	
	}
	
	@RequestMapping(value = "/getsubcategoryjson2",method = RequestMethod.GET,produces = "application/json")
	public @ResponseBody HashMap getSubCategoryJson2(@RequestParam("catid") String catid)
	{
		int mycatid = Integer.parseInt(catid);
		
		List<QuestionSubCategory> lst = qscd.getQuestionSubCategoriesByQuestionCategory(mycatid);

		if(lst != null)
		{
			List<QuestionSubCategory> sublist = new ArrayList<QuestionSubCategory>();
			
			for(QuestionSubCategory obj : lst)
			{
				Expert rf = qscd.getExpertByCatSubCat(mycatid, obj.getId());
				System.out.println(rf);
				if(rf!=null) 
				{
					QuestionSubCategory ref = new QuestionSubCategory();
					ref.setId(obj.getId());
					ref.setSubCategoryName(obj.getSubCategoryName());
					
					sublist.add(ref);
			    }
			}
	      HashMap<String, List<QuestionSubCategory>> hmap = new HashMap<String, List<QuestionSubCategory>>();
	      
	      hmap.put("subcat", sublist);
	      
	      return hmap;
		}
		else
		  return null;	
	}
}