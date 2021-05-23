<%@page import="java.util.ArrayList"%>
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

            	var cid;
            	var qid;
// detect change of dropdown
	$("#qcatrep").change(function(){

// get id of selected team
		 cid=$(this).find(':selected').val();

       
                // set json url
		var json_url="getquestionjson?cid="+cid;

        $("#questionid").empty();
		
                // get json data
		jQuery.getJSON(json_url, function(data){

			// put new dropdown values to players dropdown
			jQuery.each(data, function(key, val){
				console.log(val[0]);
                                
                                for(var i = 0 ; i < val.length ; i++)
                                {    
                                var obj = val[i];
                                console.log(obj.id);
                                console.log(obj.questionTitle);
        $("#questionid").append("<option value='" + obj.id + "'>" + obj.questionTitle + "</option>")
                                }
				});
		});
            });        
         
 // detect change of dropdown
	$("#questionid").change(function(){

// get id of selected team
	    qid=$(this).find(':selected').val();

                // set json url
		var json_url="getanswerjson?qid="+qid;

        var json_ul = "getreplyfromcustomerjson?cid="+cid+"&qid="+qid;        
                
         $("#reptable").empty();
         
         $("#rtbl").empty();
		
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
                
		jQuery.getJSON(json_ul, function(data){

			// put new dropdown values to players dropdown
			jQuery.each(data, function(key, val){
				console.log(val[0]);
				              for(var i = 0 ; i < val.length ; i++)
                                {    
                                var obj = val[i];
                                console.log(obj.incDesc)
                                  $("#rtbl").append(obj.incDesc)
                                }
				});
		});        
     });        
});
 </script>
  
  <style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
 width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
        
  
   
    </head>
  <body>
    <div class="table-title">
        <div class="row">
            <div class="col-sm-6">
                <h2> Select Customer To Reply</b></h2>
            </div>
        </div>
    </div>
    <div class="form-group">
        <select style="width: 1150px;"  id="qcatrep" class="questions-category form-control" name="questionrep" required="required">
        <option value="0">Select Customer to Reply</option>
        <%
            ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
           
            QuestionDAO qd = (QuestionDAO)context.getBean("questdao");
          
            List<Question> lst = qd.getAllQuestionsByExpert((String)session.getAttribute("userid"));
                            
            if(lst != null)
            {
            	 List<String> lsp = new ArrayList<String>();
              for(Question obj : lst)
              { 
            	  if(obj.isStatus()){
            		  boolean b = lsp.contains(obj.getCust().getId());
            		  if(!b){
        %>    
                 <option value="<%=obj.getCust().getId()%>"><%=obj.getCust().getId()%></option>
        <%
                 lsp.add(obj.getCust().getId());
                     }
            	  }
              }
            }
        %>    
        </select>
     </div>
     
     <div class="form-group">
          <label>Select Question   : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
          <select style="width: 970px;" required="required" id="questionid" class="questions-category form-control" name="questionID">
            <option value="0">Select Question</option>
          </select>
     </div>
     
    <table id="reptable" class="table-info table table-striped table-bordered">
     
    </table>
    
    <table id="restable" class="table-info table table-striped table-bordered">
       <thead>
         <tr>
             <th>Customer Reply</th>
             <th>Your Response</th>
             <th>Action</th>
         </tr>
      </thead>
      <tbody>
         <tr>
             <td id="rtbl"></td>   
             <td></td>
             <td><button id="myBtn" onclick="openMyDialog()">Send Response</button></td>
         </tr> 
      </tbody>
    </table>
   
  <center>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close"> &times;</span>
    <table>
        <tr>
            <td> <center><b>Enter Your Response: </b></center></td>
        </tr>
        <tr class="blank_row">
            <td bgcolor="#FFFFFF" >&nbsp;</td>
        </tr>
        <tr>
            <td>
                <textarea id="incDesc" name="incDesc" cols="40" rows="5"></textarea>
            </td>
        </tr>
        <tr class="blank_row">
            <td bgcolor="#FFFFFF" >&nbsp;</td>
        </tr>
        <tr>
            <td><center><button id="btnRaise" class="btn btn-danger" onclick="addResponse()">Send Response</button></center></td>
        </tr>
    </table>
  </div>

</div>
</center>
  
<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that posts complaint
var btnRaise = document.getElementById("btnRaise");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var questionid = 0;

// When the user clicks the button, open the modal 
function openMyDialog()
{
  modal.style.display = "block";
}

function addResponse(){
   
	var incDesc = document.getElementById("incDesc").value;
	   
    var url="AddresponseByExpert.jsp?questionid="+questid+"&incDesc="+incDesc;

    modal.style.display = "none";
    
            if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
            }

            try
            {
            request.onreadystatechange=getResponseResponse;
            request.open("GET",url,true);
            request.send();
            }
            catch(e)
            {
            alert("Unable to connect to server");
            }
}

function getResponseResponse()
{
    if(request.readyState==4){
            var val=request.responseText;
                if(val.trim() == "success")
                {
                    alert("Your response has been submitted");
                    window.location.reload(true);
                }
                else
                {
                    alert("Your response has not been submitted");
                }
            }
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it

window.onclick = function(evt) {
	  if (evt.target == modal) {
		modal.style.display = "none";
	  }
}
</script>
   
   
  </body>
</html>