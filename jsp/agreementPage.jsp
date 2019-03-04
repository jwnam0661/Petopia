<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>이용약관 페이지</title>
	<meta name="keywords" content="Download, Apartment, Premium, Real Estate, HMTL, Site Template, property, mortgage, CSS" />
	<meta name="description" content="Download Apartment - Premium Real Estate HMTL Site Template" />
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link rel="icon" href="favicon.ico" type="image/x-icon">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">    
	<!-- Font awesome styles -->    
	<link rel="stylesheet" href="apartment-font/css/font-awesome.min.css">  
	<!-- Custom styles -->
	<link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,300,300italic,500,500italic,700,700italic&amp;subset=latin,latin-ext'>
	<link rel="stylesheet" type="text/css" href="css/plugins.css">
    <link rel="stylesheet" type="text/css" href="css/apartment-layout.css">
    <link id="skin" rel="stylesheet" type="text/css" href="css/apartment-colors-blue.css">
	
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
</head>
<body>
<div class="loader-bg"></div>
<div id="wrapper">

<!-- Page header -->	
	<header>
			<div class="top-bar-wrapper">
				<div class="container top-bar">
					<div class="row">
						<div class="col-xs-5 col-sm-8">
							<div class="top-mail pull-left hidden-xs">
								<span class="top-icon-circle"> <i
									class="fa fa-envelope fa-sm"></i>
								</span> <span class="top-bar-text">petopia@naver.com</span>
							</div>
							<div class="top-phone pull-left hidden-xxs">
								<span class="top-icon-circle"> <i class="fa fa-phone"></i>
								</span> <span class="top-bar-text">010-9310-9100</span>
							</div>
							<div
								class="top-localization pull-left hidden-sm hidden-md hidden-xs">
								<span class="top-icon-circle pull-left"> <i
									class="fa fa-map-marker"></i>
								</span> <span class="top-bar-text">서울특별시 강남구 영동대로 513 코엑스몰 4층
									ICT센터</span>
							</div>
						</div>
						<div class="col-xs-7 col-sm-4">
							<s:if test="#session.loginID ==null">
								<div class="top-social-last top-dark pull-right"
									data-toggle="tooltip" data-placement="bottom"
									title="Login/Register">
									<a class="top-icon-circle" href="#login-modal"
										data-toggle="modal"> <i class="fa fa-user"></i>
									</a>
								</div>
								<div class="top-social pull-right">
									<a class="top-icon-circle" href="#register-modal"
										data-toggle="modal"> <i class="fa fa-user-plus"> </i>
									</a>
								</div>
							</s:if>
							<s:else>
								<div class="top-social-last top-dark pull-right">
									<a class="top-icon-circle" href="logOut.action"> <i
										class="fa fa-sign-in"></i>
									</a>
								</div>
							</s:else>

							
						</div>
					</div>
				</div>
				<!-- /.top-bar -->
			</div>
			<!-- /.Page top-bar-wrapper -->
			<nav class="navbar main-menu-cont">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar icon-bar1"></span> <span
								class="icon-bar icon-bar2"></span> <span
								class="icon-bar icon-bar3"></span>
						</button>
						<a href="main.action" title="" class="navbar-brand"> <img
							src="images/logo-dark.png"
							alt="Apartment - Premium Real Estate Template" />
						</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="main.action" class="dropdown-toggle">Home</a>
								</li>
						<s:if test="#session.loginID!=null">
							<li class="dropdown">
									<a href="newMyPage" class="dropdown-toggle">My Page</a>
									<ul class="dropdown-menu">
									<s:if test="#session.petAru==null && #session.sitterNo==null">
								<li><a href="goInsertPet.action">Resister Pet</a></li>
								<li><a href="askSitterQualificationPage.action">Join Sitter</a></li></s:if>
								<s:elseif test="#session.petAru==null && #session.sitterNo!=null">
								<li><a href="goInsertPet.action">Resister Pet</a></li>
								<li><a href="askSitterQualificationPage.action">Update Sitter</a></li>
								</s:elseif>
								<s:elseif test="#session.petAru!=null && #session.sitterNo==null">
								<li><a href="goInsertPet.action">Update Pet</a></li>
								<li><a href="askSitterQualificationPage.action">Join Sitter</a></li>
								</s:elseif>
								
								<s:else>
								<li><a href="goInsertPet.action">Update Pet</a></li>
								<li><a href="askSitterQualificationPage.action">Update Sitter</a></li>
								</s:else>
							</ul>
							</li>
								</s:if>
								 <s:elseif test="#session.loginID == 'admin'">
									<a href="myPage" class="dropdown-toggle">Admin Page</a>
								</s:elseif>
								
								<li class="dropdown">
								<s:elseif test="#session.sitterNo==null && #session.loginID!=null">
								<a href="" class="dropdown-toggle">Join Sitter</a></s:elseif> 
								
								</li>
							<!-- TODO :  sitter면 시터페이지 들어가는 버튼, 시터아니면 시터신청페이지 버튼 -->
							<s:if test="#session.sitterNo!=null">
								<li class="dropdown"><a href="progressSittingPage"
									class="dropdown-toggle">Sitter Page</a>
									
									<ul class="dropdown-menu">
									
								<li><a href="progressSittingPage.action">Progressing Sitting</a></li>
								<li><a href="requestedSittingPage">Requested Sitting</a></li>
								<li><a href="approvedSittingPage.action">Approved Sitting</a></li>
									</ul>
							</s:if>
						</ul>
					</div>
				</div>
			</nav>
			<!-- /.mani-menu-cont -->
		</header>
  	
    <section class="short-image no-padding blog-short-title">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-lg-12 short-image-title">
					<h5 class="subtitle-margin second-color">petopia</h5>
					<h1 class="second-color">이용약관</h1>
					<div class="short-title-separator"></div>
				</div>
			</div>
		</div>
    </section>
	
	<section class="section-light section-top-shadow">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<article class="archive-item zoom-cont2">
						<figure><img style="height: 350px" src="images/agreement.jpg" alt="" class="zoom" /></figure>
						<div class="blog-text">
							<b>
							<p align="center">펫스테이 이용약관</p>
							<br>
							<p>서비스 이용약관</p>
							<br>
							<p>제1조 (목적)</p>
							</b>
							<p>이 약관은 SCmaster(주)(이하 "회사")가 운영하는 웹사이트 "펫토피아"를 이용함에 있어 회사와 회원간의 권리, 의무 및 책임사항과 절차 등을 정하기 위해 만들어졌습니다.</p>
							<b><p>제2조 (정의)</p></b>
							</b>
							<p>이 약관에서는 용어를 다음과 같이 정의하여 사용합니다.</p>
							<p>1. "서비스"란 회원의 단말기(모바일, 태블릿PC 등 각종 유무선 장치를 포함)를 통하여 회사가 제공하는 "펫토피아" 및 관련 서비스 일체를 말합니다.</p>
							<p>2. "회원"이란 서비스에 접속하여 이 약관에 따라 회사와 이용계약을 체결함으로써 서비스를 이용하는 고객 여러분을 말합니다.</p>
							<p>3. "펫"은 회원이 기르는 반려동물을 말합니다.</p>
							<p>....</p>
						</div>
						<div class="agent-social-bar margin-top-30">
							<div align="center">
								<a href="goAskSittingPage" class="button-primary button-shadow">
									<span>네, 동의합니다</span>
									<div class="button-triangle"></div>
									<div class="button-triangle2"></div>
									<div class="button-icon"><i class="fa fa-search"></i></div>
								</a>
							</div>	
							<div class="clearfix"></div>
						</div>
					</article>	
				</div>
			</div>
		</div>
	</section>

    
	<footer class="small-cont">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-6 small-cont">
					<img src="images/logo-light.png" alt="" class="img-responsive footer-logo" />
				</div>
				<div class="col-xs-12 col-md-6 footer-copyrights">
					&copy; Copyright 2015 <a href="http://themeforest.net/user/johnnychaos?ref=johnnychaos" target="blank">Jan Skwara</a>. All rights reserved. Buy on <a href="http://themeforest.net/user/johnnychaos/portfolio?ref=johnnychaos" target="blank">Themeforest</a>.
				</div>
			</div>
		</div>
	</footer>
</div>	

<!-- Move to top button -->

<div class="move-top">
	<div class="big-triangle-second-color"></div>
	<div class="big-icon-second-color"><i class="jfont fa-lg">&#xe803;</i></div>
</div>	

<!-- Login modal -->
	<div class="modal fade apartment-modal" id="login-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<div class="modal-title">
						<h1>Login<span class="special-color">.</span></h1>
						<div class="short-title-separator"></div>
					</div>
					<input name="login" type="email" class="input-full main-input" placeholder="Email" />
					<input name="password" type="password" class="input-full main-input" placeholder="Your Password" />
					<a href="my-profile.html" class="button-primary button-shadow button-full">
						<span>Sing In</span>
						<div class="button-triangle"></div>
						<div class="button-triangle2"></div>
						<div class="button-icon"><i class="fa fa-user"></i></div>
					</a>
					<a href="#" class="forgot-link pull-right">Forgot your password?</a>
					<div class="clearfix"></div>
					<p class="login-or">OR</p>
					<a href="#" class="facebook-button">
						<i class="fa fa-facebook"></i>
						<span>Login with Facebook</span>
					</a>
					<a href="#" class="google-button margin-top-15">
						<i class="fa fa-google-plus"></i>
						<span>Login with Google</span>
					</a>
					<p class="modal-bottom">Don't have an account? <a href="#" class="register-link">REGISTER</a></p>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

<!-- Register modal -->
	<div class="modal fade apartment-modal" id="register-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<div class="modal-title">
						<h1>Register<span class="special-color">.</span></h1>
						<div class="short-title-separator"></div>
					</div>
					<input name="first-name" type="text" class="input-full main-input" placeholder="Frist name" />
					<input name="last-name" type="text" class="input-full main-input" placeholder="Last name" />
					<input name="email" type="email" class="input-full main-input" placeholder="Email" />
					<input name="password" type="password" class="input-full main-input" placeholder="Password" />
					<input name="repeat-password" type="password" class="input-full main-input" placeholder="Repeat Password" />
					<a href="my-profile.html" class="button-primary button-shadow button-full">
						<span>Sing up</span>
						<div class="button-triangle"></div>
						<div class="button-triangle2"></div>
						<div class="button-icon"><i class="fa fa-user"></i></div>
					</a>
					<div class="clearfix"></div>
					<p class="login-or">OR</p>
					<a href="#" class="facebook-button">
						<i class="fa fa-facebook"></i>
						<span>Sing Up with Facebook</span>
					</a>
					<a href="#" class="google-button margin-top-15">
						<i class="fa fa-google-plus"></i>
						<span>Sing Up with Google</span>
					</a>
					<p class="modal-bottom">Already registered? <a href="#" class="login-link">SING IN</a></p>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

<!-- Forgotten password modal -->
	<div class="modal fade apartment-modal" id="forgot-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<div class="modal-title">
						<h1>Forgot your password<span class="special-color">?</span></h1>
						<div class="short-title-separator"></div>
					</div>
					<p class="negative-margin forgot-info">Instert your account email address.<br/>We will send you a link to reset your password.</p>
					<input name="login" type="email" class="input-full main-input" placeholder="Your email" />
					<a href="my-profile.html" class="button-primary button-shadow button-full">
						<span>Reset password</span>
						<div class="button-triangle"></div>
						<div class="button-triangle2"></div>
						<div class="button-icon"><i class="fa fa-user"></i></div>
					</a>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

<!-- jQuery  -->
    <script type="text/javascript" src="js/jQuery/jquery.min.js"></script>
	<script type="text/javascript" src="js/jQuery/jquery-ui.min.js"></script>
	
<!-- Bootstrap-->
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>

<!-- Google Maps -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfDCV5hXiPamCIT8_vwGXuzimLQ9MF76g&amp;libraries=places"></script>
	
<!-- plugins script -->
	<script type="text/javascript" src="js/plugins.js"></script>

<!-- template scripts -->
	<script type="text/javascript" src="mail/validate.js"></script>
    <script type="text/javascript" src="js/apartment.js"></script>
	
	</body>
</html>