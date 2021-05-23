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
        
         <script type="text/javascript">
            $(document).ready(function(){

// detect change of dropdown
	$("#qcatrep").change(function(){

// get id of selected team
		var qid=$(this).find(':selected').val();

                // set json url
		var json_url="getanswerjson?qid="+qid;

                $("#reptable").empty();
		
                // get json data
		jQuery.getJSON(json_url, function(data){

			// put new dropdown values to players dropdown
			jQuery.each(data, function(key, val){
				console.log(val[0]);
				  $("#reptable").append("<thead><tr><td><b>Question Title</b></td><td><b>Question Description</b></td><td><b>Answer Description</b></td><td><b>Posted Date</b></td></tr></thead> <tbody>")
                              for(var i = 0 ; i < val.length ; i++)
                                {    
                                var obj = val[i];
                                console.log(obj.quest.questionTitle)
                                console.log(obj.quest.questionDesc)
                                console.log(obj.ansDesc);
                                console.log(obj.postedDate);
                                  $("#reptable").append("<tr><td>"+obj.quest.questionTitle+"</td><td>"+obj.quest.questionDesc+"</td><td>"+obj.ansDesc+"</td><td>"+obj.postedDate+"</td></tr>")
                                }
				                $("#reptable").append("</tbody>")
				});
		});
            });        
});
         
        </script>
  
   
    </head>
  <body>
    <div class="table-title">
        <div class="row">
            <div class="col-sm-6">
                <h2> Select Question Answered By You</b></h2>
            </div>
        </div>
    </div>
    <div class="form-group">
        <select style="width: 1150px;"  id="qcatrep" class="questions-category form-control" name="questionrep" required="required">
        <option value="0">Select Question Title</option>
        <%
            ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
           
            QuestionDAO qd = (QuestionDAO)context.getBean("questdao");

            List<Question> lst = qd.getAllQuestionsByExpert((String)session.getAttribute("userid"));
                            
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