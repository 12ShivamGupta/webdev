<%@page import="com.dto.QuestionSubCategory"%>
<%@page import="com.dao.QuestionSubCategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuestionCategoryDAO"%>
<%@page import="com.dto.QuestionCategory"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expert Messaging</title>
    </head>
    <body>
        <div class="form-group">
                  <label>Select Category </label><br>
                  <select style="width: 1150px;" id="qcats" class="questions-category form-control" name="catid">
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
    
        <form action="deletequestionsubcategory" method="post">
           <div class="form-group">
                  <label>Enter Sub Category Name</label><br>
                  <select id="scats" style="width: 1150px;" id="qsubcat" class="questions-category form-control" name="subcatid">
                      <option value="0">Select Sub Category</option>
                      
                  </select>
                </div>
            <button class="btn btn-primary btn-lg btn-block">DELETE</button>
        </form>
    </body>
</html>
