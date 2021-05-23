<%@page import="com.dto.Question"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuestionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from templates.scriptsbundle.com/knowledge/demo/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 07:33:11 GMT -->
    <head>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <meta charset="utf-8">
  
  <script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'/>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        
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
    
     <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/jquery.dataTables.min.css" />"/>
     
      <link href="<c:url value="/resources/css/select2.min.css"/>" rel="stylesheet" />
  <link rel="stylesheet" href="<c:url value="/resources/css/jquery.tagsinput.min.css"/>"/>
     
     
	<!-- JavaScripts -->
	<script src="<c:url value="/resources/js/modernizr.js"/>">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
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
                            <li><a href="index.jsp">Home</a>
                            </li>
                            <!--li class="hidden-xs"><a href="blog.jsp">Blog</a>
                            </li//-->
                            <li  class="hidden-xs"><a href="contact">Contact Us</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
                        <ul class="top-nav nav-right">
                            <!--li><a href="login_form.jsp"><i class="fa fa-lock" aria-hidden="true"></i>Login</a>
                            </li>
                            <li><a href="register.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i>Signup</a>
                            </li-->
                            <li class="dropdown"> 
                                <a class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-animations="fadeInUp">
                                    <img class="img-circle resize" alt="" src="resources/images/authors/13.png">
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
                                    <li><a href="expert-profile-setting"><i class=" icon-gears"></i> Profile Setting</a></li>
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
                    <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">	<span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- logo -->
                    <a href="index.jsp" class="navbar-brand">
                        <img class="img-responsive" alt="" src="resources/images/logo.png">
                    </a>
                    <!-- header end -->
                </div>
                <!-- navigation menu -->
                <div class="navbar-collapse collapse">
                    <!-- right bar -->
                    <ul class="nav navbar-nav navbar-right">
                        <!--li class="hidden-sm"><a href="how-work.jsp">How  It Works</a//-->
                        </li>
                        <!--li class="dropdown"> <a class="dropdown-toggle " data-hover="dropdown" data-toggle="dropdown" data-animations="fadeInUp">Pages <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                
                                <li><a href="/404.jsp">Error Page</a>
                                </li>
                                
                            </ul>
                        </li-->
                        <li>
                            <div class="btn-nav"><p href="" class="btn btn-primary btn-small navbar-btn">EXPERT HOME</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- navigation menu end -->
                <!--/.navbar-collapse -->
            </div>
        </div>
        <!-- HEADER Navigation End -->
        <!-- =-=-=-=-=-=-= HOME =-=-=-=-=-=-= -->
        <!--div class="full-section search-section">
                <div class="search-area container">
                        <h3 class="search-title">Have a Question?</h3>
                        <p class="search-tag-line">If you have any question you can ask below or enter what you are looking for!</p>
                        <form autocomplete="off" method="get" class="search-form clearfix" id="search-form">
                                <input type="text" title="* Please enter a search term!" placeholder="Type your search terms here" class="search-term " autocomplete="off">
                                <input type="submit" value="Search" class="search-btn">
                        </form>
                </div>
        </div-->
        <!-- =-=-=-=-=-=-= HOME END =-=-=-=-=-=-= -->
        <!-- =-=-=-=-=-=-= Main Area =-=-=-=-=-=-= -->
        <div class="main-content-area">
            <!-- =-=-=-=-=-=-= Latest Questions  =-=-=-=-=-=-= -->
            <section class="white question-tabs padding-bottom-80" id="latest-post">
                <div class="container">
                    <div class="row">
                        <!-- Content Area Bar -->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <!-- Tabs -->
                                    <ul class="nav panel-tabs">
                                        <li class="active"> <a data-toggle="tab" href="#tab1"><i class="icofont icon-ribbon"></i><span class="hidden-xs">Unanswered Questions</span></a> 
                                        </li>
                                        <li> <a data-toggle="tab" href="#tab2"><i class="icofont icon-layers"></i><span class="hidden-xs">Answered Questions</span></a> 
                                        </li>
                                        <li> <a data-toggle="tab" href="#tab3"><i class="icofont icon-layers"></i><span class="hidden-xs">Incident Raised</span></a> 
                                        </li>
                                        <li> <a data-toggle="tab" href="#tab4"><i class="icofont icon-layers"></i><span class="hidden-xs">View Reply</span></a> 
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div id="tab1" class="tab-pane active">
                                        <!-- Question Listing -->
                                        <jsp:include page="/ShowAllQuestionsToExpert.jsp"/>
                                        <!-- Question Listing End -->
                                    </div>
                                    <div id="tab2" class="tab-pane">
                                        <!-- Question Listing -->
                                        <jsp:include page="/ShowAllAnswersToExpert.jsp"/> 
                                    </div>
                                        <!-- Question Listing End -->
                                   <div id="tab3" class="tab-pane">
                                        <!-- Question Listing -->
                                        <jsp:include page="/ShowAllIncidentByExpert.jsp"/> 
                                    </div>
                                    <div id="tab4" class="tab-pane">
                                        <!-- Question Listing -->
                                        <jsp:include page="/ShowAllReplyByCustomer.jsp"/> 
                                    </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!-- end container -->
            </section>
            
        </section>
        <!-- =-=-=-=-=-=-= Blog & News end =-=-=-=-=-=-= -->
        <!-- =-=-=-=-=-=-= Testimonials =-=-=-=-=-=-= -->
        <section data-stellar-background-ratio="0.1" class="testimonial-bg parallex">
			<div class="container">
				<!-- Row -->
				<div class="row">
					<!-- Blog Grid -->
					<div class="col-md-8 ">
						<div id="owl-slider" class="happy-client">
							<div class="item"> <i class="fa fa-quote-left"> </i>
								<p>Expert Messaging System is a question and answer site for professional and enthusiasts. It features questions and answers on a wide variety of topics ranging from music , sports , business , art , cookery , health etc. The website serves as a platform for users to ask questions and assigned experts for the topics to answer those questions.</p>
								<div class="client-info-wrap clearfix">
									<div class="client-img">
										<!--img class="img-circle" src="../../../theemon.com/d/designagency/LivePreview/assets/images/client-img-two.jpg" alt="" /-->
									</div>
									<div class="client-info"> <strong>Expert Messaging</strong>
									</div>
								</div>
							</div>
							<div class="item"> <i class="fa fa-quote-left"> </i>
								<p>Expert Messaging System is a question and answer site for professional and enthusiasts. It features questions and answers on a wide variety of topics ranging from music , sports , business , art , cookery , health etc. The website serves as a platform for users to ask questions and assigned experts for the topics to answer those questions.</p>
								<div class="client-info-wrap clearfix">
									<div class="client-img">
										<!--img class="img-circle" src="../../../theemon.com/d/designagency/LivePreview/assets/images/client-img-two.jpg" alt="" /-->
									</div>
									<div class="client-info"> <strong>Expert Messaging</strong> 
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Blog Grid -->
					<!-- Blog Grid -->
					<div class="col-md-4 no-padding">
						<div class="success-stories">
							<div class="main-heading text-center">
								<h2>Admin Detail</h2>
								<hr class="main">
                                                                <p><Strong>Email-</strong>shivamguptaniki@gmail.com<br><Strong>Contact-</Strong>8889727802</p>
							</div>
						</div>
					</div>
					<!-- Blog Grid -->
					<div class="clearfix"></div>
				</div>
				<!-- Row End -->
			</div>
			<!-- end container -->
		</section>
        
    </div>
    
    <!--Footer Bottom-->
    <div class="footer-copyright">
        <div class="auto-container clearfix">
            <!--Copyright-->
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
	<script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript">
  $(document).ready( function () {
      $("#tbl_exp").DataTable();
  } );
  </script>
   <script type="text/javascript">
  $(document).ready( function () {
      $("#exp_tbl").DataTable();
  } );
  </script>
  <script type="text/javascript">
  $(document).ready( function () {
      $("#mp_tbl").DataTable();
  } );
  </script>
  <script src="resources/js/select2.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.tagsinput.min.js"></script>
  <script type="text/javascript">
    $(".questions-category").select2({
      placeholder: "Select Customer",
      allowClear: true,
      maximumSelectionLength: 3
    });
    $('#tags').tagsInput({
      width: 'auto'
    });
  </script>
</body>


<!-- Mirrored from templates.scriptsbundle.com/knowledge/demo/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 07:34:51 GMT -->
</html>