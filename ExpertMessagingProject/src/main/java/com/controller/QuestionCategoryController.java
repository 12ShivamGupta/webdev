package com.controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.QuestionCategoryDAO;
import com.dto.QuestionCategory;

@Controller
public class QuestionCategoryController {

   private ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
	
   private QuestionCategoryDAO qcd = (QuestionCategoryDAO)context.getBean("qcatdao");
   
   @RequestMapping(value = "/questioncategory")
   public String QuestionCategory()
   {
	   return "questioncategory";
   }
   
   @RequestMapping(value = "/addquestioncategory")
   public String addQuestionCategory(@RequestParam("catname") String qcat)
   {
	   if(qcd.addQuestionCategory(qcat))
		   return "AddQuestionCategory_Success";
	   else
		   return "AddQuestionCategory_Failure";
   }

   @RequestMapping(value = "/deletequestioncategory")
   public String deleteQuestionCategory(@RequestParam("catid") int catid)
   {
	   if(qcd.deleteQuestionCategory(catid))
		   return "DeleteQuestionCategory_Success";
	   else
		   return "DeleteQuestionCategory_Failure";
   }
   
   @RequestMapping(value = "/getallquestioncategories")
   public String getAllQuestionCategories(Model m)
   {
	   List<QuestionCategory> lst = qcd.getAllQuestionCategories();
	   
	   if(lst != null)
	   {
		   m.addAttribute("catlist",lst);
		   return "";
	   }
	   else
		   return "";
   }
}
