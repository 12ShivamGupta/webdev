package com.dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import com.dto.Customer;
import com.dto.Expert;
import com.dto.Question;

public class QuestionDAO {

	private HibernateTemplate htemplate;
	
	private SessionFactory sfact;
	
	public QuestionDAO() {
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
	
	public boolean addQuestion(Question obj)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			s.save(obj);
			tr.commit();
			s.close();
			b=true;
			System.out.println("true");
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return b;
	}
	
	public boolean addReply(int qid , String desc,String userid,String expertid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createSQLQuery("INSERT INTO `customerreply`(`questionID`, `incdesc`, `customerId`, `expertId`) VALUES (?,?,?,?)");
			q.setParameter(0, qid);
			q.setParameter(1, desc);
			q.setParameter(2, userid);
			q.setParameter(3, expertid);
			
			q.executeUpdate();
			
			tr.commit();
			s.close();
			b=true;
			System.out.println("true");
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return b;
	}

	public List<Question> getAllQuestionsByCustomer(String custid)
	{
		List<Question> lst = null;
		
		Customer cust = new Customer();
		cust.setId(custid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Question>>() 
			{
				@Override
				public List<Question> doInHibernate(Session session)
						throws HibernateException 
				{
				    Query q = session.createQuery("FROM Question q where q.cust=:cust");
				    q.setParameter("cust", cust);
				    
				    if(q.list().size()>0)
				    	return q.list();
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

	public List<Question> getAllQuestionsByCustomerandExpert(String custid,String expid)
	{
		List<Question> lst = null;
		
		Customer cust = new Customer();
		cust.setId(custid);
		
		Expert exp = new Expert();
		exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Question>>() 
			{
				@Override
				public List<Question> doInHibernate(Session session)
						throws HibernateException 
				{
				    Query q = session.createQuery("FROM Question q where q.cust=:cust and q.exp=:exp");
				    q.setParameter("cust", cust);
				    q.setParameter("exp", exp);
				    
				    if(q.list().size()>0)
				    	return q.list();
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
	
	public List<Question> getAllQuestionsByExpert(String expid)
	{
		List<Question> lst = null;
		
	    Expert exp = new Expert();
	    exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Question>>() 
			{
				@Override
				public List<Question> doInHibernate(Session session)
						throws HibernateException 
				{
				    Query q = session.createQuery("FROM Question q where q.exp=:exp");
				    q.setParameter("exp", exp);
				    
				    if(q.list().size()>0)
				    	return q.list();
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

	public List<Question> getAllUnansweredQuestionsForExpert(String expid)
	{
		List<Question> lst = null;
		
		Expert exp = new Expert();
		exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Question>>() 
			{
				@Override
				public List<Question> doInHibernate(Session session) 
						throws HibernateException
				{
				   Query q = session.createQuery("FROM Question q where q.exp=:exp AND q.status = false");
				   
				   q.setParameter("exp", exp);
				   
				   if(q.list().size()>0)
					   return q.list();
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

	public boolean changeQuestionStatus(int questid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createQuery("UPDATE Question q SET q.status = true where q.id=:qid");
			
			q.setParameter("qid", questid);
			
			int count = q.executeUpdate();
			
			tr.commit();
			s.close();
			
			if(count>0)
			   b=true;
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return b;
	}
	
	public boolean deleteQuestion(int questid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createQuery("DELETE FROM Question q where q.id=:qid");
			
			q.setParameter("qid", questid);
			
			int count = q.executeUpdate();
			
			tr.commit();
			s.close();
			
			if(count>0)
			   b=true;
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return b;
	}
 
	public List<Question> getAllUnansweredQuestionsForCustomer(String custid)
	{
		List<Question> lst = null;
		
		Customer cust = new Customer();
		cust.setId(custid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Question>>() 
			{
				@Override
				public List<Question> doInHibernate(Session session) 
						throws HibernateException
				{
				   Query q = session.createQuery("FROM Question q where q.cust=:cust AND q.status = false");
				   
				   q.setParameter("cust", cust);
				   
				   if(q.list().size()>0)
					   return q.list();
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

	public List<Question> getQuestionSearchResult(String searchTerm)
	{
		List<Question> lst  = null;
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<Question>>() 
			{
				@Override
				public List<Question> doInHibernate(Session session) 
						throws HibernateException 
				{
				   System.out.println(searchTerm);
					
				   Query q = session.createQuery("FROM Question q where q.visibility = true "
				   		+ "AND (q.questionDesc LIKE '%"+searchTerm+"%' OR q.questionTitle LIKE '%"+searchTerm+"%')");
				   
				   System.out.println(q.list().size());
				   
				   return q.list();
				}
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return lst;
	}

	public Question getQuestionById(int qid)
	{
		Question ref = null;
		
		try
		{
			ref = (Question)htemplate.get(Question.class, qid);
			
			if(ref!=null)
				return ref;
			else
				return null;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Expert getExpertByQuestionID(int questionid)
	{
		Expert exp = null;
		
	 	try
		{
	 	   exp = htemplate.execute(new HibernateCallback<Expert>() 
	 	   {
	 		  @Override
	 		    public Expert doInHibernate(Session session) 
	 		    		throws HibernateException 
	 		  {
	 			 Query q = session.createSQLQuery("select expertID from question where id="+questionid);
					
	 			 List<String> ex = q.list();
	 			 
	 			 Expert ep = new Expert();
	 			 ep.setId(ex.get(0));
	 			 
	 			 return ep;
	 		  }   
		   });	
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return exp;
	}
	
	public Customer getCustomerByQuestionID(int questionid)
	{
		Customer cust = null;
		
	 	try
		{
	 	   cust = htemplate.execute(new HibernateCallback<Customer>() 
	 	   {
	 		  @Override
	 		    public Customer doInHibernate(Session session) 
	 		    		throws HibernateException 
	 		  {
	 			 Query q = session.createSQLQuery("select customerID from question where id="+questionid);
					
	 			 List<String> ct = q.list();
	 			 
	             Customer cs = new Customer();
	 			 cs.setId(ct.get(0));
	 			 
	 			 return cs;
	 		  }   
		   });	
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return cust;
	}
}