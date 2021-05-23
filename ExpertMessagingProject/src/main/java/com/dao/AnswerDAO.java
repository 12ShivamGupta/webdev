package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.Answer;
import com.dto.Customer;
import com.dto.CustomerReply;
import com.dto.Expert;
import com.dto.Question;
import com.dto.QuestionSubCategory;

public class AnswerDAO {

	private HibernateTemplate htemplate;
	
	private SessionFactory sfact;
	
	public AnswerDAO() {
	   super();
	}

	public HibernateTemplate getHtemplate() {
		return htemplate;
	}

	public void setHtemplate(HibernateTemplate htemplate) {
		this.htemplate = htemplate;
	}

	public SessionFactory getSfact() {
		return sfact;
	}

	public void setSfact(SessionFactory sfact) {
		this.sfact = sfact;
	}
	
	public boolean addAnswer(Answer ans)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			s.save(ans);
			
			tr.commit();
			s.close();
			
			b=true;
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return b;
	}

	public List<Object[]> getAllAnswersForCustomer(String custid)
	{
		List<Object[]> lst = null;
		
		Customer cust = new Customer();
		cust.setId(custid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Object[]>>() 
			{
				@Override
				public List<Object[]> doInHibernate(Session session)
						throws HibernateException 
				{
				    Query q = session.createQuery("FROM Answer A Inner Join A.quest Q "
				    		+ "WHERE Q.cust=:cust AND Q.status = true");
				    
				    q.setParameter("cust", cust);
				    
				    List<Object[]> lst = q.list();
				    
				    if(lst.size()>0)
				    	return lst;
				    else
				    	return null;
				}
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return lst;
	}

	public List<Answer> getAllAnswersForExpert(String expid)
	{
		List<Answer> lst = null;
		
		Expert exp = new Expert();
		exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Answer>>() 
			{
				@Override
				public List<Answer> doInHibernate(Session session)
						throws HibernateException 
				{
				    Query q = session.createQuery("FROM Answer A Inner Join A.quest Q "
				    		+ "WHERE Q.exp=:exp AND Q.status = true");
				    
				    q.setParameter("exp", exp);
				    
				    List<Answer> lst = q.list();
				    
				    if(lst.size()>0)
				    	return lst;
				    else
				    	return null;
				}
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return lst;
	}
	
	public List<Object[]> getAllQuestionsAndAnswersByExpert(String expid)
	{
		List<Object[]> lst = null;
		
		Expert exp = new Expert();
		exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Object[]>>() 
			{
				@Override
				public List<Object[]> doInHibernate(Session session)
						throws HibernateException 
				{
				    Query q = session.createQuery("FROM Answer A Right Outer Join A.quest WHERE A.quest.exp=:exp AND A.quest.status = true");
				    
				    q.setParameter("exp", exp);
				    
				    List<Object[]> lst = q.list();
				    
				    if(lst.size()>0)
				    	return lst;
				    else
				    	return null;
				}
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return lst;
	}

	public List<Answer> getAnswerSearchResult(List<Question> lst)
	{
		List<Answer> anslist = new ArrayList<Answer>();
		
		for(Question q : lst)
		{
			System.out.println(q.getId());
			
			Answer obj = getAnswerByQuestion(q);
			
			System.out.println(obj.getId());
			
			if(obj!=null)
				anslist.add(obj);
		}
		return anslist;
	}

	public Answer getAnswerByQuestion(Question quest)
	{
		Answer ans = null;
		
		try
		{
		  ans = htemplate.execute(new HibernateCallback<Answer>() 
		  {
			   @Override
			public Answer doInHibernate(Session session) 
					throws HibernateException 
			   {
				  Query q = session.createQuery("From Answer a where a.quest=:qst");
				  
				  q.setParameter("qst", quest);
				  
				  List<Answer> lst = q.list();
				  
				  if(lst.size()>0)
					  return lst.get(0);
				  else
					  return null;
			   }
		  });	
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return ans;
	}
	
	public List<Answer> getAnswersByQuestion(Question quest)
	{
		List<Answer> ans = null;
		
		try
		{
		  ans = htemplate.execute(new HibernateCallback<List<Answer>>() 
		  {
			   @Override
			public List<Answer> doInHibernate(Session session) 
					throws HibernateException 
			   {
				  Query q = session.createQuery("From Answer a where a.quest=:qst");
				  
				  q.setParameter("qst", quest);
				  
				  List<Answer> lst = q.list();
				  
				  if(lst.size()>0)
					  return lst;
				  else
					  return null;
			   }
		  });	
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return ans;
	}
	
	public List<CustomerReply> getAllReplyFromCustomer(String custid,int qid)
	{
		List<CustomerReply> lst = null;
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<CustomerReply>>() 
			{
				@Override
				public List<CustomerReply> doInHibernate(Session session)
						throws HibernateException 
				{
	               Query q = session.createQuery("From CustomerReply c WHERE c.questionid=:qid and c.customerID=:cid");
					
	               q.setParameter("qid", qid);
				   q.setParameter("cid", custid); 
	               
				   List<CustomerReply> lst = q.list();
				    
				   System.out.println(lst.size());
				   
				    if(lst.size()>0)
				    	return lst;
				    else
				    	return null;
				}
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return lst;
	}
}
