<%@page import="com.dto.Question"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.ReportedIncidentsByCustomer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.ReportedIncidentsByCustomerDAO"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2><b>Incident Raised</b></h2><br>
                    </div>
                </div>
            </div>
            <table id="table_m" class="table-info table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Question Title</th>
                        <th>Question Description</th>
                        <th>Description of Incident</th>
                        <th>Posted Date of Incident</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
	                try {
                    	ApplicationContext context = 
        	           			new ClassPathXmlApplicationContext("spring.xml");
        	                    
        	                    QuestionDAO dao = (QuestionDAO)context.getBean("questdao");
        	                    
        	                    ReportedIncidentsByCustomerDAO cdao =  (ReportedIncidentsByCustomerDAO)context.getBean("repcustdao");
        	                    
        	                    String custid = (String)session.getAttribute("userid");
        	                    
        	                    List<ReportedIncidentsByCustomer> lst =  cdao.getAllReportedIncidentsByCustomer((String)session.getAttribute("userid"));
        	                    System.out.println(lst.size());
        	                   
        	                    for(ReportedIncidentsByCustomer rs : lst)
        	                    {
        	                    	System.out.println(rs.getExpertID().getId()+":"+rs.getQuestionID().getQuestionTitle()+":"+rs.getQuestionID().getId()+":"+rs.getQuestionID().getQuestionDesc()+":"+rs.getIncDesc()+":"+rs.getPostedDate());
        	                    	if(rs.getCustomerID().getId().equals(custid))
        	                    	{
        	         %>
                                <tr>
			                        <td><%=rs.getQuestionID().getQuestionTitle()%></td>
			                        <td><%=rs.getQuestionID().getQuestionDesc()%></td>
			                        <td><%=rs.getIncDesc()%></td>
			                        <td><%=rs.getPostedDate()%></td>
			                    </tr>
                    <%
	                                }
        	                    }
	                    } catch (Exception e) {
	
	                    } 
	                %>
                </tbody>
            </table>
        </div>
    </div>
   </body>
</html>


