<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>시터 디테일페이지</title>
<meta name="keywords"
	content="Download, Apartment, Premium, Real Estate, HMTL, Site Template, property, mortgage, CSS" />
<meta name="description"
	content="Download Apartment - Premium Real Estate HMTL Site Template" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Bootstrap -->
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<!-- Font awesome styles -->
<link rel="stylesheet" href="apartment-font/css/font-awesome.min.css">
<!-- Custom styles -->
<link rel='stylesheet' type='text/css'
	href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,300,300italic,500,500italic,700,700italic&amp;subset=latin,latin-ext'>
<link rel="stylesheet" type="text/css" href="css/plugins.css">
<link rel="stylesheet" type="text/css" href="css/apartment-layout.css">
<link id="skin" rel="stylesheet" type="text/css"
	href="css/apartment-colors-blue.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<!-- 캘린더 링크 및 스타일 -->
<link rel='stylesheet' href='calendar/lib/cupertino/jquery-ui.min.css' />
<link href='calendar/fullcalendar.css' rel='stylesheet' />
<link href='calendar/fullcalendar.print.css' rel='stylesheet' media='print' />

<style>

	body {
		margin: 0;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>    

</head>
<body>
	<div class="loader-bg"></div>
	<div id="wrapper">

		<!-- Page header --><header>
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


		<section class="section-dark no-padding">
			<!-- Slider main container -->
			<div id="swiper-gallery" class="swiper-container">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					<s:iterator value="photoList">
						<div class="swiper-slide">
							<div class="slide-bg swiper-lazy" data-background="download.action?photoNo=<s:property value="photoNo"/>"></div>
						</div>
					</s:iterator>
				</div>

				<div class="slide-buttons slide-buttons-center">
					<a href="#" class="navigation-box navigation-box-next slide-next"><div
							class="navigation-triangle"></div>
						<div class="navigation-box-icon">
							<i class="jfont">&#xe802;</i>
						</div></a>
					<div id="slide-more-cont"></div>
					<a href="#" class="navigation-box navigation-box-prev slide-prev"><div
							class="navigation-triangle"></div>
						<div class="navigation-box-icon">
							<i class="jfont">&#xe800;</i>
						</div></a>
				</div>

			</div>

		</section>
		<section class="thumbs-slider section-both-shadow">
			<div class="container">
				<div class="row">
					<div class="col-xs-1">
						<a href="#" class="thumb-box thumb-prev pull-left"><div
								class="navigation-triangle"></div>
							<div class="navigation-box-icon">
								<i class="jfont">&#xe800;</i>
							</div></a>
					</div>
					<div class="col-xs-10">
						<!-- Slider main container -->
						<div id="swiper-thumbs" class="swiper-container">
							<!-- Additional required wrapper -->
							<div class="swiper-wrapper">
								<!-- Slides -->
								<s:iterator value="photoList">
									<div class="swiper-slide">
										<img class="slide-thumb"
											src="download.action?photoNo=<s:property value="photoNo"/>"
											height="80" width="140">
									</div>
								</s:iterator>
							</div>
						</div>
					</div>
					<div class="col-xs-1">
						<a href="#" class="thumb-box thumb-next pull-right"><div
								class="navigation-triangle"></div>
							<div class="navigation-box-icon">
								<i class="jfont">&#xe802;</i>
							</div></a>
					</div>
				</div>
			</div>
		</section>
		<section class="section-light no-bottom-padding">
			<div class="container">
				<div class="row">

					<div class="row margin-top-60">
						<div class="col-xs-12 col-sm-7 col-md-8 col-lg-9">
								<div class="details-image pull-left hidden-xs">
									<i class="fa fa-paw"></i>
								</div>
								<div class="details-title pull-left">
									<h5 class="subtitle-margin">about sitter</h5>
									<input type="hidden" id="lat" value=${member.lat } />
									<input type="hidden" id="lng" value=${member.lng } />
									
									<h3>시터 정보<span class="special-color"></span></h3>
								</div>
								<div class="clearfix"></div>
								<div class="title-separator-primary"></div>
							</div>
					</div>
					
					<div class="row margin-top-60">
						<div class="col-xs-8 col-xs-offset-2 col-sm-3 col-sm-offset-0">
							<img src="download.action?photoNo=${photo.photoNo }" width="300" height="400"/>
							</a>
						</div>
						<div class="col-xs-12 col-sm-9">
							<div class="agent-social-bar" style="padding-left: 480px;">
								<div class="pull-left">
									<span class="agent-icon-circle"> <i class="fa fa-phone"></i>
									</span> <span class="agent-bar-text">010-xxxx-xxxx</span>
								</div>
								<div class="pull-left">
									<span class="agent-icon-circle"> <i
										class="fa fa-envelope fa-sm"></i>
									</span> <span class="agent-bar-text">xxxxxx@email.com</span>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						<div class="col-xs-12 col-sm-9 col-md-8">
							<div class="labelled-input" style="width: 850px;">
								<label for="first-name" style="width: 130px;">이  름</label><input readonly="readonly" id="first-name" name="first-name" type="text" class="main-input" style="text-align: center; width: 550px;" placeholder="" value="${member.name }" />
								<a href="goAgreementOfUtilizationPage" onclick="return petCheck();" class="button-primary button-shadow">
									<input type="hidden" id="petList" value="${petList}">
									<span>신청하기</span>
									<div class="button-triangle"></div>
									<div class="button-triangle2"></div>
									<div class="button-icon"><i class="fa fa-search"></i></div>
								</a>
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input" style="width: 850px;">
								<label for="sex" style="width: 130px;">성  별</label><input readonly="readonly" id="sex" name="" type="text" class="main-input" style="text-align: center; width: 295px;font-size: 25px;font: bold;" value="${sitter.sex}" />
								<label for="age" style="width: 130px;">나  이</label><input readonly="readonly" id="" name="" type="text" class="main-input" style="text-align: center; width: 295px;" value="${sitter.age}대"/>
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input" style="width: 850px;">
								<label for="availableCategory" style="width: 130px;">시팅 동물 종류</label><input style="text-align: center; width: 295px;" readonly="readonly" id="" name="" type="text" class="main-input" placeholder="" value="${sitter.availableCategory}"/>
								<label for="availableSize" style="width: 130px;">시팅 동물 크기</label><input style="text-align: center; width: 295px;" readonly="readonly" id="" name="" type="text" class="main-input" placeholder="" value="${sitter.availableSize}"/>
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input last" style="width: 850px;">
								<label for="service" style="width: 130px;">부가 서비스</label>
								<input style="text-align: center; width: 720px;" readonly="readonly" id="optionsText" name="" type="text" class="main-input" placeholder="" value=""/>
								<input type="hidden" id="option1" value="${sitter.option1 }">
								<input type="hidden" id="option2" value="${sitter.option2 }">
								<input type="hidden" id="option3" value="${sitter.option3 }">
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input last" style="width: 850px;">
								<label for="qualification" style="width: 130px;">자격증</label><input style="text-align: center; width: 720px;" readonly="readonly" id="" name="" type="text" class="main-input" placeholder="" value="${sitter.license}"/>
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input last" style="width: 850px;" align="center">
								<input type="hidden" id="sitterNo" name="sitterNo" value="${sitterNo}"/> 
								<label for="qualification" style="width: 850px; font-size: large; font-weight: bold;">시팅 가능한 날짜</label><br/><br/>
								<div id = "unavailDays" style="margin-top: 10px;"></div>
							<div class="clearfix"></div>
							</div>
						</div>
						</div>
					</div>
	<!-- 펫 상세정보는 여기까지..-------------------------------------------------------------------- -->
			
				<div class="col-xs-12">
					<div class="row margin-top-60">
						<div class="col-xs-12 col-sm-7 col-md-8 col-lg-9">
								<div class="details-image pull-left hidden-xs">
									<i class="fa fa-home"></i>
								</div>
								<div class="details-title pull-left">
									<h5 class="subtitle-margin">about Map</h5>
									<h3>${sitter.memberSearch.address1 }<span
											class="special-color"></span>
									</h3>
								</div>
								<div class="clearfix"></div>
								<div class="title-separator-primary"></div>
							</div>
					</div>
					
						<div class="row margin-top-45">
							<div class="col-xs-12 apartment-tabs">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active"><a href="#tab-map"
										aria-controls="tab-map" role="tab" data-toggle="tab"> <span>Map</span>
											<div class="button-triangle2"></div>
									</a></li>
									<li role="presentation"><a href="#tab-street-view"
										aria-controls="tab-street-view" role="tab" data-toggle="tab">
											<span>Street view</span>
											<div class="button-triangle2"></div>
									</a></li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="tab-map">
										<div id="estate-map" class="details-map"></div>
									</div>
									<div role="tabpanel" class="tab-pane" id="tab-street-view">
										<div id="estate-street-view" class="details-map"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="margin-top-45"></div>
					</div>
				</div>
			</div>
		</section>

		
		<footer class="small-cont">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-6 small-cont">
						<img src="images/logo-light.png" alt=""
							class="img-responsive footer-logo" />
					</div>
					<div class="col-xs-12 col-md-6 footer-copyrights">
						&copy; Copyright 2015 <a
							href="http://themeforest.net/user/johnnychaos?ref=johnnychaos"
							target="blank">Jan Skwara</a>. All rights reserved. Buy on <a
							href="http://themeforest.net/user/johnnychaos/portfolio?ref=johnnychaos"
							target="blank">Themeforest</a>.
					</div>
				</div>
			</div>
		</footer>
	</div>

	<!-- Move to top button -->

	<div class="move-top">
		<div class="big-triangle-second-color"></div>
		<div class="big-icon-second-color">
			<i class="jfont fa-lg">&#xe803;</i>
		</div>
	</div>

	<!-- Login modal -->
	<div class="modal fade apartment-modal" id="login-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<h1>
							Login<span class="special-color">.</span>
						</h1>
						<div class="short-title-separator"></div>
					</div>
					<input name="login" type="email" class="input-full main-input"
						placeholder="Email" /> <input name="password" type="password"
						class="input-full main-input" placeholder="Your Password" /> <a
						href="my-profile.html"
						class="button-primary button-shadow button-full"> <span>Sing
							In</span>
						<div class="button-triangle"></div>
						<div class="button-triangle2"></div>
						<div class="button-icon">
							<i class="fa fa-user"></i>
						</div>
					</a> <a href="#" class="forgot-link pull-right">Forgot your
						password?</a>
					<div class="clearfix"></div>
					<p class="login-or">OR</p>
					<a href="#" class="facebook-button"> <i class="fa fa-facebook"></i>
						<span>Login with Facebook</span>
					</a> <a href="#" class="google-button margin-top-15"> <i
						class="fa fa-google-plus"></i> <span>Login with Google</span>
					</a>
					<p class="modal-bottom">
						Don't have an account? <a href="#" class="register-link">REGISTER</a>
					</p>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Register modal -->
	<div class="modal fade apartment-modal" id="register-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<h1>
							Register<span class="special-color">.</span>
						</h1>
						<div class="short-title-separator"></div>
					</div>
					<input name="first-name" type="text" class="input-full main-input"
						placeholder="Frist name" /> <input name="last-name" type="text"
						class="input-full main-input" placeholder="Last name" /> <input
						name="email" type="email" class="input-full main-input"
						placeholder="Email" /> <input name="password" type="password"
						class="input-full main-input" placeholder="Password" /> <input
						name="repeat-password" type="password"
						class="input-full main-input" placeholder="Repeat Password" /> <a
						href="my-profile.html"
						class="button-primary button-shadow button-full"> <span>Sing
							up</span>
						<div class="button-triangle"></div>
						<div class="button-triangle2"></div>
						<div class="button-icon">
							<i class="fa fa-user"></i>
						</div>
					</a>
					<div class="clearfix"></div>
					<p class="login-or">OR</p>
					<a href="#" class="facebook-button"> <i class="fa fa-facebook"></i>
						<span>Sing Up with Facebook</span>
					</a> <a href="#" class="google-button margin-top-15"> <i
						class="fa fa-google-plus"></i> <span>Sing Up with Google</span>
					</a>
					<p class="modal-bottom">
						Already registered? <a href="#" class="login-link">SING IN</a>
					</p>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Forgotten password modal -->
	<div class="modal fade apartment-modal" id="forgot-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<h1>
							Forgot your password<span class="special-color">?</span>
						</h1>
						<div class="short-title-separator"></div>
					</div>
					<p class="negative-margin forgot-info">
						Instert your account email address.<br />We will send you a link
						to reset your password.
					</p>
					<input name="login" type="email" class="input-full main-input"
						placeholder="Your email" /> <a href="my-profile.html"
						class="button-primary button-shadow button-full"> <span>Reset
							password</span>
						<div class="button-triangle"></div>
						<div class="button-triangle2"></div>
						<div class="button-icon">
							<i class="fa fa-user"></i>
						</div>
					</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- jQuery  -->
	<script type="text/javascript" src="js/jQuery/jquery.min.js"></script>
	<script type="text/javascript" src="js/jQuery/jquery-ui.min.js"></script>

	<!-- Bootstrap-->
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>

	<!-- Google Maps -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfDCV5hXiPamCIT8_vwGXuzimLQ9MF76g&amp;libraries=places"></script>

	<!-- plugins script -->
	<script type="text/javascript" src="js/plugins.js"></script>

	<!-- template scripts -->
	<script type="text/javascript" src="mail/validate.js"></script>
	<script type="text/javascript" src="js/apartment.js"></script>

	<!-- google maps initialization -->
	<script type="text/javascript">
		google.maps.event.addDomListener(window, 'load', init);
		function init() {
			var lat = $('#lat').val();
			var lng = $('#lng').val();
			
			mapInit(lat, lng, "estate-map", "images/pin-contact-red.png", true);
			streetViewInit(parseFloat(lat), parseFloat(lng), "estate-street-view");


		}
	</script>
	
<!-- 캘린더(FullCalendar) -->
<script src='calendar/lib/moment.min.js'></script>
<script src='calendar/fullcalendar.min.js'></script>
<script src='calendar/fullcalendar.js'></script>
<script>

var unavailDays = new Array();


$(document).ready(function() {
	var sitterNo = document.getElementById("sitterNo").value;
	
	//---------------------------------------------textBOx value값 세팅
	var option1 = $('#option1').val();
	var option2 = $('#option2').val();
	var option3 = $('#option3').val();
	var optionsText = document.getElementById('optionsText');
	var sex = $('#sex').val();
	var sexText = document.getElementById('sex');
	//---------------------------------------------option value값 세팅
	if(option1 == "y"){
		optionsText.value += '픽업  ';
	}
	if(option2 == "y"){
		optionsText.value += '  목욕  ';
	}
	if(option3 == "y"){
		optionsText.value += '  산책';
	}
	if(option1 == '' && option2 == '' && option3 == ''){
		optionsText.value = '지원하는 부가서비스가 없습니다';
	}
	if(sex == 'F'){
		sexText.value = '♀'
	}
	if(sex == 'M'){
		sexText.value = '♂'
	}
	
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
	
	$("#unavailDays").datepicker(
			{
				inline: true,
				minDate : 0,
				dateFormat : 'yy-mm-dd',
				monthNamesShort : [ '1월', '2월', '3월', '4월',
						'5월', '6월', '7월', '8월', '9월', '10월',
						'11월', '12월' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금','토' ],
				changeMonth : false, //월변경가능
				changeYear : false, //년변경가능
				showMonthAfterYear : true, //년 뒤에 월 표시
				numberOfMonths : 3,
				beforeShowDay: disableAll	
			}).attr('readonly','readonly');
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


function petCheck(){
	var petList = document.getElementById('petList').value;
	if(petList.length == 2){
		alert("펫 등록 후 신청해주세요.");
		return false;
	} else{
		return true;
	}
}
</script>
</body>
</html>