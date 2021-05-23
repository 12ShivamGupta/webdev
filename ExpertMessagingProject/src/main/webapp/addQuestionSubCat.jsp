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
     <title>Expert Messaging</title>
    </head>
    <body>
 <form action="addquestionsubcategory" method="post">
                 <div class="form-group">
                  <label>Select Category </label><br>
                  <select style="width: 1150px;" id="qcat" class="questions-category form-control" name="catid">
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
        
                <div class="form-group">
                  <label>Enter Sub Category</label>
                  <input type="text" placeholder="Sub Category" name="subcatname" class="form-control">
                </div>
                <button class="btn btn-primary btn-lg btn-block">SAVE</button>
        </form>
</body>
</html>