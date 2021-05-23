package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.AdminDAO;
import com.dao.MailDAO;
import com.dto.Admin;

@Controller
public class AdminController {

	private ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
	
	private AdminDAO ad = (AdminDAO)context.getBean("adao");
	
	@RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)
	public String loginAdmin(Admin ref, HttpServletRequest request)
	{
		HttpSession hs = null;
		
		if(ad.validateAdmin(ref))
		{
		   hs = request.getSession(true);
		   hs.setAttribute("userid", ref.getId());
		   return "index_admin";
		}
		else
			return "Login_Failure";
	}
	
	@RequestMapping(value = "/forgotPassword1")
	public String forgotAdmin()
	{
		return "Forgot_Form";
	}
	
	@RequestMapping(value = "/ForgotAdmin")
	public String forgotAdmin(@RequestParam(name = "id") String adminid)
	{
		String genpass = ad.forgotPassword(adminid);
		
		if(genpass==null)
			return "Forgot_Failure";
		else
		{
		  MailDAO md = (MailDAO)context.getBean("mdao");
		  
		  String to = adminid;
		  
		  String subject = "Email From ExpertMessaging";
		  
		  String content = "Your new Password is "+genpass;
		  
		  if(md.sendMail(to,subject,content))
			  return "Forgot_Success";
		  else
			  return "Forgot_Failure";
		}
	}
}
