<%@page import="com.dto.Answer"%>
<%@page import="com.dao.AnswerDAO"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="com.dto.Question"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuestionCategoryDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                <h2> Select Question Asked By You</b></h2>
            </div>
        </div>
    </div>
    <div class="form-group">
        <select style="width: 1150px;"  id="qcatrep" class="questions-category form-control" name="questionrep" required="required">
        <option value="0">Select Question Title</option>
        <%
            ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
           
            QuestionDAO qd = (QuestionDAO)context.getBean("questdao");

            List<Question> lst = qd.getAllQuestionsByCustomer((String)session.getAttribute("userid"));
                            
            if(lst != null)
            {
              for(Question obj : lst)
              {
            	  if(obj.isStatus()){
        %>    
                 <option value="<%=obj.getId()%>"><%=obj.getQuestionTitle()%></option>
        <%
                   }
              }
            }
        %>    
        </select>
     </div>
     
    <table id="reptable" class="table-info table table-striped table-bordered">
     
    </table>
  </body>
</html>