<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dto.Question"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Expert Messaging</title>
    </head>
    <body>
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2> Questions By You</h2><br>
                    </div>
                </div>
            </div>
            <br>
            <table id="table_ms" class="table-info table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Question Title</th>
                        <th>Description</th>
                        <th>Posted Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%  try{
                    ApplicationContext context = 
           			new ClassPathXmlApplicationContext("spring.xml");
                    
                            QuestionDAO dao = (QuestionDAO)
                            		context.getBean("questdao");
                            
                            List<Question> lst = 
dao.getAllUnansweredQuestionsForCustomer((String)
                            session.getAttribute("userid"));

                            if(lst != null)
                            {
                            for (Question qs : lst) {
                    %>
                    <tr>

                        <td><%=qs.getQuestionTitle()%></td>

                        <td><%=qs.getQuestionDesc()%></td>
                        <td>
                            <%=qs.getPostedDate()%>
                        </td>
                    </tr>
                <%}
                      }
                      }catch(Exception e){
                    	  
                      }
                
                %>
                </tbody>
            </table>
      <script src="<c:url value="/resources/js/function.js"/>"></script>
    </body>
</html>
