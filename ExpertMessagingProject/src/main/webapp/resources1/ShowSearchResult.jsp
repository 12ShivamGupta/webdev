<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.beans.factory.annotation.Value"%>
<%@page import="com.dto.Answer"%>
<%@page import="com.dao.AnswerDAO"%>
<%@page import="com.dto.Question"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
 isELIgnored="false"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="<c:url value="/resources/js/jquery.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/jquery.dataTables.min.css"/>">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <title>Expert Messaging</title>
        <script>
          $(document).ready( function(){
        	 $("#myTable").dataTable(); 
          }
         );
        </script>
    </head>
    <body>
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                         <h2> All Answers </b></h2><br>
                    </div>
                </div>
            </div>
           <br>
            <input type="search" class="light-table-filter" data-table="table-info" placeholder="Filter/Search">
            <br><br>
            <table id="myTable" class="table-info table table-striped table-bordered">
                <thead>
                    <tr class="active">
                        <th>Customer ID</th>
                        <th>Expert ID</th>
                        <th>Question Title</th>
                        <th>Question Description</th>
                        <th>Answer</th>
                    </tr>
                </thead>
                <tbody>
                <%! @Value("{searchterm}")
                           String search;%>
                           
                    <%
                  String srch = (String)request.getAttribute("searchterm");
                    
ApplicationContext context = 
new ClassPathXmlApplicationContext("spring.xml");
                    
                           QuestionDAO dao = (QuestionDAO)
                        		   context.getBean("questdao");
                           
                           AnswerDAO ado = (AnswerDAO)
                        		   context.getBean("ansdao");
                           
List<Question> qlist =dao.getQuestionSearchResult(srch);
List<Answer> anslist = ado.getAnswerSearchResult(qlist);
                           
                          if(anslist != null)
                          {
                            for (Answer a : anslist) {  
                            Question qs = dao.getQuestionById(a.getQuest().getId());
                    %>
                    <tr>
                        
                        <td><%=qs.getCust().getId()%></td>
                        
                        <td><%=qs.getExp().getId()%></td>
                        
                        <td><%=qs.getQuestionTitle()%></td>

                        <td><%=qs.getQuestionDesc()%></td>
                        
                        <td><%=a.getAnsDesc()%></td>
                    </tr>
                <%}}%>

                </tbody>
            </table> 
            <script src="<c:url value="/resources/js/function.js"/>"></script>
    </body>
</html>
