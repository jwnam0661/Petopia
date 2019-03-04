<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>시팅 신청페이지</title>
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
	<!-- 달력 -->
<link href="css/datepicker.min.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Fira+Sans:400,300,500&amp;subset=latin,cyrillic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.3/themes/cupertino/jquery-ui.css" />
<link rel="stylesheet" href="css/jquery-ui.structure.min.css" />
<script src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
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
	
  		
    <section class="short-image no-padding contact-short-title">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-lg-12 short-image-title">
					<h5 class="subtitle-margin second-color">get in touch</h5>
					<h1 class="second-color">시팅 신청</h1>
					<div class="short-title-separator"></div>
				</div>
			</div>
		</div>
		
    </section>
	
	<section class="section-light section-both-shadow top-padding-45">
		<div class="container">
					<div class="row">
						<div class="col-sm-12">
								<div class="col-xs-12 col-md-6 margin-top-45">
									<div class="details-parameters-price" id="amount">총 합계액 :<span id="sum"></span></div>
									<div class="details-parameters">
										<div class="details-parameters-cont" style="font-size: medium; height: 50px;">
											<div class="details-parameters-name">시작일</div>
											<div class="details-parameters-val" id="sDate"></div>
											
											<div class="clearfix"></div>
										</div>
										
										<div class="details-parameters-cont" style="font-size: medium; height: 50px;">
											<div class="details-parameters-name">종료일</div>
											<div class="details-parameters-val" id="eDate"></div>
											<div class="clearfix"></div>
										</div>
										<div class="details-parameters-cont" style="font-size: medium; height: 50px;">
											<div class="details-parameters-name">시팅금액</div>
											<div class="details-parameters-val" id="countPay"></div>
											<div class="details-parameters-val"></div>
											<div class="clearfix"></div>
										</div>
										<div class="details-parameters-cont details-parameters-cont-last" style="font-size: medium; height: 50px;">
											<div class="details-parameters-name">픽업</div>
											<div class="details-parameters-val" id="pu"></div>
											<div class="clearfix"></div>
										</div>
										<div class="details-parameters-cont" style="font-size: medium; height: 50px;">
											<div class="details-parameters-name">산책</div>
											<div class="details-parameters-val" id="wa"></div>
											<div class="clearfix"></div>
										</div>
										<div class="details-parameters-cont" style="font-size: medium; height: 50px;">
											<div class="details-parameters-name">목욕</div>
											<div class="details-parameters-val" id="sh"></div>
											<div class="clearfix"></div>
										</div>
										
										
									</div>

								</div>


								<div class="col-xs-12 col-md-6 margin-top-45">
									<form name="askSittingForm" id="askSittingForm"
										action="askSitting" method="post">
										<div id="form-result"></div>
										
										<!-- 달력 -->
										<input type="hidden" id="sitterNo" name="sitterNo" value="${sitterNo}"/> 
										
										<input name="sitting.startDate" id="startDate" type="text"
											class="startDate datepicker-here input-short2 main-input"
											placeholder="시팅 시작일" data-language='en' />
											
											 <input
											name="sitting.endDate" id="endDate" type="text"
											class="endDate datepicker-here input-short2 main-input"
											placeholder="시팅 종료일" data-language='en' />

										<div class="labelled-input" style="width: 500px;">
											<h3 align="center">부가서비스</h3></br>
											<center>
												<img class="serviceCategory" style="height: 100px"
													src="images/픽업.png" data="pickUp" id="pickUp" /> <input
													type="hidden" id="option1" name="sitting.option1" value="n" />
												<img class="serviceCategory" style="height: 100px"
													src="images/산책.png" data="walking" /> <input
													type="hidden" id="option3" name="sitting.option3" value="n" />
												<img class="serviceCategory" style="height: 100px"
													src="images/목욕.png" data="shower" /> <input
													type="hidden" id="option2" name="sitting.option2" value="n" />
												
											</center>
										</div>
										<br>
										<div class="labelled-input" style="width: 500px;" >
											<h3 align="center">맡기실 펫 선택</h3></br>
											<center>
												<s:iterator value="petList" var="pet" >
													<s:if test='#pet.category == "dog"'>
														<img class="petChoice" style="height: 60px" src="images/dog1.png" id=${petNo } >
														${name }</br>
													</s:if>
												<s:if test='#pet.category == "cat"'>
													<img class="petChoice" style="height: 70px" src="images/cat1.png" id=${petNo }>
														${name }</br>
												</s:if>
													</s:iterator>
											</center>
										</div>


										<div>
											<a href="javascript:askSitting()"
												class="button-primary pull-right" id="form-submit"> <span>신청</span>
												<div class="button-triangle"></div>
												<div class="button-triangle2"></div>
												<div class="button-icon">
													<i class="fa fa-paper-plane"></i>
												</div>
											</a>
											<div class="clearfix"></div>
										</div>
									</form>
								</div>
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

	
	<script type="text/javascript">
	
		var unavailDays = new Array();
		
		 
		$(document).ready(function() {
			var sitterNo = document.getElementById("sitterNo").value;
			$.ajax({				
				url : 'searchUnavailableDateList.action',
				type : 'POST',
				data : {sitterNo: sitterNo},
				datatype : 'json',
				success : function(data){
					output(data);
				}
			});
		}); 
		
		function output(data){
			var list = data.unavailableDateList;
			$(list).each(function (i, item){
				var date = item.unavailableDate.slice(0, 10);
				var dateArray = date.split('-');
				var year = dateArray[0];
				var month;
				var day;
				if(dateArray[1].charAt(0) == '0'){
					month = dateArray[1].charAt(1);
				} else {
					month = dateArray[1];
				}
				if(dateArray[2].charAt(0) == '0'){
					day = dateArray[2].charAt(1);
				} else {
					day = dateArray[2];
				}
				var modifiedDate = year + '-' + month + '-' + day;
				console.log(modifiedDate);
				unavailDays.push(modifiedDate);
			});
		}
		
		function askSitting() {
			document.askSittingForm.submit();
		}
		
		
		
	  function disableAll(date){
			var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
			for(i = 0; i < unavailDays.length; i++){
				 if($.inArray(y + '-' +(m+1) + '-' + d,unavailDays) != -1) {
					 return [false];
				 }
			}
			return [true];
		}  
	  

	
	  $("#startDate").datepicker(
				{
					minDate : 0,
					dateFormat : 'yy-mm-dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월',
							'5월', '6월', '7월', '8월', '9월', '10월',
							'11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금','토' ],
					beforeShowDay: disableAll,		
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
					numberOfMonths : 3,
					
						onSelect : function(dateText, datePicker){
							 var html = '';
							var year = dateText.substr(0, 4);
							var month = dateText.substr(5, 2);
							var date = dateText.substr(8, 2);
							var startDate = year + '년' + month
							+ '월' + date + '일';
					html += '<p>' + startDate + '</p>';
					$('#sDate').html(html);
						}
				}); 
	  	
	  	
		$("#endDate").datepicker(
				{
					minDate : 0,
					dateFormat : 'yy-mm-dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월',
							'5월', '6월', '7월', '8월', '9월', '10월',
							'11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					beforeShowDay: disableAll,
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
					numberOfMonths : 3,
					
						onSelect : function(dateText, datePicker){
							 var html = '';
							var year = dateText.substr(0, 4);
							var month = dateText.substr(5, 2);
							var date = dateText.substr(8, 2);
							var startDate = year + '년' + month
							+ '월' + date + '일';
					html += '<p>' + startDate + '</p>';
					$('#eDate').html(html);
					var html1 = '';
					var stD = new Date($('#startDate').val());
					var edD = new Date($('#endDate').val());
					if(stD!=''){
						var btMs = edD.getTime() - stD.getTime();
						var btDay = btMs/(1000*60*60*24);
						if(btDay==0){
							btDay=1;
						}
						var payt = btDay*20000;
						
						html1 = '<p>'+payt+'원'+'</p>'
						$('#countPay').html(html1);
						$('#sum').html(payt);
						var sum = '<input type="hidden" id="hiddenSum" value="'+payt+'">'
						$('#sum').append(sum);
						
					}
						}
				}); 
	 
		$('.serviceCategory').on('click', function() {
			var category = $(this).attr('data');
			var html = '<p>+ 3000</p>';
			var html2 = '<p></p>';
			var hiddenSum = document.getElementById("hiddenSum").value;
			
			if (category == 'pickUp') {
				var srcData = $(this).attr('src');
				if (srcData == 'images/픽업.png') {
					$(this).attr('src', 'images/픽업2.png');
					$('#pu').html(html);
					$('#option1').val('y');
					
					var addSum = parseInt(hiddenSum)+3000;
					$('#countPay').html('<p>'+addSum+'원'+'</p>');
					$('#sum').html(addSum);
					var sum = '<input type="hidden" id="hiddenSum" value="'+addSum+'">'
					$('#sum').append(sum);
				}
				if (srcData == 'images/픽업2.png') {
					$(this).attr('src', 'images/픽업.png');
					$('#pu').html(html2);
					$('#option1').val('n');
					
					var addSum = parseInt(hiddenSum)-3000;
					$('#countPay').html('<p>'+addSum+'원'+'</p>');
					$('#sum').html(addSum);
					var sum = '<input type="hidden" id="hiddenSum" value="'+addSum+'">'
					$('#sum').append(sum);
				}
			}
			if (category == 'shower') {
				var srcData = $(this).attr('src');
				if (srcData == 'images/목욕.png') {
					$(this).attr('src', 'images/목욕2.png');
					$('#sh').html(html);
					$('#option2').val('y');
					
					var addSum = parseInt(hiddenSum)+3000;
					$('#countPay').html('<p>'+addSum+'원'+'</p>');
					$('#sum').html(addSum);
					var sum = '<input type="hidden" id="hiddenSum" value="'+addSum+'">'
					$('#sum').append(sum);
				}
				if (srcData == 'images/목욕2.png') {
					$(this).attr('src', 'images/목욕.png');
					$('#sh').html(html2);
					$('#option2').val('n');
					
					var addSum = parseInt(hiddenSum)-3000;
					$('#countPay').html('<p>'+addSum+'원'+'</p>');
					$('#sum').html(addSum);
					var sum = '<input type="hidden" id="hiddenSum" value="'+addSum+'">'
					$('#sum').append(sum);
				}
			}
			if (category == 'walking') {
				var srcData = $(this).attr('src');
				if (srcData == 'images/산책.png') {
					$(this).attr('src', 'images/산책2.png');
					$('#wa').html(html);
					$('#option3').val('y');
					
					var addSum = parseInt(hiddenSum)+3000;
					$('#countPay').html('<p>'+addSum+'원'+'</p>');
					$('#sum').html(addSum);
					var sum = '<input type="hidden" id="hiddenSum" value="'+addSum+'">'
					$('#sum').append(sum);
				}
				if (srcData == 'images/산책2.png') {
					$(this).attr('src', 'images/산책.png');
					$('#wa').html(html2);
					$('#option3').val('n');
					
					var addSum = parseInt(hiddenSum)-3000;
					$('#countPay').html('<p>'+addSum+'원'+'</p>');
					$('#sum').html(addSum);
					var sum = '<input type="hidden" id="hiddenSum" value="'+addSum+'">'
					$('#sum').append(sum);
				}
			}
		});

		$('.petChoice').on('click',function() {
							if($(this).attr('src') == 'images/dog1.png'){
								$(this).attr('src','images/dog2.png');
								var petNo = $(this).attr('id');
								var hi = '<input type="hidden" name="sitting.petNo" id="petNo" value="'+petNo+'">'
								$('.endDate').append(hi);
							} else if($(this).attr('src') == 'images/cat1.png'){
								$(this).attr('src','images/cat2.png');
								var petNo = $(this).attr('id');
								var hi = '<input type="hidden" name="sitting.petNo" id="petNo" value="'+petNo+'">'
								$('.endDate').append(hi);
							} else if($(this).attr('src') == 'images/dog2.png'){
								$(this).attr('src','images/dog1.png');
								$('#petNo').remove();
							} else if($(this).attr('src') == 'images/cat2.png'){
								$(this).attr('src','images/cat1.png');
								$('#petNo').remove();
							}
						});

	</script>
	
	
	</body>
</html>