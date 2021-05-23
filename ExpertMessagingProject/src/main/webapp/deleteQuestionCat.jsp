<%@page import="java.util.List"%>
<%@page import="com.dao.QuestionCategoryDAO"%>
<%@page import="com.dto.QuestionCategory"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
         <title>Expert Messaging</title>
    </head>
    <body>
          <form action="deletequestioncategory" method="post">
           <div class="form-group">
                  <label>Enter Category ID</label><br>
                  <select style="width: 1100;" id="qsubcat" class="questions-category form-control" name="catid">
                      <option value="0">Select Category</option>
                      <%
                            ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
                      
                            QuestionCategoryDAO qd = (QuestionCategoryDAO)context.getBean("qcatdao"); 
                      
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
            <button class="btn btn-primary btn-lg btn-block">DELETE</button>
        </form>
    </body>
</html>
