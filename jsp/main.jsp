<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메인페이지</title>
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
<link id="skin" rel="stylesheet" type="text/css" href="css/apartment-colors-blue.css">
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
	height: 48px; /* 높이값 초기화 */
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
	height: 48px; /* 높이값 초기화 */
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
	<div id="wrapper" class="wrapper2">

		<!-- Page header -->
		<header class="header2 header-dark">
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
										data-toggle="modal" id="loginButton"> <i class="fa fa-user"></i>
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
							<span class="sr-only">Toggle navigation</span> 
							<span class="icon-bar icon-bar1"></span> 
							<span class="icon-bar icon-bar2"></span> 
							<span class="icon-bar icon-bar3"></span>
						</button>
						<a href="main.action" title="" class="navbar-brand"> 
						<img src="images/logo-light.png" alt="Apartment - Premium Real Estate Template" />
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



		<section class="no-padding adv-search-section">
			<!-- Slider main container -->
			<div id="swiper1" class="swiper-container">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">

					<!-- Slides -->
					<div class="swiper-slide">

						<div class="slide-bg swiper-lazy"
							data-background="images/slides/1.jpg"></div>
					</div>
					<div class="swiper-slide">
						<div class="slide-bg swiper-lazy"
							data-background="images/slides/3.jpg"></div>
					</div>
				</div>
			</div>

	<!----------------------- 소개말 ------------------------------------------------>
			<div class="adv-search-cont" style="bottom: 265px;">
				<div class="container">
					<div class="row">
						<h1 align="center" 
							style="color: white; margin: 20px; font-size: 40px; font-weight: bold; text-shadow: 2px 2px 5px black;">
						믿고 맡길 수 있는 펫시터를 만나보세요!</h1>
						<h3 align="center"
							style="color: white; text-shadow: 2px 2px 5px black;">
							PETOPIA는 여행을 가거나 오랜시간 외출할 때</h3>
						<h3 align="center" style="color: white; text-shadow: 2px 2px 5px black; margin: 5px;">
							혼자 남겨진 반려동물을 가까운 이웃에게 연결해 드립니다.</h3>
						<div align="center">
							<a href="#siteDefinition" class="blog-grid1-button" style="position: relative; margin-top: 40px; font-size: x-large; height: 50px; padding-top: 10px;">
								<span>PETOPIA란?</span>
								<div class="blog-grid1-triangle" ></div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!------------------------------------------------------------------------  -->

			<form class="adv-search-form" action="searchAddressSitter"
				method="post" id="searchAddressSitterForm" onsubmit="return searchAddressSitterFormCheck()">
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
										<select name="availableCategory1" class="bootstrap-select"
											id="availableCategory" title="반려동물 종류"
											style="position: relatvie;">
											<option value="강아지">강아지</option>
											<option value="고양이">고양이</option>
										</select>
									</div>
									<div class="col-xs-12 col-sm-6 col-lg-3">
										<input type="text" id="datepicker" name="takeDate1"
											class="main-input datepicker" style="padding: 0px" placeholder="펫시팅 시작일" />

									</div>
									<div class="col-xs-12 col-sm-6 col-lg-3">
										<input type="text" id="datepicker1" name="returnDate1"
											class="main-input datepicker1" style="padding: 0px" placeholder="펫시팅 종료일" />

									</div>
									<div class="col-xs-12 col-sm-6 col-lg-3">
										<select name="petoption1" id="petoption"
											class="bootstrap-select" title="서비스" multiple
											data-actions-box="true">
											<option value="option1">픽업</option>
											<option value="option2">산책</option>
											<option value="option3">목욕</option>
										</select>

									</div>

									<div class="col-xs-12">

										<div class="simple-search-cont"
											style="position: relatvie; top: 30px; box-shadow: 0 0 0 0;">
											<input type="text" name="mainAddress"
												class="main-input simple-search-input" style="padding: 0px"
												id="sample4_roadAddress_1"
												placeholder="주소를 검색해보세요~" /> <input
												type="submit"
												
												class="button-primary pull-right" value="시터검색">
											<div class="button-triangle"></div>
											<div class="button-triangle2"></div>
											<div class="button-icon">
												<i class="fa fa-search"></i>
												
											</div><s:if test="#session.loginID==null">
											<div id="resultText" style="position:relative; top:62px;"></div></s:if>
										</div>
									</div>
								</div>

							</div>

						</div>
					</div>

				</div>
			</form>
		</section>

		<section class="section-light no-bottom-padding section-top-shadow">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-9">
						<h5 class="subtitle-margin">hot sitter</h5>
						<h1>
							TOP Ranking<span class="special-color">.</span>
						</h1>
					</div>
					<div class="col-xs-12">
						<div class="title-separator-primary"></div>
					</div>
				</div>
			</div>
			
			<div class="grid-offers-container">
				<div class="owl-carousel" id="grid-offers-owl">
					
					<!-- iterator -->
					<s:iterator value="topSitterList" var="list" status="stat">
					<div class="grid-offer-col">
						<div class="grid-offer">
							<div class="grid-offer-front">
								<div class="grid-offer-photo">
									<img style="width: 293px;height: 320px;" src="download.action?photoNo=${list.photoSearch.photoNo }" alt="" />
									<div class="type-container">
										<div class="estate-type">hot</div>
										<div class="transaction-type">sitter</div>
										<!-- star rating -->
										<div class="rating<s:property value="#stat.index"/> my-rating-3" value="<s:property value="sittingNo"/>"></div>
									</div>
								</div>
								
								<div class="grid-offer-text">
									<i class="fa fa-map-marker grid-offer-localization"></i>
									<div class="grid-offer-h4">
										<h4 class="grid-offer-title"><b>이름</b>&nbsp;:&nbsp;&nbsp;${list.memberSearch.name }</h4>
									</div>
									<i class="fa fa-map-marker grid-offer-localization"></i>
									<div class="grid-offer-h4">
										<h4 class="grid-offer-title"><b>주소</b>&nbsp;:&nbsp;&nbsp;${list.memberSearch.address1 }&nbsp;${list.memberSearch.address2 }</h4>
									</div>
									<div class="clearfix"></div>
									<div class="clearfix"></div>
								</div>
								<div class="price-grid-cont">
									<div class="grid-price-label pull-left" style="width:30%">돌봄펫:</div>
									<div class="grid-price pull-right" style="width:70%">${list.availableCategory }</div>
									<div class="clearfix"></div>
								</div>
								<div class="grid-offer-params">
									<div class="grid-area" style="width: 33.3%;">
										<s:if test='#list.option1 == "y"'>
											<img src="images/parking-icon.png"/>픽업
										</s:if>
									</div>
									<div class="grid-rooms">
										<s:if test='#list.option2 == "y"'>
											<img src="images/bathrooms-icon.png"/>목욕
										</s:if>
									</div>
									<div class="grid-baths" align="right">
										<s:if test='#list.option3 == "y"'>
											<img src="images/walk-icon.png"/>산책
										</s:if>
									</div>
								</div>
								
							</div>
							<div class="grid-offer-back">
								<div id="grid-map<s:property value="#stat.index"/>" class="grid-offer-map"></div>
								<div class="button">
									<a href="sitterDetail?memberNo=${list.memberNo }"
										class="button-primary"> <span>read more</span>
										<div class="button-triangle"></div>
										<div class="button-triangle2"></div>
										<div class="button-icon">
											<i class="fa fa-search"></i>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					</s:iterator>
					<!-- iterater end -->
					
				</div>
			</div>
		</section>
		
		
		<a id="siteDefinition"></a>
		<section class="team section-light section-both-shadow">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-9">
						<h5 class="subtitle-margin">about petopia</h5>
								<h1>petopia란?<span class="special-color">.</span></h1>
					</div>
					<div class="col-xs-12">
						<div class="title-separator-primary2"></div>
					</div>
				</div>
			</div>
			<div class="team-container" align="center">
					<img src="images/petopia.png">
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
					<input id="notMember" type="hidden" value="<s:property value="#session.notMember"/>">
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
						회원이 아니세요? <a href="#" class="register-link">회원가입</a>
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
							class="input-full main-input" placeholder="비밀번호 확인" />
							<input type="text" id="postcode" class="main-input" placeholder="우편번호"> <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" name="member.address1" class="input-full main-input" id="address1" placeholder="도로명주소"> 
							<input type="text" name="member.address2" class="input-full main-input"	id="address2" placeholder="상세주소"> 
							<span id="guide" style="color: #999"></span> <a href="#" id="joinBt" data-dismiss="modal" class="button-primary button-shadow button-full"> <span>회원가입</span>
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
	<script>
	
	$().ready(function(){
		
		
		 /* $('.my-rating-3').starRating({
			  starSize: 25,
			  strokeWidth: 9,
			  strokeColor: '#FF0000',
			  initialRating: 2,
			  starGradient: {
			      start: '#FFFF00',
			      end: '#FFA500'
			  }
		  }); */
		  
	});
	</script>

	<!-- google maps initialization -->
	<script type="text/javascript">
		/* google.maps.event.addDomListener(window, 'load', init);
		function init() {
			mapInit(40.6128, -73.7903, "featured-map1", "images/pin-house.png",
					false);
		} */
		
		$().ready(function(){
			var notMember = $('#notMember').val();
			if(notMember == 'notMember'){
				setTimeout(function(){
					$('#loginButton').trigger('click');
				}, 1000);
				
				$.ajax({
					url : 'deleteNotMember.action',
				});
			}
			
			
			$.ajax({
				url : 'searchTopRanking.action',
				datatype : 'json',
				success : function(data) {
					output(data);
				}
			});
			
		});
		
		function output(data) {
			google.maps.event.addDomListener(window, 'load', function(){
				var list = data.topSitterList;
				console.log(list);
				$(list).each(function(i, item){
					mapInit(item.memberSearch.lat,
							item.memberSearch.lng, "grid-map" + i,
							"images/pin-house.png", false);
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
			});
		}
		
	</script>
	<script type="text/javascript">
		function searchAddressSitterFormCheck() {
			var form = document.getElementById('searchAddressSitterForm');
		/* 	var ad = document.getElementById('sample4_roadAddress_1').value;
			if(ad==''){
				$('#resultText').append(' <div class="alert alert-info fade in" style="width:800px; height:40px;"><a href="#" class="close" data-dismiss="alert" aria-label="close" >&times;</a>주소는 반드시 입력하세요. </div></div>');

				return false;
			} */
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
				dataType : 'json'
				//,success : RegResult
			//회원가입
			});
		}
	</script>

	<!-- Daum 주소 API -->
	<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							/* if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							    extraRoadAddr += data.bname;
							} */
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							var juso1 = data.sido + " " + data.sigungu
							
							document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('address1').value = juso1;
							document.getElementById('address2').value = fullRoadAddr.slice(juso1.length+1);
							

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';

							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
	</script>
</body>
</html>