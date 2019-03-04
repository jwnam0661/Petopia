<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>검색 결과 페이지</title>
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
	<!-- 경고창 -->
<script src="js/parsley.min.js"></script>
<script src="js/ko.js"></script>
<!-- 달력 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.3/themes/cupertino/jquery-ui.css" />
<link rel="stylesheet" href="css/jquery-ui.structure.min.css" />
<script src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<!-- star rating -->
<link rel="stylesheet" type="text/css" href="css/star-rating-svg.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
	
</script>
<style>
.ui-datepicker {
	z-index: 1151 !important;
}

.datepicker {
	width: 100%; /* 원하는 너비 설정 */
	height: 40px; /* 높이값 초기화 */
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	/* border: 1px solid #999; */
	border-radius: 0; /* iSO 둥근모서리 제거 */
	outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
	-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
	-moz-appearance: none;
	appearance: none;
	position: relative;
	top: 50px;
	font-size: 100%;
	text-align: center;
}

.datepicker1 {
	width: 100%; /* 원하는 너비 설정 */
	height: 40px; /* 높이값 초기화 */
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	/* border: 1px solid #999; */
	border-radius: 0; /* iSO 둥근모서리 제거 */
	outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
	-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
	-moz-appearance: none;
	appearance: none;
	position: relative;
	top: 50px;
	font-size: 100%;
	text-align: center;
}
</style>
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
							<li class="dropdown"><li class="dropdown"><a href="main.action" class="dropdown-toggle">Home</a>
								</li>
							<s:if test="#session.loginID!=null">
							<li class="dropdown">
									<a href="newMyPage" class="dropdown-toggle">My Page</a>
									<ul class="dropdown-menu">
									<s:if test="#session.petAru==null && #session.sitterNo==null">
								<li><a href="goInsertPet.action">Resister Pet</a></li>
								</s:if>
								
								<s:elseif test="#session.petAru==null && #session.sitterNo!=null">
								<li><a href="goInsertPet.action">Resister Pet</a></li>
								<li><a href="askSitterQualificationPage.action">Update Sitter</a></li>
								</s:elseif>
								
								<s:elseif test="#session.petAru!=null && #session.sitterNo==null">
								<li><a href="goInsertPet.action">Update Pet</a></li>
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
								<s:if test="#session.sitterNo==null && #session.memberNo!=null">
								<a href="askSitterQualificationPage.action" class="dropdown-toggle">Join Sitter</a></s:if> 
								
								</li>
							<!-- TODO :  sitter면 시터페이지 들어가는 버튼, 시터아니면 시터신청페이지 버튼 -->
							<s:if test="#session.sitterNo!=null && #session.memberNo!=null">
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

		<section class="adv-search-section no-padding">
			<div id="offers-map"></div>
			<form class="adv-search-form" action="searchSitter" method="post"
				id="searchAddressSitterForm">
				<div class="adv-search-cont">
					<div class="container">
						<div class="row">

							<div class="col-lg-1 visible-lg">
								<a id="adv-search-hide" href="#"><i class="jfont">&#xe801;</i></a>
							</div>
						</div>
					</div>
					<div class="container">
						<div class="row tab-content" style="height: 200px">
							<div role="tabpanel"
								class="col-xs-12 adv-search-outer tab-pane fade in active"
								id="apartments">
								<div class="row">

									<div class="col-xs-12 col-sm-6 col-lg-3">
									<s:if test="!availableCategory.equals('')">
											
											
										<input type="hidden" id="availableCategory"
											value="${ availableCategory}"> <select
											name="availableCategory" class="bootstrap-select"
											
											 style="position: relative;">
											 
											<s:if test="availableCategory.equals('강아지')">
												<option value="강아지" selected>강아지</option>
												<option value="고양이">고양이</option>
												<option value="기타">기타</option>
											</s:if>
											<s:elseif test="availableCategory.equals('고양이')">
												<option value="강아지">강아지</option>
												<option value="고양이" selected>고양이</option>
												<option value="기타">기타</option>
											</s:elseif>
											<s:elseif test="availableCategory.equals('기타')">
												<option value="강아지">강아지</option>
												<option value="고양이">고양이</option>
												<option value="기타" selected>기타</option>
											</s:elseif>
										</select>
										</s:if><s:else>
											
											
										<input type="hidden" id="availableCategory"
											value="${ availableCategory}"> <select
											name="availableCategory" class="bootstrap-select"
											title="반려동물 종류"
											 style="position: relative;">
											 
												<option value="강아지">강아지</option>
												<option value="고양이">고양이</option>
												<option value="기타">기타</option>
											
										</select>
										</s:else>
									</div>
									<div class="col-xs-12 col-sm-6 col-lg-3">
										<input type="text" id="datepicker" name="takeDate"
											value="${takeDate }" class="main-input datepicker" style="padding: 0px"
											placeholder="펫시팅 시작일" />

									</div>
									<div class="col-xs-12 col-sm-6 col-lg-3">
										<input type="text" id="datepicker1" value="${returnDate }"
											name="returnDate" class="main-input datepicker1" style="padding: 0px"
											placeholder="펫시팅 종료일" />

									</div>
									<div class="col-xs-12 col-sm-6 col-lg-3">
									<s:if test="searchList.size()!=0">
										<select name="petoption" id="petoption"
											class="bootstrap-select"
											title="<s:iterator value="searchList"><s:property />,</s:iterator>"
											multiple data-actions-box="true">
											<option value="option1">픽업</option>
											<option value="option2">산책</option>
											<option value="option3">목욕</option>
										</select>
										</s:if>
										<s:else>
										<select name="petoption" id="petoption"
											class="bootstrap-select"
											title="서비스"
											multiple data-actions-box="true">
											<option value="option1">픽업</option>
											<option value="option2">산책</option>
											<option value="option3">목욕</option>
										</select>
										</s:else>
										<!-- 검색 옵션값 히든으로 처리함 -->
										<input type="hidden" id="hiddenPetoption"
											value="${petoption }" />
									</div>

									<div class="col-xs-12">

										<div class="simple-search-cont"
											style="position: relatvie; top: 30px; box-shadow: 0 0 0 0;">
								
											<input type="text" name="address1" id="address1" required="required"
												value="${address1 }" class="simple-search-input"
												style="padding: 0px" /> <input type="submit" onsubmit="javascript:searchAddressSitterFormCheck()"
												class="button-primary pull-right" value="시터검색"> <span>시터검색</span>
												<div class="button-triangle"></div>
												<div class="button-triangle2"></div>
												<div class="button-icon">
													<i class="fa fa-search"></i>
												</div>
												
											</a>
											
										</div>
									</div>
								</div>
<button type="submit" class="hide"></button>
							</div>
						</div>
					</div>

				</div>
			</form>
		</section>

		<section class="section-light section-top-shadow">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12 col-lg-6">
								<h1>
									petsitter list<span class="special-color">.</span>
								</h1>
							</div>
							<div class="col-xs-12">
								<div class="title-separator-primary"></div>
							</div>
						</div>
						<div class="row grid-offer-row" id="iterator">
							<%-- <s:iterator value="sitterList" status="stat">
							<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 grid-offer-col">
								<div class="grid-offer">
									<div class="grid-offer-front">
									
										<div class="grid-offer-photo">
											<img src="download.action?photoNo=<s:property value="photoSearch.photoNo"/>"/>
										</div>
										<div class="grid-offer-text">
											<i class="fa fa-map-marker grid-offer-localization"></i>
											<div class="grid-offer-h4"><h4 class="grid-offer-title">
											lat : <s:property value="memberSearch.lat" /><br />
											id : <s:property value="memberSearch.memberID"/><br />
											address1 : <s:property value="memberSearch.address1" /></h4>
											</div>
											 <div class="clearfix"></div>
											<p><s:property value="sitterComment" /></p>
											<div class="clearfix"></div> 
										</div>
										<div class="price-grid-cont">
											<div class="grid-price-label pull-left" style="width:55%">돌봄가능한 펫:</div>
											<div class="grid-price pull-right" style="width:45%">
												<s:property value="availableCategory"/>
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="grid-offer-params">
											<div class="grid-area" style="width:33.3%">
												<img src="images/area-icon.png" alt="" />픽업<s:property value="option1"/>
											</div>
											<div class="grid-rooms" style="width:33.3%">
												<img src="images/rooms-icon.png" alt="" />산책<s:property value="option2"/>
											</div>
											<div class="grid-baths" style="width:33.3%">
												<img src="images/bathrooms-icon.png" alt="" />목욕<s:property value="option3"/>
											</div>							
										</div>	
										
									</div>
									<div class="grid-offer-back">
										<div id="grid-map<s:property value="#stat.count"/>" class="grid-offer-map"></div>
										<div class="button">	
											<a href="sitterDetail?memberNo=<s:property value="memberNo" />" class="button-primary">
												<span>read more</span>
												<div class="button-triangle"></div>
												<div class="button-triangle2"></div>
												<div class="button-icon"><i class="fa fa-search"></i></div>
											</a>
										</div>
									</div>
								</div>							
							</div>
							</s:iterator> --%>

						</div>
					</div>

				</div>
				<!-- <div class="offer-pagination margin-top-30">
					<a href="#" class="prev"><i class="jfont">&#xe800;</i></a><a
						class="active">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a
						href="#" class="next"><i class="jfont">&#xe802;</i></a>
					<div class="clearfix"></div>
				</div> -->
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

					<form id="loginForm" action="logIn" method="post">
						<input name="memberID" id="memberID" type="text"
							class="input-full main-input" placeholder="아이디" /> <input
							name="password" id="password" type="password"
							class="input-full main-input" placeholder="비밀번호" /> <a
							href="javascript:loginFormCheck()"
							class="button-primary button-shadow button-full"> <span>Login</span>
							<div class="button-triangle"></div>
							<div class="button-triangle2"></div>
							<div class="button-icon">
								<i class="fa fa-user"></i>
							</div>
						</a>
					</form>
					<a href="#" class="forgot-link pull-right">비밀번호가 기억안나세요?</a>
					<div class="clearfix"></div>
					<p class="login-or"></p>
					<p class="modal-bottom">
						회원가입 <a href="#" class="register-link">회원가입</a>
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
							Sign In<span class="special-color">.</span>
						</h1>
						<div class="short-title-separator"></div>
					</div>
					<form id="joinForm">
						<input name="member.memberID" type="text" id="joinID"
							class="input-full main-input" placeholder="아이디"> <input
							name="idCheck" type="button" value="아이디 중복체크" /> <input
							name="member.name" type="text" id="joinName"
							class="input-full main-input" placeholder="이름" /> <input
							name="member.email" type="text" id="joinEmail"
							class="input-full main-input" placeholder="이메일" /> <input
							name="member.phone" type="text" id="joinPhone"
							class="input-full main-input"
							placeholder="휴대폰번호 ex)010-1234-1234" /> <input
							name="member.password" type="password" id="joinPassword"
							class="input-full main-input" placeholder="비밀번호" /> <input
							name="repeat-password" type="password" id="joinRepeatPassword"
							class="input-full main-input" placeholder="비밀번호 확인" /> <input
							type="text" id="sample4_postcode" class="main-input"
							placeholder="우편번호"> <input type="button"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="member.address1"
							class="input-full main-input" id="sample4_roadAddress"
							placeholder="도로명주소"> <input type="text"
							name="member.address2" class="input-full main-input"
							id="sample4_jibunAddress" placeholder="지번주소"> <span
							id="guide" style="color: #999"></span> <a href="#" id="joinBt"
							data-dismiss="modal"
							class="button-primary button-shadow button-full"> <span>회원가입</span>
							<div class="button-triangle"></div>
							<div class="button-triangle2"></div>
							<div class="button-icon">
								<i class="fa fa-user"></i>
							</div>
						</a>
					</form>
					<div class="clearfix"></div>
					<p class="login-or"></p>
					<p class="modal-bottom">
						이미 가입하셨어요? <a href="#" class="login-link">로그인</a>
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

	<!-- star rating -->
	<script src="js/jquery.star-rating-svg.js"></script>
	
	<!-- google maps initialization -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			sitterList();
			setTimeout(function(){
				$('#adv-search-hide').trigger('click');
			}, 1000);
			
		});
		
		function rating(data){
			var list = data.sitterList;
			$(list).each(function(i, item){
				var ratingaId = '.ratinga' + i;
				$(ratingaId).starRating({
					  starSize: 25,
					  strokeWidth: 9,
					  strokeColor: '#FF0000',
					  initialRating: item.avgRate,
					  starGradient: {
					      start: '#FFFF00',
					      end: '#FFA500'
					  }
			  	});
				//console.log('>>>>>>>>>>>>>>>' + $('.ratinga0').html())
			});
			
		}

		function sitterList() {
			var address1 = $('#address1').val();
			var availableCategory = $('#availableCategory').val();
			var takeDate = $('#datepicker').val();
			var returnDate = $('#datepicker1').val();
			var hiddenPetoption = $('#hiddenPetoption').val();

			/* if(availableCategory =='강아지'){
				$('#availableCategory').attr('title', '강아지');
			}
			if(availableCategory =='고양이'){
				$('#availableCategory').attr('title', '고양이');
			}
			if(availableCategory =='기타'){
				$('#availableCategory').attr('title', '기타');
			} */
			var dataForAvg;
			$.ajax({
				url : 'sitterList.action',
				type : 'POST',
				data : {
					address1 : address1,
					takeDate : takeDate,
					returnDate : returnDate,
					availableCategory : availableCategory,
					petoption : hiddenPetoption
				},
				datatype : 'json',
				success : function(data) {
					output(data);
					dataForAvg = data;
					
					
				}
			});
		}
		
		

		function output(data) {
			var list = data.sitterList;
			var str = '<p></p>';

			$(list).each(
						function(i, item) {
							str += '<div class=' + '"' + 'col-xs-12 col-sm-6 col-md-4 col-lg-3 grid-offer-col' + '"' + '>';
							str += '<div class=' + '"' + 'grid-offer' + '"' + '><div class=' + '"' + 'grid-offer-front' + '"' + '><div class=' + '"' + 'grid-offer-photo' + '"' + '>';
							str += '<img style="width: 293px;height: 320px;" src=' + '"'
									+ 'download.action?photoNo='
									+ item.photoSearch.photoNo + '"' + '/>';
							str += '<div class="type-container"><div class="estate-type">hot</div><div class="transaction-type">sitter</div>';
							str += '<div class="rating'+ i + ' my-rating-3"></div></div></div><div class=' +'"'+ 'grid-offer-text' +'"'+ '><i class=' +'"'+ 'fa fa-map-marker grid-offer-localization' +'"'+ '></i>';//여기 맨앞에 별div넣어야함
							str += '<div class=' +'"'+ 'grid-offer-h4' +'"'+ '><h4 class=' +'"'+ 'grid-offer-title' +'"'+ '>';
							str += '<b>이름</b>&nbsp;:&nbsp;&nbsp;' + item.memberSearch.name + '<br />';
							str += '<b>주소</b>&nbsp;:&nbsp;&nbsp;'
									+ item.memberSearch.address1 + '&nbsp' + item.memberSearch.address2 + '</h4>';
							str += '</div><div class=' +'"'+ 'clearfix' +'"'+ '></div><div class=' +'"'+ 'clearfix' +'"'+ '></div></div><div class=' +'"'+ 'price-grid-cont' +'"'+ '>';
							str += '<div class=' + '"'
									+ 'grid-price-label pull-left' + '"'
									+ ' style=' + '"' + 'width:30%' + '"'
									+ '>돌봄펫:</div>';
							str += '<div class=' + '"'
									+ 'grid-price pull-right' + '"'
									+ ' style=' + '"' + 'width:70%' + '"'
									+ '>' + item.availableCategory;
							str += '</div><div class=' +'"'+ 'clearfix' +'"'+ '></div></div>';
							str += '<div class=' +'"'+ 'grid-offer-params' +'"'+ '><div class='
									+ '"'
									+ 'grid-area'
									+ '"'
									+ ' style='
									+ '"' + 'width:33.3%' + '"' + '>';
							if(item.option1 == 'y'){
								str += '<img src='+'"'+'images/parking-icon.png' +'"'+ '/>픽업';
							}
							str += '</div><div class=' + '"' + 'grid-rooms'
									+ '"' + ' style=' + '"' + 'width:33.3%'
									+ '"' + '>';
							if(item.option2 == 'y'){
								str += '<img src=' +'"'+ 'images/bathrooms-icon.png' +'"'+ '/>목욕';
							}		
							str += '</div><div class=' + '"' + 'grid-baths'
									+ '"' + ' style=' + '"' + 'width:33.3%'
									+ '"' + '>';
							if(item.option3 == 'y'){
								str += '<img src=' +'"'+ 'images/walk-icon.png' +'"'+ '/>산책';	
							}		
							str += '</div></div></div><div class=' +'"'+ 'grid-offer-back' +'"'+ '>';
							str += '<div id=' +'"'+ 'grid-map'+i+'"'+' class=' +'"'+ 'grid-offer-map' +'"'+ '></div><div class=' +'"'+ 'button' +'"'+ '>';
							str += '<a href=' + '"'
									+ 'sitterDetail?memberNo='
									+ item.memberNo + '"' + ' class=' + '"'
									+ 'button-primary' + '"' + '>';
							str += '<span>read more</span><div class=' +'"'+ 'button-triangle' +'"'+ '></div><div class=' +'"'+ 'button-triangle2' +'"'+ '></div>';
							str += '<div class=' +'"'+ 'button-icon' +'"'+ '><i class=' +'"'+ 'fa fa-search' +'"'+ '></i></div></a></div></div></div></div>';
						});
			$('#iterator').html(str);
				
			google.maps.event.addDomListener(window, 'load', function() {
				//별점 그림 만들기
			var fullStar = '<div class="jq-star" style="width:25px;  height:25px;"><svg version="1.0" class="jq-star-svg" shape-rendering="geometricPrecision" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="305px" height="305px" viewBox="60 -62 309 309" style="enable-background:new 64 -59 305 305; stroke-width:9px;" xml:space="preserve"><style type="text/css">.svg-empty-459{fill:url(#459_SVGID_1_);}.svg-hovered-459{fill:url(#459_SVGID_2_);}.svg-active-459{fill:url(#459_SVGID_3_);}</style><linearGradient id="459_SVGID_1_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:lightgray"></stop><stop offset="1" style="stop-color:lightgray"></stop> </linearGradient><linearGradient id="459_SVGID_2_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:orange"></stop><stop offset="1" style="stop-color:orange"></stop> </linearGradient><linearGradient id="459_SVGID_3_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:#FFFF00"></stop><stop offset="1" style="stop-color:#FFA500"></stop> </linearGradient><polygon data-side="left" class="svg-active-459" points="281.1,129.8 364,55.7 255.5,46.8 214,-59 172.5,46.8 64,55.4 146.8,129.7 121.1,241 213.9,181.1 213.9,181 306.5,241 " style="stroke: #FF0000"></polygon><polygon data-side="right" class="svg-active-459" points="364,55.7 255.5,46.8 214,-59 213.9,181 306.5,241 281.1,129.8 " style="stroke-dasharray: 230 232 210 0; stroke: #FF0000"></polygon></svg></div>';
			var halfStar = '<div class="jq-star" style="width:25px;  height:25px;"><svg version="1.0" class="jq-star-svg" shape-rendering="geometricPrecision" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="305px" height="305px" viewBox="60 -62 309 309" style="enable-background:new 64 -59 305 305; stroke-width:9px;" xml:space="preserve"><style type="text/css">.svg-empty-517{fill:url(#517_SVGID_1_);}.svg-hovered-517{fill:url(#517_SVGID_2_);}.svg-active-517{fill:url(#517_SVGID_3_);}</style><linearGradient id="517_SVGID_1_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:lightgray"></stop><stop offset="1" style="stop-color:lightgray"></stop> </linearGradient><linearGradient id="517_SVGID_2_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:orange"></stop><stop offset="1" style="stop-color:orange"></stop> </linearGradient><linearGradient id="517_SVGID_3_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:#FFFF00"></stop><stop offset="1" style="stop-color:#FFA500"></stop> </linearGradient><polygon data-side="left" class="svg-active-517" points="281.1,129.8 364,55.7 255.5,46.8 214,-59 172.5,46.8 64,55.4 146.8,129.7 121.1,241 213.9,181.1 213.9,181 306.5,241 " style="stroke: #FF0000"></polygon><polygon data-side="right" class="svg-empty-517" points="364,55.7 255.5,46.8 214,-59 213.9,181 306.5,241 281.1,129.8 " style="stroke-dasharray: 230 232 210 0; stroke: #FF0000"></polygon></svg></div>';
			var zeroStar = '<div class="jq-star" style="width:25px;  height:25px;"><svg version="1.0" class="jq-star-svg" shape-rendering="geometricPrecision" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="305px" height="305px" viewBox="60 -62 309 309" style="enable-background:new 64 -59 305 305; stroke-width:9px;" xml:space="preserve"><style type="text/css">.svg-empty-658{fill:url(#658_SVGID_1_);}.svg-hovered-658{fill:url(#658_SVGID_2_);}.svg-active-658{fill:url(#658_SVGID_3_);}</style><linearGradient id="658_SVGID_1_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:lightgray"></stop><stop offset="1" style="stop-color:lightgray"></stop> </linearGradient><linearGradient id="658_SVGID_2_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:orange"></stop><stop offset="1" style="stop-color:orange"></stop> </linearGradient><linearGradient id="658_SVGID_3_" gradientUnits="userSpaceOnUse" x1="121.1501" y1="-70.35" x2="121.15" y2="125.0045"><stop offset="0" style="stop-color:#FFFF00"></stop><stop offset="1" style="stop-color:#FFA500"></stop> </linearGradient><polygon data-side="left" class="svg-empty-658" points="281.1,129.8 364,55.7 255.5,46.8 214,-59 172.5,46.8 64,55.4 146.8,129.7 121.1,241 213.9,181.1 213.9,181 306.5,241 " style="stroke: #FF0000"></polygon><polygon data-side="right" class="svg-empty-658" points="364,55.7 255.5,46.8 214,-59 213.9,181 306.5,241 281.1,129.8 " style="stroke-dasharray: 230 232 210 0; stroke: #FF0000"></polygon></svg></div>';
			
				console.log('addDom');
				starArray = new Array();
				$(list).each(function(i, item){
					var rate = String(item.avgRate);
					console.log('rate>>>>>>>>>>>' + rate);
					
					var fullRate = 0;
					var halfRate = 0;
					var zeroRate = 0;
					var starRate = '';
					if(rate != '0'){
						rateArray = rate.split('.');
						fullRate = parseInt(rateArray[0]);
						console.log(fullRate);
						if(rateArray[1] == '5'){
							halfRate = true;
						}
					} else {
						
						zeroRate = 1;
					} 
					 if(zeroRate == 0){
						for(i=0; i < fullRate; i++){
							starRate += fullStar;
						}
						if(halfRate){
							starRate += halfStar
						}
					} else {
						for(i=0; i < 5; i++){
							starRate += zeroStar;
						}
					}
					starArray.push(starRate);
				});
				
				var locations = new Array();
				$(list).each(function(i, item) {
							
							//로케이션에 넣기
							console.log(item.memberSearch.lat + ", "
									+ item.memberSearch.lng);
							locations.push([
									item.memberSearch.lat,
									item.memberSearch.lng,
									"images/pin-house-red.png",
									"sitterDetail?memberNo="+item.memberNo,
									"download.action?photoNo="+item.photoSearch.photoNo,
									'<b>'+item.memberSearch.address1 + " " + item.memberSearch.address2+'</b>',
									'<div class="ratinga'+ i + ' my-rating-3">'+starArray[i]+'</div>'
							]);
							offersMapInit("offers-map", locations);
							console.log('offerMapInit');
							
							mapInit(item.memberSearch.lat,
									item.memberSearch.lng, "grid-map" + i,
									"images/pin-house.png", false);
							
							/*var ratingId = '.rating' + i;
							$(ratingId).starRating({
								  starSize: 25,
								  strokeWidth: 9,
								  strokeColor: '#FF0000',
								  initialRating: item.avgRate,
								  starGradient: {
								      start: '#FFFF00',
								      end: '#FFA500'
								  }
						  	});*/
						});
							console.log('mapInit');	
						})
						
				
				$(list).each(function(i, item){
					var ratingId = '.rating' + i;
					$(ratingId).starRating({
						  readOnly: true,
						  starSize: 25,
						  strokeWidth: 9,
						  strokeColor: '#FF0000',
						  initialRating: item.avgRate,
						  starGradient: {
						      start: '#FFFF00',
						      end: '#FFA500'
						  }
				  	});
					
				});

			/* var offersmap = document.getElementById('offers-map');
			google.maps.event.addDomListener(offersmap, 'click', function() {
				//console.log('click');
				//console.log(list);
				$(list).each(function(i, item){
					var ratingaId = '.ratinga' + i;
					$(ratingaId).starRating({
						  starSize: 25,
						  strokeWidth: 9,
						  strokeColor: '#FF0000',
						  initialRating: item.avgRate,
						  starGradient: {
						      start: '#FFFF00',
						      end: '#FFA500'
						  }
				  	});
					
				});
			}) */
			
		}
		
		
	</script>

	<script type="text/javascript">
		
		function searchAddressSitterFormCheck() {
			var form = document.getElementById('searchAddressSitterForm');
			var addresss = document.getElementById("sample4_roadAddress_1").value;

			if (addresss == '') {
				alert("주소는 반드시 입력 후 검색해야합니다.");
				return false;
			}
			/* 	var op1 = document.getElementsByName("petoption");
				for( var i=0; i<$('#petoption').size(); i++)
					  if( $("#petoption:eq("+i+")").attr("selected") ) //선택된 값찾기 */
			form.submit();
		}
		function loginFormCheck() {
			var form = document.getElementById('loginForm');

			form.submit();
		}

		$(document).ready(
				function() {
					$('#joinBt').on('click', joinSubmit);
					$(".datepicker").datepicker(
							{
								minDate : 0,
								dateFormat : 'yy-mm-dd',
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ],
								dayNamesMin : [ '일', '월', '화', '수', '목', '금',
										'토' ],
								changeMonth : true, //월변경가능
								changeYear : true, //년변경가능
								showMonthAfterYear : true, //년 뒤에 월 표시
								numberOfMonths : 3,
								onClose : function(selectedDate) {
									$(".datepicker1").datepicker("option",
											"minDate", selectedDate);
								}
							});
					$(".datepicker1").datepicker(
							{
								dateFormat : 'yy-mm-dd',
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ],
								dayNamesMin : [ '일', '월', '화', '수', '목', '금',
										'토' ],
								changeMonth : true, //월변경가능
								changeYear : true, //년변경가능
								showMonthAfterYear : true, //년 뒤에 월 표시
								numberOfMonths : 3,
								onClose : function(selectedDate) {
									$(".datepicker").datepicker("option",
											"maxDate", selectedDate);
								}
							});
				});

		function joinSubmit() {//회원가입 유효성 검사 및 action

			$.ajax({
				url : 'insertMember.action',
				type : 'POST',
				data : $('#joinForm').serialize(),
				dataType : 'json',
				success : RegResult
			//회원가입
			});
		}

		function RegResult() {
			alert('회원가입 성공!');
		}
	</script>

</body>
</html>