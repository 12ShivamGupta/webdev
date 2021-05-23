<%@page import="com.dto.Question"%>
<%@page import="com.dto.ReportedIncidentsByExperts"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dao.ReportedIncidentsByExpertsDAO"%>
<%//@page import="dto.Question"%>
<%//@page import="dao.QuestionDAO"%>
<%//@page import="dto.ReportedIncidentsByExpert"%>
<%//@page import="dao.ReportedIncidentsByExpertDAO"%>
<%//@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            <table id="mp_tbl" class="table-info table table-striped table-bordered">
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
  	                    
                    	 ReportedIncidentsByExpertsDAO edao = (ReportedIncidentsByExpertsDAO)context.getBean("repexpdao");
                    	 
                    	 String expid = (String)session.getAttribute("userid");
                    	 
                    	 List<ReportedIncidentsByExperts> lst =  edao.getAllReportedIncidentsByExpert((String)session.getAttribute("userid"));
 	                     
                         for (ReportedIncidentsByExperts rs : lst) {
                        	if(rs.getExpertID().getId().equals(expid))
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

