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
<title>Expert Messaging</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2> Registered <b>Expert List</b></h2>
                    </div>
                </div>
            </div>
            <br>
            <table id="my_table" class="table-info table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Category</th>
                        <th>Sub-Category</th>
                        <th>Blocked </th>
                        <th>Change</th>
                    </tr>
                </thead>
                <tbody>
                    <% try {
                    	
                    	 ApplicationContext context = 
new ClassPathXmlApplicationContext("spring.xml");
                                 
                    	 ExpertDAO dao = (ExpertDAO)
												context.getBean("expdao");
                            
QuestionCategoryDAO qcdo = (QuestionCategoryDAO)
context.getBean("qcatdao");

QuestionSubCategoryDAO qscdo = (QuestionSubCategoryDAO)
context.getBean("qsubcatdao");
                       
                            List<Expert> lst = dao.getAllExperts();

                            for (Expert s : lst) {

                    %>

                    <tr>
                        <td><%=s.getId()%></td>
                        <td><%=qcdo.getQuestionCategoryNameByID(s.getCatid().getId())%></td>
                        <td><%=qscdo.getQuestionSubCategoryName(s.getSubcatid().getId())%></td>
                        <td><%=s.isBlocked()%></td>
                        <td><%  if (!s.isBlocked()){%>
                            <a href="blockexpert?expertid=<%=s.getId()%>" class="delete"  data-toggle="modal" onsubmit="myclick()"><img title="BLOCK" style="height: 30px; width: 30px;"  src="<c:url value="/resources/images/33.png"/>"></a>
                        <%}  else {%>
                            <a href="unblockexpert?expertid=<%=s.getId()%>" class="delete"  data-toggle="modal" onsubmit="myclick()"><img title="BLOCK" style="height: 30px; width: 30px;"  src="<c:url value="/resources/images/22.png"/>"></a>
                        <%} %>
                        </td>
                    </tr>
                     <%
                        }
                    } catch (Exception e) {

                    }
                %>
               </tbody>
            </table>
             </body>
</html>
