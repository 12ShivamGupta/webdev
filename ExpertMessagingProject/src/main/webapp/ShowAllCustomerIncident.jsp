<%@page import="com.dto.ReportedIncidentsByCustomer"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ReportedIncidentsByCustomerDAO"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="col-sm-8">
                        <h2><b>Incident Raised By Customer To Expert</b></h2><br>
                    </div>
                </div>
            </div>
            <table id="mys_table" class="table-info table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Customer Id</th>
                        <th>Expert ID</th>
                        <th> Question<br> Title</th>
                        <th>Question<br>Description</th>
                        <th>Description<br>of Incident</th>
                        <th>Posted Date<br>of Incident</th>
                        <th>Blocked</th>
                        <th>Change</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    try {
                    	ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
        	                    
        	            QuestionDAO dao = (QuestionDAO)context.getBean("questdao");
        	                    
        	            ReportedIncidentsByCustomerDAO cdao =  (ReportedIncidentsByCustomerDAO)context.getBean("repcustdao");
        	              
                        List<ReportedIncidentsByCustomer> lst = cdao.getAllReportedIncidents();

                        for (ReportedIncidentsByCustomer rs : lst) 
                        {
                    %>

                    <tr>

                        <td><%=rs.getCustomerID().getId()%></td>
                        
                        <td><%=rs.getExpertID().getId()%></td>
                        
                        <td><%=rs.getQuestionID().getQuestionTitle()%></td>
                        
                        <td><%=rs.getQuestionID().getQuestionDesc()%></td>
                        
                        <td><%=rs.getIncDesc()%></td>
                        
                        <td><%=rs.getPostedDate()%></td>
                        
                        <td><%=rs.getExpertID().isBlocked()%></td>
                        
                        <td><%  if (!rs.getExpertID().isBlocked()){%>
                            <a href="blockexpert?expertid=<%=rs.getExpertID().getId()%>" class="delete"  data-toggle="modal"><img title="BLOCK" style="height: 30px; width: 30px;"  src="<c:url value="/resources/images/33.png"/>"></a>
                          <%} else  {%>
                            <a href="unblockexpert?expertid=<%=rs.getExpertID().getId()%>" class="delete"  data-toggle="modal"><img title="BLOCK" style="height: 30px; width: 30px;"  src="<c:url value="/resources/images/22.png"/>"></a>
                        <%}%>                        
                        </td>
                       
                    </tr> 

                <%
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

