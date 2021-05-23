package com.dao;

import java.util.List;
import java.util.UUID;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import com.dto.Expert;
import com.dto.QuestionCategory;
import com.dto.QuestionSubCategory;

public class ExpertDAO {

	private HibernateTemplate htemplate;
	
	private SessionFactory sfact;
	
	private String genpass = null;
	
	public ExpertDAO() {
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
	
	public boolean validateExpert(Expert ref)
	{
		boolean b = false;
		
		try
		{
			b = htemplate.execute(new HibernateCallback<Boolean>() 
			{
				@Override
				public Boolean doInHibernate(Session session) 
						throws HibernateException 
				{
				   List<Expert> lst = null;
				   
				   Query q = session.createQuery("FROM Expert e where e.id=:eid AND e.password=:epass");
				   
				   q.setParameter("eid", ref.getId());
				   q.setParameter("epass", ref.getPassword());
				   
				   lst = q.list();
				   
				   if(lst.size()>0)
					   return true;
				   else
					   return false;
				}
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return b;
		}
		return b;
	}

	public boolean changePassword(String expid, String oldpass, String newpass)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			b = htemplate.execute(new HibernateCallback<Boolean>()
			{
				@Override
				public Boolean doInHibernate(Session session) 
						throws HibernateException 
				{
				   Query q = session.createQuery("FROM Expert e WHERE e.id=:eid AND e.password=:epass");
				   
				   q.setParameter("eid", expid);
				   q.setParameter("epass", oldpass);
				   
				   if(q.list().size()>0)
				   {
					   q = s.createQuery("UPDATE Expert e SET e.password=:epass WHERE e.id=:eid");
					   
					   q.setParameter("eid", expid);
					   q.setParameter("epass", newpass);
					   
					   int count = q.executeUpdate();
					   
					   tr.commit();
					   s.close();
					   
					   if(count>0)
						   return true;
					   else
						   return false;
				   }
				   else
					   return false;
				}
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return b;
		}
		return b;
	}

	public String forgotPassword(String userid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			b = htemplate.execute(new HibernateCallback<Boolean>() 
			{
				@Override
				public Boolean doInHibernate(Session session) 
						throws HibernateException 
				{
				    Query q = session.createQuery("FROM Expert e WHERE e.id=:eid");
				    q.setParameter("eid", userid);
				    
				    if(q.list().size()>0)
				    {
				    	genpass = UUID.randomUUID().toString().substring(0,5);
				    	
				    	q = s.createQuery("UPDATE Expert e SET e.password=:epass where e.id=:eid");
				    
				    	q.setParameter("epass",genpass);
				    	q.setParameter("eid", userid);
				    	
				    	int count = q.executeUpdate();
				    	
				    	tr.commit();
				    	s.close();
				    	
				    	if(count>0)
				    		return true;
				    	else
				    		return false;
				    }
				    else
				    	return false;
				}
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		if(b)
			return genpass;
		else
			return null;
	}

	public String saveExpert(Expert e)
	{
		String pass = "";
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
		   String newpass = UUID.randomUUID().toString().substring(0,5);
		   e.setPassword(newpass);
		   s.save(e);
		   
		   tr.commit();
		   s.close();
		   
		   return newpass;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			return "";
		}
	}

	public boolean removeExpert(String expid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createQuery("DELETE From Expert e where e.id=:eid");
			q.setParameter("eid", expid);
			
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
 
	public List<Expert> getAllExperts()
	{
		List<Expert> elist = null;
		
		try
		{
			elist = htemplate.execute(new HibernateCallback<List<Expert>>() 
			{
				@Override
				public List<Expert> doInHibernate(Session session) 
						throws HibernateException 
				{
					Query q = session.createQuery("FROM Expert");
					
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
		return elist;
	}

	public boolean blockExpert(String expid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createQuery("UPDATE Expert e SET e.blocked = true where e.id=:eid");
			
			q.setParameter("eid", expid);
			
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

	public boolean unblockExpert(String expid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createQuery("UPDATE Expert e SET e.blocked = false where e.id=:eid");
			
			q.setParameter("eid", expid);
			
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

	public Expert getExpertByCatSubCat(int catid,int subcatid)
	{
		Expert ref = null;
		
		QuestionCategory qcat = new QuestionCategory();
		qcat.setId(catid);
		
		QuestionSubCategory qsubcat = new QuestionSubCategory();
		qsubcat.setId(subcatid);
		
		try
		{
			ref = htemplate.execute(new HibernateCallback<Expert>() 
			{
				@Override
				public Expert doInHibernate(Session session) 
						throws HibernateException 
				{
				   Query q = session.createQuery("FROM Expert e WHERE e.catid=:qcat AND e.subcatid=:qsubcat");
				   
				   q.setParameter("qcat", qcat);
				   q.setParameter("qsubcat", qsubcat);
				   
				   List<Expert> lst = q.list();
				   
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
		return ref;
	}

	public Expert getExpertById(String expid)
	{
		Expert ref= null;
		
		try
		{
			ref = htemplate.execute(new HibernateCallback<Expert>()
			{
				@Override
				public Expert doInHibernate(Session session) 
						throws HibernateException 
				{
					Query q = session.createQuery("FROM Expert e where e.id=:eid");
					
					q.setParameter("eid", expid);
					
					List<Expert> lst = q.list();
					
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
		return ref;
	}
}
