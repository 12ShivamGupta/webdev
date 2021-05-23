<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dto.Answer"%>
<%@page import="com.dao.AnswerDAO"%>
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
                        <h2> Answers For Your Question</b></h2><br>
                    </div>
                </div>
            </div>
            <br>
            <table id="me_table" class="table-info table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Question Title</th>
                        <th>Question Description</th>
                        <th>Answer for you</th>
                        <th>Action</th>
                        <th>Reply</th>
                    </tr>
                </thead>
                <tbody>
                    <% try{
                	ApplicationContext context = 
                	new ClassPathXmlApplicationContext("spring.xml");
                        		
AnswerDAO ado = (AnswerDAO)context.getBean("ansdao");
                        		
List<Object[]> anslist = ado.getAllAnswersForCustomer(
                                    (String)session.getAttribute("userid"));

                            if(anslist != null)
                            {
                            for (Object[] arr : anslist) {
                                QuestionDAO qd = (QuestionDAO)
                                		context.getBean("questdao");
                                Answer ans = (Answer)arr[0];
                             //   int questionid = ans.getQuest().getId();
                             
                               int questionid = ((Question) arr[1]).getId();
                              
                    %>
                    <tr>
                        <td><%=qd.getQuestionById(questionid).getQuestionTitle()%></td>
						<td><%=qd.getQuestionById(questionid).getQuestionDesc()%></td>	
                        <td><%=ans.getAnsDesc()%> <br> <%=ans.getPostedDate()%> </td>
                        <input type="hidden" id="hid_ques_id<%=ans.getId()%>" value="<%=ans.getId()%>"/>
                        <td><button id="myBtn<%=qd.getQuestionById(questionid).getId()%>" onclick="openMyDialog(<%=qd.getQuestionById(questionid).getId()%>)">Raise Complaint</button></td>
                        <td><button id="myBtn<%= qd.getQuestionById(questionid).getId()%>" onclick="openDialog1(<%= qd.getQuestionById(questionid).getId()%>)">Reply</button></td>        
                    </tr>
                <%}
                            }
                  }catch(Exception e){
                  	
                    }
                %>
                 </tbody>
            </table>
             <script src="<c:url value="/resources/js/function.js"/>"></script>
<!-- The Modal -->
<!-- The Modal -->
<center>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close"> &times;</span>
    <table>
        <tr>
            <td> <center><b>Enter Complaint Description : </b></center></td>
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
            <td><center><button id="btnRaise" class="btn btn-danger" onclick="addComplaint()">Post Complaint</button></center></td>
        </tr>
    </table>
  </div>

</div>
</center>

<center>
<div id="myMd" class="modal">
   <div class="modal-content">
    <span  id="myspan" class="close" > &times; </span>
     <table>
        <tr>
           <td><center><b>Enter Reply : </b></center></td>
        </tr>  
        <tr class="blank_row">
            <td bgcolor="#FFFFFF" >&nbsp;</td>
        </tr>
         <tr>
            <td>
                <textarea id="incDesc1" name="incDesc1" cols="40" rows="5"></textarea>
            </td>
        </tr>
        <tr class="blank_row">
            <td bgcolor="#FFFFFF" >&nbsp;</td>
        </tr>
        <tr>
            <td><center><button id="btn" class="btn btn-danger" onclick="addReply()">Send Reply</button></center></td>
        </tr>
     </table>
   </div>
</div>
</center>



<script>
// Get the modal
var modal = document.getElementById('myModal');

var msd = document.getElementById('myMd');

// Get the button that posts complaint
var btnRaise = document.getElementById("btnRaise");

var btn = document.getElementById("btn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var spn = document.getElementById("myspan");

var questionid = 0;

var questid = 0;

// When the user clicks the button, open the modal 
function openMyDialog(id)
{
  modal.style.display = "block";
  questionid = id;
}

function openDialog1(ud)
{
	myMd.style.display = "block";
	questid = ud;
}

function addReply(){
   
	var incDesc1 = document.getElementById("incDesc1").value;
	   
    var url="AddreplyByCustomer.jsp?questionid="+questid+"&incDesc="+incDesc1;

    msd.style.display = "none";
    
            if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
            }

            try
            {
            request.onreadystatechange=getReplyResponse;
            request.open("GET",url,true);
            request.send();
            }
            catch(e)
            {
            alert("Unable to connect to server");
            }
}


function addComplaint(){
    
    var incDesc = document.getElementById("incDesc").value;
    
    var url="AddComplaintByCustomer.jsp?questionid="+questionid+"&incDesc="+incDesc;

    modal.style.display = "none";
    
            if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
            }

            try
            {
            request.onreadystatechange=getComplainResponse;
            request.open("GET",url,true);
            request.send();
            }
            catch(e)
            {
            alert("Unable to connect to server");
            }
}

function getComplainResponse()
{
    if(request.readyState==4){
            var val=request.responseText;
                if(val.trim() == "success")
                {
                    alert("Your complaint has been raised");
                    window.location.reload(true);
                }
                else
                {
                    alert("Your complaint has not been raised");
                }
            }
}

function getReplyResponse()
{
    if(request.readyState==4){
            var val=request.responseText;
                if(val.trim() == "success")
                {
                    alert("Your reply has been submitted");
                    window.location.reload(true);
                }
                else
                {
                    alert("Your reply has not been submitted");
                }
            }
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

spn.onclick = function() {
	  msd.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it

window.onclick = function(evt) {
	  if (evt.target == msd) {
	    msd.style.display = "none";
      }
	  
	  if (evt.target == modal) {
		modal.style.display = "none";
	  }
}
</script>
    </body>
</html>
