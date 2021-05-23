<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.beans.factory.annotation.Value"%>
<%@page import="com.dto.Answer"%>
<%@page import="com.dao.AnswerDAO"%>
<%@page import="com.dto.Question"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
 isELIgnored="false"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Expert Messaging</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/resources/css/jquery.dataTables.min.css"/>">
        <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/>" type="image/x-icon" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
		<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
		<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.css"/>">
		<link rel="stylesheet" href="<c:url value="/resources/css/et-line-fonts.css"/>">
		<link href="../../../fonts.googleapis.com/cssd7e8.css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic|Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.carousel.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.style.css"/>">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/styles/shCoreDefault.css" />"/>
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/animate.min.css" />"/>
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap-dropdownhover.min.css" />"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>           
    </head>
    <body>
    
    <div class="preloader"><span class="preloader-gif"></span>
  </div>
  <!-- =-=-=-=-=-=-= HEADER =-=-=-=-=-=-= -->
  <div class="top-bar">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4">
				<ul class="top-nav nav-left">
					<li><a href="index.jsp">Home</a></li>
					</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
					<li class="dropdown"> 
						
					 </li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="navbar navbar-default">
    <div class="container">
      <!-- header -->
      <div class="navbar-header">
        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
    
      </div>
    </div>
  </div>

    
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2> All <b>Answers List</b></h2>
                    </div>
                </div>
            </div>
            <br>
            <input type="search" class="light-table-filter" data-table="table-info" placeholder="Filter/Search">
            <br><br>
            <table style="align-self: center;" id="myTable" class="table-info table table-striped table-bordered">
                <thead>
                    <tr class="active">
                        <th>Question Title</th>
                        <th>Question Description</th>
                        <th>Answer</th>
                    </tr>
                </thead>
                <tbody>
                <%! @Value("{searchterm}")
                           String search;%>
                           
                    <%
                  String srch = (String)request.getAttribute("searchterm");
                    
ApplicationContext context = 
new ClassPathXmlApplicationContext("spring.xml");
                    
                           QuestionDAO dao = (QuestionDAO)
                        		   context.getBean("questdao");
                           
                           AnswerDAO ado = (AnswerDAO)
                        		   context.getBean("ansdao");
                           
                          List<Question> qlist =dao.getQuestionSearchResult(srch);
							
                          if(qlist!= null)
                          {
	                          List<Answer> anslist = ado.getAnswerSearchResult(qlist);
	                           
	                          if(anslist != null)
	                          {
	                            for (Answer a : anslist) {  
	                            Question qs = dao.getQuestionById(a.getQuest().getId());
                    %>
                    <tr>
                        
                        <td><%=qs.getQuestionTitle()%></td>

                        <td><%=qs.getQuestionDesc()%></td>
                        
                        <td><%=a.getAnsDesc()%></td>
                    </tr>
                <%}}}%>

                </tbody>
            </table> 
            <script src="<c:url value="/resources/js/jquery.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
            <script>
          $(document).ready( function(){
        	 $("#myTable").dataTable(); 
          }
         );
        </script>
            
                <footer>
        <div class="footer-copyright">
      <div class="auto-container clearfix">
        <!--Copyright-->
       <div class="copyright text-center">Copyright 2020 &copy; Theme Created By <b>@ExpertMessaging</b> All Rights Reserved</div>
      </div>
    </div>
  </footer>
	<!-- Bootstrap Core Css  -->
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<!-- Jquery Smooth Scroll  -->
	<script src="<c:url value="/resources/js/jquery.smoothscroll.js"/>"></script>
	<!-- Jquery Easing -->
	<script type="text/javascript" src="<c:url value="/resources/js/easing.js"/>"></script>
	<!-- Jquery Counter -->
	<script src="<c:url value="/resources/js/jquery.countTo.js"/>"></script>
	<!-- Jquery Waypoints -->
	<script src="<c:url value="/resources/js/jquery.waypoints.js"/>"></script>
	<!-- Jquery Appear Plugin -->
	<script src="<c:url value="/resources/js/jquery.appear.min.js"/>"></script>
	<!-- Carousel Slider  -->
	<script src="<c:url value="/resources/js/carousel.min.js"/>"></script>
	<!-- Jquery Parallex -->
	<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
	<!--Style Switcher -->
	<script src="<c:url value="/resources/js/bootstrap-dropdownhover.min.js"/>"></script>
	<!-- Include jQuery Syntax Highlighter -->
	<script type="text/javascript" src="<c:url value="/resources/scripts/shCore.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/scripts/shBrushPhp.js"/>"></script>
	<!-- Template Core JS -->
	<script src="<c:url value="/resources/js/custom.js"/>"></script>
            
            
            <script src="<c:url value="/resources/js/function.js"/>"></script>
    </body>
</html>
