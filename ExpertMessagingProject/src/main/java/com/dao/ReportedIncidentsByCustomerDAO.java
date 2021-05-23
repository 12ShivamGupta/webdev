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
import com.dto.Question;
import com.dto.ReportedIncidentsByCustomer;

public class ReportedIncidentsByCustomerDAO {

	private HibernateTemplate htemplate;
	
	private SessionFactory sfact;

	public ReportedIncidentsByCustomerDAO() {
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
	
	public boolean addIncidentByCustomer(ReportedIncidentsByCustomer obj)
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
	
	public List<ReportedIncidentsByCustomer> getAllReportedIncidentsByCustomer(String custid)
	{
		List<ReportedIncidentsByCustomer> lst = null;
		
		System.out.println(custid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<ReportedIncidentsByCustomer>>() 
			{
				@Override
				public List<ReportedIncidentsByCustomer> doInHibernate(Session session)
						throws HibernateException 
				{
					Query q = session.createQuery("from ReportedIncidentsByCustomer");
									    
				    if(q.list().size()>0)
				    {
				    	System.out.println(q.list().size());
				    	return q.list();
				    }
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
	
	public List<ReportedIncidentsByCustomer> getAllReportedIncidents()
	{
		List<ReportedIncidentsByCustomer> lst = null;
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<ReportedIncidentsByCustomer>>() 
			{
				@Override
				public List<ReportedIncidentsByCustomer> doInHibernate(Session session)
						throws HibernateException 
				{
					Query q = session.createQuery("from ReportedIncidentsByCustomer");
									    
				    if(q.list().size()>0)
				    {
				    	System.out.println(q.list().size());
				    	return q.list();
				    }
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
