<%@page import="com.dto.QuestionCategory"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dao.QuestionSubCategoryDAO"%>
<%@page import="com.dao.QuestionCategoryDAO"%>
<%@page import="com.dao.ExpertDAO"%>
<%@page import="com.dto.Expert"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Expert Messaging</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">  
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
         <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2><b>Question Category List</b></h2>
                    </div>
                </div>
            </div>
            <br>
            <table id="table_my" class="table-info table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Category Name</th>
                    </tr>
                </thead>
                <tbody>
                    <% try {
                    	
                    	 ApplicationContext context = 
new ClassPathXmlApplicationContext("spring.xml");
                                 
                    	 QuestionCategoryDAO dao = (QuestionCategoryDAO)
												context.getBean("qcatdao");

                            
                         List<QuestionCategory> lst = dao.getAllQuestionCategories();

                            for (QuestionCategory s : lst) {
                      %>
					<tr>

                        <td><%=s.getId()%></td>
                        <td><%= s.getCategoryName() %></td>
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
