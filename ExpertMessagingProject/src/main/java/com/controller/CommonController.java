package com.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.MailDAO;

@Controller
public class CommonController {

	@RequestMapping(value = "/login_form")
	public String loginForm()
	{
		return "login_form";
	}
	
	@RequestMapping(value = "/check")
	public String check()
	{
		return "check";
	}
	
	@RequestMapping(value = "/register")
	public String register()
	{
		return "register";
	}
	
	@RequestMapping(value = "/contact")
	public String contact()
	{
		return "contact";
	}
	
	@RequestMapping(value = "/profile_setting")
	public String profileSetting()
	{
		return "profile_setting";
	}
	
	@RequestMapping(value = "/logoutcust")
	public String logoutCust()
	{
		return "logout";
	}
	
	@RequestMapping(value = "/expert-profile-setting")
	public String expertProfileSetting()
	{
		return "profile_setting_expert";
	}
	
	@RequestMapping(value = "/showsearchresult")
	public String search(@RequestParam("search") String searchTerm, Model m)
	{
		m.addAttribute("searchterm",searchTerm);
		return "ShowSearchResult";
	}
	
	@RequestMapping(value = "/showsearchresult1")
	public String search1(@RequestParam("search") String searchTerm, Model m)
	{
		m.addAttribute("searchterm",searchTerm);
		return "ShowSearchResult1";
	}
	
	@RequestMapping(value = "/custhome")
	public String custHome()
	{
		return "index_customer";
	}
	
	@RequestMapping(value = "/adhome")
	public String adHome()
	{
		return "index_admin";
	}
	
	@RequestMapping(value = "/exphome")
	public String expHome()
	{
		return "index_expert";
	}
	
	@PostMapping(value="/sendmymail")
	public String send(@RequestParam("email") String rcvr , 
			@RequestParam("subject") String sub ,
			@RequestParam("message") String cnt ,
			@RequestParam("name") String name)
	{
		ApplicationContext cntxt = 
				new ClassPathXmlApplicationContext("spring.xml");
		
		MailDAO md = (MailDAO) cntxt.getBean("mdao");
		
		if(md.sendMail(rcvr, sub, name+cnt))
			return "mail_success";
		else
			return "mail_error";
	}
}