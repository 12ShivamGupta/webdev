package com.dao;

import java.util.List;
import java.util.UUID;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;

import com.dto.Admin;

public class AdminDAO 
{
    private HibernateTemplate htemplate;
    
    private SessionFactory sfact;
	
	private String genpass = null;
    
	public AdminDAO() {
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

    public boolean validateAdmin(Admin ref)
    {
    	boolean b = false;
    	
    	try
    	{
    		b = htemplate.execute(new HibernateCallback<Boolean>()
    		{
    			@Override
    			public Boolean doInHibernate(org.hibernate.Session session) 
    					throws HibernateException
    			{
    				
    				
    				Query q = session.createQuery("FROM Admin a where a.id=:aid AND a.password=:apass");
    				q.setParameter("aid", ref.getId());
    				q.setParameter("apass", ref.getPassword());
    				
    				List<Admin> lst = null;
    				
    				lst = q.list();
    				
    				if(lst.size()>0)
    				  return true;
    				else		
    				  return false;
    			}
			});
    	}
    	catch (Exception e) 
    	{
		   e.printStackTrace();
		   return b;
		}
    	return b;
    }

    public boolean changePassword(Admin ref, String newpass)
    {
    	boolean b = false;
    	Session s = sfact.openSession();
    	Transaction tr = s.beginTransaction();
    	
    	try
    	{
    		b = htemplate.execute(new HibernateCallback<Boolean>()
    		{
    			 @Override
    			public Boolean doInHibernate(Session session) throws HibernateException 
    			{
    			   Query q = session.createQuery("FROM Admin a Where a.id=:aid AND a.password=:apass");
    			   q.setParameter("aid", ref.getId());
    			   q.setParameter("apass", ref.getPassword());
    			   
    			   if(q.list().size()>0)
    			   {
    				   q = s.createQuery("UPDATE Admin a SET a.password=:apass where a.id=:aid");
    				   q.setParameter("aid", ref.getId());
    				   q.setParameter("apass", newpass);
    				   
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
        			Query q = session.createQuery("FROM Admin a where a.id=:aid");
        			q.setParameter("aid", userid);
        			
        			if(q.list().size()>0)
        			{
        				genpass = UUID.randomUUID().toString().substring(0,5);
        				
        				q = s.createQuery("UPDATE Admin a SET a.password=:apass WHERE a.id=:aid");
        				q.setParameter("apass", genpass);
        				q.setParameter("aid", userid);
        				
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
}
