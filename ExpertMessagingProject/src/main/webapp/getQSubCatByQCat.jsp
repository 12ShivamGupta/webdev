<%@page import="com.dto.QuestionCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuestionCategoryDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">  
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
                   <title>Expert Messaging</title>
             </head>
    <body>
                <div class="form-group">
                  <label>Select Category </label>
                  <select id="qcat" class="questions-category form-control" name="catid">
                      <option value="0">Select Category</option>
                      <%
                            ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
                      
                            QuestionCategoryDAO qd =(QuestionCategoryDAO) context.getBean("qcatdao");
                            
                            List<QuestionCategory> lst = qd.getAllQuestionCategories();
                            
                            if(lst != null)
                            {
                                for(QuestionCategory obj : lst)
                                {
                                  %>    
                                      <option value="<%=obj.getId()%>"><%=obj.getCategoryName()%></option>
                                  <%
                                }
                            }
                      %>    
                  </select>
                </div>
            <div class="container">
            <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2><b> Sub Category List</b></h2>
                    </div>
                </div>
            </div>
            <br>
            <input type="search" class="light-table-filter" data-table="table-info" placeholder="Filter/Search">
            <br><br>
            <table id="stable" class="table-info table table-striped table-bordered">

            </table>
            </div>
            </div>
     <script src="<c:url value="/resources/js/function.js"/>"></script>
    </body>
</html>
