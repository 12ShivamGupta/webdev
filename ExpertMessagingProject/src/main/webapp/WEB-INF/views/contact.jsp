
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from templates.scriptsbundle.com/knowledge/demo/contact.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 07:35:05 GMT -->
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
	<!-- JavaScripts -->
	<script src="<c:url value="/resources/js/modernizr.js"/>">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	
<!--[if lt IE 9]-->
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
					<li><a href="index.jsp">Home</a></li>
				</ul>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
				<ul class="top-nav nav-right"></ul>
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
      <!-- navigation menu -->
      <div class="navbar-collapse collapse">
        <!-- right bar -->
        <ul class="nav navbar-nav navbar-centre">
          <!--li class="hidden-sm"><a href="how-work.jsp">How  It Works</a>
          </li//-->
          <!--li><a href="listing.jsp">Browse Questions</a>
          </li-->
          <li>
            <div class="btn-nav"><a href="" class="btn btn-primary btn-small navbar-btn">Contact Us</a>
            </div>
          </li>
        </ul>
      </div>
      <!-- navigation menu end -->
      <!--/.navbar-collapse -->
    </div>
  </div>
  <!-- HEADER Navigation End -->

  <!-- =-=-=-=-=-=-= Main Area =-=-=-=-=-=-= -->
  <div class="main-content-area">

    <!-- =-=-=-=-=-=-= Page Breadcrumb =-=-=-=-=-=-= -->
    <!--section class="page-title">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-sm-7 co-xs-12 text-left">
            <h1>Contact Us</h1>
          </div>
          <!-- end col -->
          <div class="col-md-6 col-sm-5 co-xs-12 text-right">
            <div class="bread">
              <!--ol class="breadcrumb">
                <li><a href="#">Home</a>
                </li>
                <li><a href="#">Pages</a>
                </li>
                <li class="active">Contact</li>
              </ol-->
            </div>
            <!-- end bread -->
          </div>
          <!-- end col -->
        </div>
        <!-- end row -->
      </div>
      <!-- end container -->
    </section-->

    <!-- =-=-=-=-=-=-= Page Breadcrumb End =-=-=-=-=-=-= -->

    <!-- =-=-=-=-=-=-= Contact Us  =-=-=-=-=-=-= -->
    <section class="section-padding-80 white contact-us" id="contacts">
      <div class="container">
        <div class="row">
          <div class="col-sm-8 col-sm-8 col-xs-12">

            <h2>Send a Message</h2>

            <form id="contactForm" method="post" action="sendmymail">
              <div class="row">
                <div class="col-lg-6 formmargin">

                  <div class="form-group">
                    <input type="text" placeholder="Name" id="name" name="name" class="form-control" required>

                  </div>

                  <div class="form-group">
                    <input type="email" placeholder="Email" id="email" name="email" class="form-control" required>

                  </div>

                  <div class="form-group">
                    <input type="text" placeholder="Subject" id="subject" name="subject" class="form-control" required>
                  </div>

                </div>
                <div class="col-lg-5">
                  <div class="form-group">
                    <textarea cols="6" rows="6" placeholder="Message..." id="message" name="message" class="form-control" required></textarea>
                  </div>
                </div>
                <div class="col-lg-12">
                  <button id="yes" class="btn btn-primary" type="submit">Send Message</button>

                </div>
              </div>
            </form>
          </div>

          <div class="col-md-4 col-sm-4 col-xs-12 contact-detail">

            <h2>Contact Details</h2>

            <div class="contact-info">
                <div class="follow"><b>Address:</b>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-map-marker"></i> 144,Harry da Ghar ,Sant Nagar &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Khandwa Road,
Indore - 452020</div><br>
			<div class="follow"><b>Phone:</b>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-phone"></i> 88897XXXXX, 91653XXXXX </div><br>
                        <div class="follow"><b>Email:</b>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-envelope-o"></i>&nbsp; abc@gmail.com</div><br>
              <!--div class="social-links-two clearfix">
                <a class="facebook img-circle" href="#">
                  <span class="fa fa-facebook-f"></span>
                </a>
                <a class="twitter img-circle" href="#">
                  <span class="fa fa-twitter"></span>
                </a>
                <a class="google-plus img-circle" href="#">
                  <span class="fa fa-google-plus"></span>
                </a>
                <a class="linkedin img-circle" href="#">
                  <span class="fa fa-pinterest-p"></span>
                </a>
                <a class="linkedin img-circle" href="#">
                  <span class="fa fa-linkedin"></span>
                </a>
              </div-->
            </div>
            <!-- end links -->

          </div>

          <div class="clearfix"></div>
        </div>
      </div>
      <!-- end container -->
    </section>
    <!-- =-=-=-=-=-=-= Contact Us End =-=-=-=-=-=-= -->

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
</body>


<!-- Mirrored from templates.scriptsbundle.com/knowledge/demo/contact.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 07:35:05 GMT -->
</html>