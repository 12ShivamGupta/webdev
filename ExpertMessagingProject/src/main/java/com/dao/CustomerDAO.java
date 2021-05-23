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

import com.dto.Customer;

public class CustomerDAO {

	private HibernateTemplate htemplate;
	
	private SessionFactory sfact;
	
	private String genpass = null;
	
	public CustomerDAO() {
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
	
	public boolean validateCustomer(Customer ref)
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
					List<Customer> lst = null;
					
					Query q = session.createQuery("FROM Customer c where c.id=:cid AND c.password=:cpass AND c.verified = true AND c.blocked = false");
					
					q.setParameter("cid", ref.getId());
					q.setParameter("cpass", ref.getPassword());
					
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

	public boolean updateCustomer(Customer ref)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createQuery("UPDATE Customer c SET c.password=:cpass , c.firstName=:fname ,"
					+ "c.lastName=:lname , c.mobileNumber=:mobile where c.id=:cid");
			
			q.setParameter("cid", ref.getId());
			q.setParameter("cpass", ref.getPassword());
			q.setParameter("fname", ref.getFirstName());
			q.setParameter("lname", ref.getLastName());
			q.setParameter("mobile", ref.getMobileNumber());
			
			int count = q.executeUpdate();
			
			tr.commit();
			s.close();
			
			if(count>0)
				 b = true;
			
		}
		catch (Exception e) {
		    e.printStackTrace();	
		    return false;
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
				    Query q = session.createQuery("FROM Customer c where c.id=:cid");
				    
				    q.setParameter("cid", userid);
				    
				    if(q.list().size()>0)
				    {
				    	genpass = UUID.randomUUID().toString().substring(0,5);
				    	
				    	q = s.createQuery("UPDATE Customer c SET c.password=:cpass WHERE c.id=:cid");
				    	q.setParameter("cpass", genpass);
				    	q.setParameter("cid", userid);
				    	
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

    public boolean saveCustomer(Customer c)
    {
    	boolean b = false;
    	Session s = sfact.openSession();
    	Transaction tr = s.beginTransaction();
    	
    	try
    	{
    		s.save(c);
    		
    		tr.commit();
    		s.close();
    		
    		b = true;
    	}
    	catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    	return b;
    }

    public boolean removeCustomer(String custid)
    {
    	boolean b = false;
    	Session s = sfact.openSession();
    	Transaction tr = s.beginTransaction();
    	
    	try
    	{
    		Query q = s.createQuery("DELETE from Customer c where c.id=:cid");
    		q.setParameter("cid", custid);
    		
    		int count = q.executeUpdate();
    		
    		tr.commit();
    		s.close();
    		
    		if(count>0)
    			 b = true;
    	}
    	catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    	return b;
    }

    public List<Customer> getAllCustomers()
    {
    	List<Customer> clist = null;
    	
    	try
    	{
    		clist = htemplate.execute(new HibernateCallback<List<Customer>>() 
    		{
    			@Override
    			public List<Customer> doInHibernate(Session session) 
    					throws HibernateException 
    			{
    			    Query q = session.createQuery("FROM Customer");
    			    
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
    	return clist;
    }

    public boolean blockCustomer(String custid)
    {
       boolean b = false;
       Session s = sfact.openSession();
       Transaction tr = s.beginTransaction();
       
       try
       {
    	   Query q = s.createQuery("UPDATE Customer c SET c.blocked = true where c.id = :cid");
    	   
    	   q.setParameter("cid", custid);
    	   
    	   int count = q.executeUpdate();
    	   tr.commit();
    	   s.close();
    	   
    	   if(count>0)
    		   b = true;
       }
       catch (Exception e) {
		  e.printStackTrace();
		  return false;
	   }
       return b;
    }
    
    public boolean chkVerifyCustomer(Customer ref)
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
					List<Customer> lst = null;
					
					Query q = session.createQuery("FROM Customer c where c.id=:cid AND c.password=:cpass AND c.verified = false");
					
					q.setParameter("cid", ref.getId());
					q.setParameter("cpass", ref.getPassword());
					
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
    
    public boolean chkBlockCustomer(Customer ref)
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
					List<Customer> lst = null;
					
					Query q = session.createQuery("FROM Customer c where c.id=:cid AND c.password=:cpass AND c.blocked = true");
					
					q.setParameter("cid", ref.getId());
					q.setParameter("cpass", ref.getPassword());
					
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
    
    public boolean unblockCustomer(String custid)
    {
       boolean b = false;
       Session s = sfact.openSession();
       Transaction tr = s.beginTransaction();
       
       try
       {
    	   Query q = s.createQuery("UPDATE Customer c SET c.blocked = false where c.id = :cid");
    	   
    	   q.setParameter("cid", custid);
    	   
    	   int count = q.executeUpdate();
    	   tr.commit();
    	   s.close();
    	   
    	   if(count>0)
    		   b = true;
       }
       catch (Exception e) {
		  e.printStackTrace();
		  return false;
	   }
       return b;
    }
    
    public boolean verifyCustomer(String custid)
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
    			   Query q = session.createQuery("FROM Customer c WHERE c.id=:cid");
    			   q.setParameter("cid", custid);
    			   
    			   if(q.list().size()>0)
    			   {
    				   q = s.createQuery("UPDATE Customer c SET c.verified = true where c.id=:cid");
 
    				   q.setParameter("cid", custid);
    				   
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
			return false;
		}
    	return b;
    }

    public Customer getCustomerById(String custid)
    {
    	Customer cust = null;
    	
    	try
    	{
    		cust = (Customer)htemplate.get(Customer.class, custid);
    		
    		if(cust!=null)
    			return cust;
    		else
    			return null;
    	}
    	catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }
}
