<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.dto.QuestionCategory"%>
<%@page import="java.util.List" %>
<%@page import="com.dao.QuestionCategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from templates.scriptsbundle.com/knowledge/demo/post-question.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 07:35:36 GMT -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="ScriptsBundle">
	<title>Expert messaging</title>
	<!-- =-=-=-=-=-=-= Favicons Icon =-=-=-=-=-=-= -->
	<link rel="icon" href="<c:url value="/resources/images/favicon.ico"/>" type="image/x-icon" />
	<!-- =-=-=-=-=-=-= Mobile Specific =-=-=-=-=-=-= -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<!-- =-=-=-=-=-=-= Bootstrap CSS Style =-=-=-=-=-=-= -->
	<!-- <link rel="stylesheet" href="css/bootstrap.css">  -->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
	<!-- =-=-=-=-=-=-= Template CSS Style =-=-=-=-=-=-= -->
	<!-- <link rel="stylesheet" href="css/style.css">  --> 
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
	<!-- =-=-=-=-=-=-= Font Awesome =-=-=-=-=-=-= -->
	<!-- <link rel="stylesheet" href="css/font-awesome.css">  -->
	<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.css"/>">
	<!-- =-=-=-=-=-=-= Et Line Fonts =-=-=-=-=-=-= -->
	<!-- <link rel="stylesheet" href="css/et-line-fonts.css">  -->
	<link rel="stylesheet" href="<c:url value="/resources/css/et-line-fonts.css"/>">
	<!-- =-=-=-=-=-=-= Google Fonts =-=-=-=-=-=-= -->
	<link href="../../../fonts.googleapis.com/cssd7e8.css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic|Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css">
	<!-- =-=-=-=-=-=-= Owl carousel =-=-=-=-=-=-= -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.carousel.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/owl.style.css"/>">
	<!-- =-=-=-=-=-=-= Highliter Css =-=-=-=-=-=-= -->
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/styles/shCoreDefault.css" />"/>
    <!-- =-=-=-=-=-=-= Css Animation =-=-=-=-=-=-= -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/animate.min.css" />"/>
    <!-- =-=-=-=-=-=-= Hover Dropdown =-=-=-=-=-=-= -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap-dropdownhover.min.css" />"/>
 
 
  <!-- =-=-=-=-=-=-= For This Page Only =-=-=-=-=-=-= -->
  <link href="<c:url value="/resources/css/select2.min.css"/>" rel="stylesheet" />
  <link rel="stylesheet" href="<c:url value="/resources/css/jquery.tagsinput.min.css"/>"/>

  <!-- JavaScripts -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
  <script src="resources/resources/js/modernizr.js"></script>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9] -->
  <!-- <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> -->  
    <!-- <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> -->
	<!-- <![endif] -->      
</head>

<body>
  <!-- =-=-=-=-=-=-= PRELOADER =-=-=-=-=-=-= -->
  <div class="preloader"><span class="preloader-gif"></span>
  </div>
  <!-- =-=-=-=-=-=-= HEADER =-=-=-=-=-=-= -->
  <div class="top-bar">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4">
				<ul class="top-nav nav-left">
					<li><a href="custhome">Home</a>
					</li>
					<!--li class="hidden-xs"><a href="blog.jsp">Blog</a//-->
					</li>
					<li  class="hidden-xs"><a href="contact">Contact Us</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right">
					<!--li><a href="login.jsp"><i class="fa fa-lock" aria-hidden="true"></i>Login</a>
					</li>
					<li><a href="register.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i>Signup</a>
					</li-->
					<li class="dropdown"> 
						<a class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-animations="fadeInUp">
							<img class="img-circle resize" alt="" src="<c:url value="/resources/images/authors/13.png"/>">
							<span style="text-transform: lowercase" class="hidden-xs small-padding">
                                                            <%
                                                                    String name=(String)session.getAttribute("userid");
                                                                    out.print(name);
                                                                    
                                                                    %>
							 <i class="fa fa-caret-down"></i>
                                                        </span>
						</a>
						<ul class="dropdown-menu ">
							<!--li><a href="profile.jsp"><i class=" icon-bargraph"></i> Dashboard</a></li//-->
							<li><a href="profile_setting"><i class=" icon-gears"></i> Profile Setting</a></li>
							<!--li><a href="question-list.jsp"><i class="icon-heart"></i> Questions</a></li-->
							<li><a href="logoutcust"><i class="icon-lock"></i> Logout</a></li>
						</ul>
					 </li>
				</ul>
			</div>
		</div>
	</div>
</div>
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
  <!-- HEADER Navigation End -->

  <!-- =-=-=-=-=-=-= Main Area =-=-=-=-=-=-= -->
  <div class="main-content-area">

    <!-- =-=-=-=-=-=-= Post Question  =-=-=-=-=-=-= -->
    <section class="section-padding-80 white" id="post-question">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-8 ">

            <div class="box-panel">

              <h2>Post Your Question</h2>
              <hr>
              <!-- form login -->
              <form class="margin-top-40" action="addquestion">
                <div class="form-group">
                  <label>Question Title</label>
                  <input required="required" type="text" placeholder="Question Title" class="form-control" name="questionTitle" required>
                </div>
                <div class="form-group">
                  <label>Question Category</label>
                  <select  id="qcat" class="questions-category form-control" name="categoryID">
                      <%
ApplicationContext context = 
new ClassPathXmlApplicationContext("spring.xml");
                      
QuestionCategoryDAO qd = (QuestionCategoryDAO)
context.getBean("qcatdao");

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
                  <label>Question Sub Category</label>
                  <select class="questions-category form-control" name="subCategoryID" id="subcat">
                   
                  </select>
                </div>  
                <div class="form-group">
                  <label>Question Description</label>
                  <textarea required="required" cols="12" rows="8" placeholder="Post Your Question Details Here....." id="message" name="questionDesc" class="form-control" required=""></textarea>
                </div>
                <div required="required" class="form-group">
                  <label>PRIVATE</label>
                  <input type="radio" value="private" name="visibility"/>
                  <label>PUBLIC</label>
                  <input type="radio" value="public" name="visibility"/>
                </div>  
                <button class="btn btn-primary pull-right">Publish Your Question</button>
                </form>
              </div>
          </div>
         </div>
        </div>
    </section>
    </div>
    <!-- =-=-=-=-=-=-= Post QuestionEnd =-=-=-=-=-=-= -->

    <!-- =-=-=-=-=-=-= Our Clients =-=-=-=-=-=-= -->
    <!--section class="custom-padding" id="clients">
      <div class="container">

        <!-- Row -->
        <!--div class="row">

          <!-- col-md-2 client-block -->
          <!--div class="col-md-2 col-xs-6 col-sm-4 client-block">

            <!-- client-item client-item-style-2 -->
            <!--div class="client-item client-item-style-2">
              <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_5.png"> </a>
            </div>
            <!-- /client-item client-item-style-2 -->

          <!--/div>
          <!-- /col-md-2 client-block -->

          <!-- col-md-2 client-block -->
          <!--div class="col-md-2 col-xs-6 col-sm-4 client-block">

            <!-- client-item client-item-style-2 -->
            <!--div class="client-item client-item-style-2">
              <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_6.png"> </a>
            </div>
            <!-- /client-item client-item-style-2 -->

          <!--/div>
          <!-- /col-md-2 client-block -->

          <!-- col-md-2 client-block -->
          <!--div class="col-md-2 col-xs-6 col-sm-4 client-block">

            <!-- client-item client-item-style-2 -->
            <!--div class="client-item client-item-style-2">
              <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_7.png"> </a>
            </div>
            <!-- /client-item client-item-style-2 -->

          <!--/div>
          <!-- /col-md-2 client-block -->

          <!-- col-md-2 client-block -->
          <!--div class="col-md-2 col-xs-6 col-sm-4 client-block">

            <!-- client-item client-item-style-2 -->
            <!--div class="client-item client-item-style-2">
              <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_8.png"> </a>
            </div>
            <!-- /client-item client-item-style-2 -->

          <!--/div>
          <!-- /col-md-2 client-block -->

          <!-- col-md-2 client-block -->
          <!--div class="col-md-2 col-xs-6 col-sm-4 client-block">

            <!-- client-item client-item-style-2 -->
            <!--div class="client-item client-item-style-2">
              <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_9.png"> </a>
            </div>
            <!-- /client-item client-item-style-2 -->

          <!--/div>
          <!-- /col-md-2 client-block -->

          <!-- col-md-2 client-block -->
          <!--div class="col-md-2 col-xs-6 col-sm-4 client-block">

            <!-- client-item client-item-style-2 -->
            <!--div class="client-item client-item-style-2">
              <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_10.png"> </a>
            </div>
            <!-- /client-item client-item-style-2 -->

          <!--/div>
          <!-- /col-md-2 client-block -->

        <!--/div>
        <!-- Row End -->

      <!--/div>
      <!-- end container -->
    <!--/section>
    <!-- =-=-=-=-=-=-= Our Clients -end =-=-=-=-=-=-= -->

  <!--/div>
  <!-- =-=-=-=-=-=-= Main Area End =-=-=-=-=-=-= -->

  <!-- =-=-=-=-=-=-= FOOTER =-=-=-=-=-=-= -->
  <!--footer class="footer-area">

    <!--Footer Upper-->
    <!--div class="footer-content">
      <div class="container">
        <div class="row clearfix">
          <div class="col-md-8 col-md-offset-2">
            <div class="footer-content text-center no-padding margin-bottom-40">
              <div class="logo-footer"><img id="logo-footer" class="center-block" src="images/logo-1.png" alt="">
              </div>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus illo vel dolorum soluta consectetur doloribus sit. Delectus non tenetur odit dicta vitae debitis suscipit doloribus. Lorem ipsum dolor sit amet, illo vel.</p>
            </div>
          </div>

          <!--Two 4th column-->
          <!--div class="col-md-6 col-sm-12 col-xs-12">
            <div class="row clearfix">
              <div class="col-lg-7 col-sm-6 col-xs-12 column">
                <div class="footer-widget about-widget">
                  <h2>Our Addres</h2>
                  <ul class="contact-info">
                    <li><span class="icon fa fa-map-marker"></span> 60 Link Road Lhr. Pakistan 54770</li>
                    <li><span class="icon fa fa-phone"></span> (042) 1234567890</li>
                    <li><span class="icon fa fa-map-marker"></span> contant@scriptsbundle.com</li>
                    <li><span class="icon fa fa-fax"></span> (042) 1234 7777</li>
                  </ul>
                  <div class="social-links-two clearfix">
                    <a href="#" class="facebook img-circle">
                      <span class="fa fa-facebook-f"></span>
                    </a>
                    <a href="#" class="twitter img-circle">
                      <span class="fa fa-twitter"></span>
                    </a>
                    <a href="#" class="google-plus img-circle">
                      <span class="fa fa-google-plus"></span>
                    </a>
                    <a href="#" class="linkedin img-circle">
                      <span class="fa fa-pinterest-p"></span>
                    </a>
                    <a href="#" class="linkedin img-circle">
                      <span class="fa fa-linkedin"></span>
                    </a>
                  </div>
                </div>
              </div//-->

              <!--Footer Column-->
              <!--div class="col-lg-5 col-sm-6 col-xs-12 column">
                <h2>Our Service</h2>
                <div class="footer-widget links-widget">
                  <ul>
                    <li><a href="#">Web Development</a>
                    </li>
                    <li><a href="#">Web Designing</a>
                    </li>
                    <li><a href="#">Android Development</a>
                    </li>
                    <li><a href="#">Theme Development</a>
                    </li>
                    <li><a href="#">IOS Development</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--Two 4th column End-->

          <!--Two 4th column-->
          <!--div class="col-md-6 col-sm-12 col-xs-12">
            <div class="row clearfix">
              <!--Footer Column-->
              <!--div class="col-lg-7 col-sm-6 col-xs-12 column">
                <div class="footer-widget news-widget">
                  <h2>Latest News</h2>

                  <!--News Post-->
                  <!--div class="news-post">
                    <div class="icon"></div>
                    <div class="news-content">
                      <figure class="image-thumb"><img src="images/blog/popular-2.jpg" alt="">
                      </figure>
                      <a href="#">If you need a crown or lorem an implant you will pay it gap it</a>
                    </div>
                    <div class="time">July 2, 2014</div>
                  </div>

                  <!--News Post-->
                  <!--div class="news-post">
                    <div class="icon"></div>
                    <div class="news-content">
                      <figure class="image-thumb"><img src="images/blog/popular-1.jpg" alt="">
                      </figure>
                      <a href="#">If you need a crown or lorem an implant you will pay it gap it</a>
                    </div>
                    <div class="time">July 2, 2014</div>
                  </div>
                </div>
              </div>

              <!--Footer Column-->
              <!--div class="col-lg-5 col-sm-6 col-xs-12 column">
                <div class="footer-widget links-widget">
                  <h2>Site Links</h2>
                  <ul>
                    <li><a href="login.jsp">Login</a>
                    </li>
                    <li><a href="register.jsp">Register</a>
                    </li>
                    <li><a href="listing.jsp">Listing</a>
                    </li>
                    <li><a href="blog.jsp">Blog</a>
                    </li>
                    <li><a href="contact.jsp">Contact Us</a>
                    </li>

                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--Two 4th column End-->

        <!--/div>
      </div>
    </div>

    <!--Footer Bottom-->
   <footer>	
		<div class="footer-copyright">
			<div class="auto-container clearfix">
				<div class="copyright text-center">Copyright 2020 &copy; Theme Created By <b>@ExpertMessaging</b> All Rights Reserved</div>
			</div>
		</div>
	</footer>

  <!-- =-=-=-=-=-=-= JQUERY =-=-=-=-=-=-= -->
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
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
 
  <script type="text/javascript">
            $(document).ready(function(){

// detect change of dropdown
	$("#qcat").change(function(){

// get id of selected team
		var catid=$(this).find(':selected').val();

                // set json url
		var json_url="getsubcategoryjson2?catid="+catid;

                $("#subcat").empty();
		
                // get json data
		jQuery.getJSON(json_url, function(data){

			// put new dropdown values to players dropdown
			jQuery.each(data, function(key, val){
				console.log(val[0]);
                                
                                for(var i = 0 ; i < val.length ; i++)
                                {    
                                var obj = val[i];
                                console.log(obj.id);
                                console.log(obj.subCategoryName);
        $("#subcat").append("<option value='" + obj.id + "'>" + obj.subCategoryName + "</option>")
                                }
				});
		});
                
            });        
});
        </script>
 
  <!-- For THis Page Only -->
  <script src="resources/js/select2.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.tagsinput.min.js"></script>
  <script type="text/javascript">
    $(".questions-category").select2({
      placeholder: "Select Post Category",
      allowClear: true,
      maximumSelectionLength: 3
    });
    $('#tags').tagsInput({
      width: 'auto'
    });
  </script>
</body>


<!-- Mirrored from templates.scriptsbundle.com/knowledge/demo/post-question.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 07:35:42 GMT -->
</html>
