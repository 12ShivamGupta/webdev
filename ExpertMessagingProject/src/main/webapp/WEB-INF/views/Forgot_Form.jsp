
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- AJAX code for forgot password of expert-->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'/>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        
<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

function myFunction1() {
  var x = document.getElementById("myInput1");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

function myFunction2() {
  var x = document.getElementById("myInput2");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

</script>

        
        <script type="text/javascript">
            var request;
            function forgotexpert()
            {
            var v=document.expertlogin.id.value;
            var url="forgotexpert?expertid="+v;

            if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
            }

            try
            {
            //request.onreadystatechange=getInfoExpert;
            request.open("GET",url,true);
            request.send();
            }
            catch(e)
            {
            alert("Unable to connect to server");
            }

            }

            function getInfoExpert(){
            if(request.readyState==4){
            var val=request.responseText;
                if(val.trim() == "success")
                {
                    swal ( 'Message From Server' ,  'New password has been sent on your email-id' ,'warning' );
                }
                else
                {
                    swal ( 'Message From Server' ,  'System Error Occurred' ,'warning' );
                }
            }
            }
            
            
            function forgotcustomer()
            {
            var v=document.customerlogin.id.value;
            var url="forgotcustomer?custid="+v;

            if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
            }

            try
            {
            //request.onreadystatechange=getInfoCustomer;
            request.open("GET",url,true);
            request.send();
            }
            catch(e)
            {
            alert("Unable to connect to server");
            }

            }

            function getInfoCustomer(){
            if(request.readyState==4){
            var val=request.responseText;
                if(val.trim() == "success")
                {
                    swal ( 'Message From Server' ,  'New password has been sent on your email-id' ,'warning' );
                }
                else
                {
                    swal ( 'Message From Server' ,  'System Error Occurred' ,'warning' );
                }
            }
            }
            
            function forgotadmin()
            {
            var v=document.adminlogin.id.value;
            var url="forgotadmin?adminid="+v;

            if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
            }

            try
            {
            //request.onreadystatechange=getInfoAdmin;
            request.open("GET",url,true);
            request.send();
            }
            catch(e)
            {
            alert("Unable to connect to server");
            }

            }

            function getInfoAdmin(){
            if(request.readyState==4){
            var val=request.responseText;
                if(val.trim() == "success")
                {
                    swal ( 'Message From Server' ,  'New password has been sent on your email-id' ,'warning' );
                }
                else
                {
                    swal ( 'Message From Server' ,  'System Error Occurred' ,'warning' );
                }
            }
            }
</script>


        <!-- =-=-=-=-=-=-= Bootstrap CSS Style =-=-=-=-=-=-= -->
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
  
 
  <!-- =-=-=-=-=-=-= Template CSS Style =-=-=-=-=-=-= -->
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
  <!-- =-=-=-=-=-=-= Font Awesome =-=-=-=-=-=-= -->
  <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.css"/>">
  <!-- =-=-=-=-=-=-= Et Line Fonts =-=-=-=-=-=-= -->
  <link rel="stylesheet" href="<c:url value="/resources/css/et-line-fonts.css"/>">
  
       <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="<c:url value="/resources/demos/style.css"/>">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
    </head>
    <body>
        <div class="top-bar">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4">
				<ul class="top-nav nav-left">
					<li><a href="index.jsp">Home</a>
					</li>
					<!--li class="hidden-xs"><a href="blog.jsp">Blog</a>
					</li//-->
					<!--li  class="hidden-xs"><a href="contact.jsp">Contact Us</a>
					</li-->
				</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
					<li><a href="register"><i class="fa fa-user-plus" aria-hidden="true"></i>Signup</a>
					</li>
					<!--li class="dropdown"> 
						<a class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-animations="fadeInUp">
							<img class="img-circle resize" alt="" src="images/authors/13.png">
							<span class="hidden-xs small-padding">
								<span>Abhishek Yadav</span>
							 <i class="fa fa-caret-down"></i>
							</span>
						</a>
						<ul class="dropdown-menu ">
							<!--li><a href="profile.jsp"><i class=" icon-bargraph"></i> Dashboard</a></li//-->
							<!--li><a href="profile-setting.jsp"><i class=" icon-gears"></i> Profile Setting</a></li>
							<li><a href="question-list.jsp"><i class="icon-heart"></i> Questions</a></li>
							<li><a href="#"><i class="icon-lock"></i> Logout</a></li>
						</ul>
					 </li-->
				</ul>
			</div>
		</div>
	</div>
</div>
        <!-- HEADER ENDS HERE -->
        
        <!-- =-=-=-=-=-=-= HEADER Navigation =-=-=-=-=-=-= -->
  <div class="navbar navbar-default">
    <div class="container">
      <!-- header -->
      <div class="navbar-header">
        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <!-- logo -->
        <a href="index.jsp" class="navbar-brand"><img class="img-responsive" alt="" src="resources/images/logo.png">
        </a>
        <!-- header end -->
      </div>
    </div>
  </div>
        <!-- HEADER navigation ends here -->
        
        <div id="tabs">
            <ul>
    <li><a href="#tabs-1">Admin Forgot</a></li>
    <li><a href="#tabs-2">Customer Forgot</a></li>
    <li><a href="#tabs-3">Expert Forgot</a></li>
  </ul>
  <div id="tabs-1">
    <section class="section-padding-80 white" id="login">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">

            <div class="box-panel">

                <div class="form-group">
                    <form action="ForgotAdmin" method="post" name="adminlogin">
                    
                  <label>Email</label>
                  <input type="text" placeholder="Enter your email" name="id" class="form-control" required>
                  
                </div>
                 <div>
                     <button class="btn btn-primary btn-lg btn-block">Forgot</button>
                  </div>
           </form>
                    
            </div>
          </div>
            

          <div class="clearfix"></div>
        </div>
      </div>
      <!-- end container -->
   </section>
  </div>
  <div id="tabs-2">
   <section class="section-padding-80 white" id="login">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">

            <div class="box-panel">

                <div class="form-group">
                    <form action="ForgotCust" method="get" name="customerlogin">
                    
                  <label>Email</label>
                  <input type="text" placeholder="Enter your email" name="id" class="form-control" required="">
                  
                </div>
                 <div>
                     <button class="btn btn-primary btn-lg btn-block">Forgot</button>
                  </div>
              </form>
                    
            </div>
          </div>

          <div class="clearfix"></div>
        </div>
      </div>
      <!-- end container -->
   </section>
  </div>
  <div id="tabs-3">
   <section class="section-padding-80 white" id="loginexpert">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">

            <div class="box-panel">

                <div class="form-group">
                    <form action="ForgotExpert" method="post" name="expertlogin">
                    
                  <label>Email</label>
                  <input type="text" placeholder="Enter your email" name="id" class="form-control" required="">
                  
                </div>
               
                 <div>
                     <button class="btn btn-primary btn-lg btn-block">Forgot</button>
                  </div>
              </form>
                    
            </div>
          </div>

          <div class="clearfix"></div>
        </div>
      </div>
      <!-- end container -->
   </section>
  </div>
</div>
        
    </body>
</html>
