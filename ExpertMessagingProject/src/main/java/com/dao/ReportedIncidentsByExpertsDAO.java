package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;

import com.dto.QuestionCategory;
import com.dto.QuestionSubCategory;
import com.dto.ReportedIncidentsByCustomer;
import com.dto.ReportedIncidentsByExperts;

public class ReportedIncidentsByExpertsDAO {

	private HibernateTemplate htemplate;
	
	private SessionFactory sfact;

	public ReportedIncidentsByExpertsDAO() {
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
	
	public boolean addIncidentByExpert(ReportedIncidentsByExperts obj)
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
	
	public List<ReportedIncidentsByExperts> getAllReportedIncidentsByExpert(String expid)
	{
		List<ReportedIncidentsByExperts> lst = null;
		
		System.out.println(expid);
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<ReportedIncidentsByExperts>>() 
			{
				@Override
				public List<ReportedIncidentsByExperts> doInHibernate(Session session)
						throws HibernateException 
				{
					Query q = session.createQuery("from ReportedIncidentsByExperts");
									    
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
	
	public List<ReportedIncidentsByExperts> getAllReportedIncidents()
	{
		List<ReportedIncidentsByExperts> lst = null;
		
		try
		{
			lst = htemplate.execute(new HibernateCallback<List<ReportedIncidentsByExperts>>() 
			{
				@Override
				public List<ReportedIncidentsByExperts> doInHibernate(Session session)
						throws HibernateException 
				{
					Query q = session.createQuery("from ReportedIncidentsByExperts");
									    
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
