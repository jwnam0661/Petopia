<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>진행중인 마이시팅</title>
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
	<!-- 글자체 -->
<link rel='stylesheet' type='text/css'
	href='https://fonts.googleapis.com/earlyaccess/nanumgothic.css'>
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/earlyaccess/hanna.css'>
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
						<h1 class="second-color">my page</h1>
						<div class="short-title-separator"></div>
					</div>
				</div>
			</div>
		</section>
		<section class="section-light section-top-shadow">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-9 col-md-push-3">
						<div class="row">
							<div class="col-xs-12 col-lg-7">
								<h5 class="subtitle-margin">my page</h5>
								<h1>
									PROGRESSING MYSITTING<span class="special-color">.</span>
								</h1>
							</div>
							<div class="col-xs-12 col-lg-5">
								<div class="order-by-container">
									<form name="selForm">
										<select name="sort" class="bootstrap-select" title="리스트 선택:"
											onchange="changePage()" id="selbox">
											<option value="newMyPage.action">진행 리스트</option>
											<option value="requestedMySittingPage.action">신청 리스트</option>
											<option value="approvedMySittingPage.action">수락된 리스트</option>
											<option value="completedMySittingPage.action">완료된
												리스트</option>
										</select>
									</form>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="title-separator-primary"></div>
							</div>
						</div>
						<div class="row list-offer-row">
							<div class="col-xs-12">


								<!-- 리스트 이터레이터 시작--------------------------------------------------------------------- -->
								<s:iterator value="sittingListProgress" var="sitting">
									<form name="sittingNoForm" action="checkSittingPhotoPage"
										method="post">
										<input type="hidden" class="sittingNo" name="sittingNo"
											value="${sitting.sittingNo }">
									</form>
									<div class="list-offer">
										<div class="list-offer-left">
											<div class="list-offer-front">
												<!-- 프론트 사진 -->
												<div class="list-offer-photo">
													<img src="download.action?photoNo=${sitting.photoNo }"
														style="width: 262px; height: 177px;" />
													<div class="type-container">
														<div class="estate-type">${sitting.pet.species }</div>
														<div class="transaction-type">${sitting.pet.name }</div>
													</div>
												</div>
												<div class="list-offer-params">
													<div class="list-area">
														<img src="images/area-icon.png" alt="" />${sitting.option1 }
													</div>
													<div class="list-rooms">
														<img src="images/rooms-icon.png" alt="" />${sitting.option2 }
													</div>
													<div class="list-baths">
														<img src="images/bathrooms-icon.png" alt="" />${sitting.option3 }
													</div>
												</div>
											</div>
											<!-- 백 사진 -->
											<div class="list-offer-back">
												<img src="download.action?photoNo=${sitting.photo.photoNo }"
													style="width: 262px; height: 221px;" />
												<div class="type-container">
													<div class="estate-type">${sitting.pet.species }</div>
													<div class="transaction-type">${sitting.pet.name }</div>
													<span></span>
												</div>
											</div>
										</div>
										<div class="list-offer-right">
											<div class="list-offer-text" style="width: 585px;">
												<i class="fa fa-map-marker list-offer-localization"></i>
												<div class="list-offer-h4">
													<a href="estate-details-right-sidebar.html">
														<h4 class="list-offer-title">${sitting.startDate.substring(0,10) }&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;${sitting.endDate.substring(0,10) }</h4>
													</a>
												</div>
												<div class="clearfix"></div>
												<div class="col-xs-6 col-sm-4" style="width: 250px">
													<ul class="details-ticks">
														<li><i class="jfont">&#xe815;</i>SEX&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.sex }</li>
														<li><i class="jfont">&#xe815;</i>중성화&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.neutralization }</li>
														<li><i class="jfont">&#xe815;</i>PET
															SIZE&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.petSize }</li>
														<li><i class="jfont">&#xe815;</i>성격&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.petComment }</li>
													</ul>
												</div>
												<div class="col-xs-6 col-sm-4">
													<ul class="details-ticks">
														<li><i class="jfont">&#xe815;</i>vaccine1&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.vaccine1 }</li>
														<li><i class="jfont">&#xe815;</i>vaccine2&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.vaccine2 }</li>
														<li><i class="jfont">&#xe815;</i>vaccine3&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.vaccine3 }</li>
														<li><i class="jfont">&#xe815;</i>vaccine4&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.vaccine4 }</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
											<div class="profile-list-footer">
												<div class="list-price profile-list-price">
													<a style="height: 42px;"
														href="#videochat-modal<s:property value="sittingNo"/>"
														data-toggle="modal"
														class="button-primary button-shadow button-full videoChat"
														value="<s:property value="sittingNo"/>"> <span>영상통화</span><span
														id="videoNew<s:property value="sittingNo"/>"
														style="color: red;"></span>
														<div class="button-triangle"></div>
														<div class="button-triangle2"></div>
													</a>
												</div>
												<a href="#" class="profile-list-delete" title="delete offer">
													<i class="fa fa-trash fa-lg"></i>
												</a> <a href="#" class="profile-list-edit" title="delete offer">
													<i class="fa fa-pencil fa-lg"></i>
												</a>
												<div class="profile-list-info hidden-xs">
													<a style="height: 42px;" id="messageOpen"
														href="#messages-modal<s:property value="sittingNo"/>"
														data-toggle="modal"
														class="button-primary button-shadow button-full"
														value="<s:property value="sittingNo"/>"> <span>대화창</span>
														<div class="button-triangle"></div>
														<div class="button-triangle2"></div>
													</a>
												</div>
												<div class="profile-list-info hidden-xs hidden-sm hidden-md">
													<a style="height: 42px;" href="#"
														onclick="sittingNoFormSubmit()" data-toggle="modal"
														class="button-alternative button-shadow button-full">
														<span>사진보기</span>
														<div class="button-triangle"></div>
														<div class="button-triangle2"></div>
													</a>
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="clearfix"></div>
								</s:iterator>
								<!-- 리스트 이터레이터 끝-------------------------------------------------------------------------- -->

							</div>
						</div>


					</div>
					<div class="col-xs-12 col-md-3 col-md-pull-9">
					<div class="sidebar-left">
						<h3 class="sidebar-title">my page<span class="special-color">.</span></h3>
						<div class="title-separator-primary"></div>
						
						<div class="profile-info margin-top-60">
							<s:if test='#session.sitterOK != null'>
								<img style="width: 200px;" src="download.action?photoNo=${sitter.photoSearch.photoNo }" class="pull-left" />
								<div class="profile-info-title negative-margin"  align="center">${member.name }님 환영합니다♥</div>
								
							</s:if>
							<s:else>
								<img style="width: 200px" src="images/memberProfile.png" id="agent-profile-photo" class="pull-left" />
								<div class="profile-info-title negative-margin" align="center">
									${member.name }님 환영합니다♥<br/><br/>
									시터가 되고 싶으시면<br/>
									 시터등록를 눌러주세요.
								</div>
							</s:else>
							<br>

							<div class="clearfix"></div>
						</div>
						<div class="center-button-cont margin-top-30">
							<a href="#insertPet-modal" data-toggle="modal" class="button-alternative button-shadow button-full">
								<span>RESISTER PET</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-th-list"></i></div>
							</a>
						</div>
						<div class="center-button-cont margin-top-15">
							<a href="askSitterQualificationPage" class="button-primary button-shadow button-full">
								<span>JOIN SITTER</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-user"></i></div>
							</a>
						</div>
						<div class="center-button-cont margin-top-15">
							<a href="myPetListPage" class="button-primary button-shadow button-full">
								<span>My Pet List</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-user"></i></div>
							</a>
						</div>
						<div class="center-button-cont margin-top-15">
							<a href="approvedMySittingPage" class="button-primary button-shadow button-full">
								<span>Sitting List</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-user"></i></div>
							</a>
						</div>
					</div>
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
	<div class="modal fade apartment-modals" id="login-modal">
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
						<a href="javascript:loginFormCheck()"
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
	<!-- 강아지일때 모달 -->
	<div class="modal fade apartment-modal" id="dog-modal"
		style="z-index: 9999;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="background-color: pink;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<h1>
							판정결과<span class="special-color"></span>
						</h1>
						<div class="short-title-separator"></div>
					</div>


					<p style="text-align: center;">
						<img class="petChoice" style="height: 200px;"
							src="images/dog2.png">
					</p>


					<div class="clearfix"></div>
					<p class="login-or"></p>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- 고양이일때 모달 -->
	<div class="modal fade apartment-modal" id="cat-modal"
		style="z-index: 9999;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="background-color: pink;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<h1>
							판정결과<span class="special-color"></span>
						</h1>
						<div class="short-title-separator"></div>
					</div>


					<p style="text-align: center;">
						<img class="petChoice" style="height: 200px;"
							src="images/cat2.png">
					</p>


					<div class="clearfix"></div>
					<p class="login-or"></p>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<!-- 기타일 때 모달 -->
	<div class="modal fade apartment-modal" id="etc-modal"
		style="z-index: 9999;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="background-color: pink;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<h1>
							판정결과<span class="special-color"></span>
						</h1>
						<div class="short-title-separator"></div>
					</div>


					<p style="text-align: center;">
						<img class="petChoice" style="height: 200px;"
							src="images/hagal.png">
					</p>


					<div class="clearfix"></div>
					<p class="login-or"></p>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
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

	<!-- insertPet Modal -->
	<div class="modal fade apartment-modal" id="insertPet-modal">
		<div class="modal-dialog"
			style="width: 600px; font-family: 'Jeju Gothic', serif; font-size: 18px; position: relative; position: relative; top: -120px;">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<span style="font-family: 'Hanna', serif; font-size: 35px;">펫등록<span
							class="special-color"> <img class="petChoice"
								style="height: 70px" src="images/cat2.png"></span></span>
					</div>
					<form action="insertPet" method="POST" id="insertPetForm"
						enctype="multipart/form-data">
						<input type="text" id="name" name="pet.name"
							class="input-full main-input" placeholder="펫 이름" /> <select
							id="category" name="pet.category" class="bootstrap-select">
							<option value="needSelect">펫 종류 선택</option>
							<option value="dog">강아지</option>
							<option value="cat">고양이</option>
						</select> <input type="text" id="species" name="pet.species"
							class="input-full main-input" placeholder="품종" /><br /> <select
							id="ageClass" name="pet.ageClass" class="bootstrap-select">
							<option value="-1">나이 선택</option>
							<option value="0">6개월 미만</option>
							<option value="1">6개월 ~ 1년</option>
							<option value="2">1년 이상(아래에 나이를 추가로 입력해 주세요)</option>
						</select> <input type="text" id="species" name="pet.age"
							class="input-full main-input" placeholder="나이(2세 이상인 경우)" /> <select
							id="sex" name="pet.sex" class="bootstrap-select">
							<option value="-1">펫의 성별</option>
							<option value="M">수컷</option>
							<option value="F">암컷</option>
						</select> <select id="neutralization" name="pet.neutralization"
							class="bootstrap-select">
							<option value="-1">중성화 여부</option>
							<option value="Y">중성화 했음</option>
							<option value="N">안했음</option>
						</select> <select id="petSize" name="pet.petSize" class="bootstrap-select">
							<option value="-1">크기</option>
							<option value="s">소형</option>
							<option value="m">중형</option>
							<option value="l">대형</option>
						</select>
						<!-- vaccine 정보가 들어감 -->
						<div id="vaccine">
							<br />
							<div id="dogVaccineDiv">
								<select id="dogVaccine" title="접종한 백신종류" name="vaccine"
									class="bootstrap-select" multiple data-actions-box="true"
									hidden="hidden">
									<option value="vaccine1">종합 7종 백신</option>
									<option value="vaccine2">코로나 장염 예방접종</option>
									<option value="vaccine3">켄넬코즈 예방접종</option>
									<option value="vaccine4">광견병 예방 접종</option>
								</select>
							</div>
							<div id="catVaccineDiv">
								<select id="catVaccine" title="접종한 백신종류" name="vaccine"
									class="bootstrap-select" multiple data-actions-box="true"
									hidden="hidden">
									<option value="vaccine1">종합 4종 백신</option>
									<option value="vaccine4">광견병 예방 접종</option>
								</select>
							</div>
						</div>
						<textarea rows="5" cols="" id="comment" name="pet.petComment"
							class="input-full main-input" style="height: 100px;"
							placeholder="펫에 대한 코멘트"></textarea>
						<div class="form-group">
							<p>
								<label for="input-img">펫 사진 업로드</label>:펫 혼자 찍힌, 동물로서의 특징이 잘 드러난
								사진을 골라 주세요.
							</p>

							<input type="file" id="input-img" name="input_img"
								class="form-control" accept="image/*" multiple="false" />
						</div>
						<div class="form-group">
							<img id="img" src="" class="img-responsive"></img>
						</div>


						<button id="submit-btn" class="btn btn-primary"
							data-toggle="modal"
							style="position: relative; left: 250px; background-color: black;">판정</button>

					</form>
				</div>
				<table id="result-table" class="table table-striped">
					<thead></thead>
					<tbody></tbody>
				</table>
				<canvas id="canvas" width="0" height="0"></canvas>
			</div>
			<div id="photoIdentificationResult">
				<!-- //TODO -->
				<input type="hidden" id="photoCheck" value="false">
				<div id="rstTx" style="position: relative; left: 200px;"></div>

				<a href="#" onclick="insertPetSubmit()"
					style="width: 130px; position: relative; border-radius: 5px; left: 230px; top: -70px; align-text: center;"
					class="button-primary button-shadow button-full"><span>펫등록</span>
					<div class="button-triangle"></div>
					<div class="button-triangle2"></div>
					<div class="button-icon">
						<i class="fa fa-paw"></i>
					</div> </a>
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<!-- insertPetModal -->
	<audio id="audioDog">
		<source src="sound/dog.mp3" type="audio/mp3" />
	</audio>
	<audio id="audioCat">
		<source src="sound/cat.wav" type="audio/wav" />
	</audio>
	<audio id="audioEtc">
		<source src="sound/hazure.WAV" type="audio/wav" />
	</audio>
	<!-- Messages modal -->
	<s:iterator value="sittingListProgress">
		<div class="modal fade apartment-modal"
			id="messages-modal<s:property value="sittingNo"/>">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="modal-title">
							<h1>쪽지</h1>
							<div class="short-title-separator"></div>
						</div>
						<p class="negative-margin forgot-info">Instert your account
							email address.</p>
						<input name="message.text" type="text"
							class="input-full main-input" placeholder="내용"
							id="text<s:property value="sittingNo"/>" /> <span
							class="button-primary button-shadow button-full message"
							id="sendMessage<s:property value="sittingNo"/>"> <span>쪽지
								보내기</span>
							<div class="button-triangle"></div>
							<div class="button-triangle2"></div>
							<div class="button-icon">
								<i class="fa fa-user"></i>
							</div>
						</span>
						<!-- 쪽지 내용 -->
						<div id="messageList<s:property value="sittingNo"/>"></div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</s:iterator>
	<!-- /.modal -->

	<!-- 영상통화 Modal -->
	<s:iterator value="sittingListProgress">
		<div class="modal fade apartment-modal"
			id="videochat-modal<s:property value="sittingNo"/>">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" value="<s:property value="sittingNo"/>">
							<span aria-hidden="true">&times;</span>
						</button>

						<div class="modal-title">
							<h1>영상통화</h1>
							<div class="short-title-separator"></div>
						</div>
						<div id="videoChatDiv<s:property value="sittingNo"/>">
							<input type="hidden" class="convId"
								value="<s:property value="sittingNo"/>">
							<video id="local" autoplay></video>
							<video id="remote" autoplay></video>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</s:iterator>

	<!-- jQuery  -->
	<script type="text/javascript" src="js/jQuery/jquery.min.js"></script>
	<script type="text/javascript" src="js/jQuery/jquery-ui.min.js"></script>

	<!-- Bootstrap-->
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>

	<!-- Google Maps -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfDCV5hXiPamCIT8_vwGXuzimLQ9MF76g&amp;sensor=false&amp;libraries=places"></script>

	<!-- plugins script -->
	<script type="text/javascript" src="js/plugins.js"></script>

	<!-- template scripts -->
	<script type="text/javascript" src="mail/validate.js"></script>
	<script type="text/javascript" src="js/apartment.js"></script>

	<!-- 영상통화용 -->
	<script src="js/nextRTC/adapter.js"></script>
	<script src="js/nextRTC/nextRTC.js"></script>
	<script>
		function insertPetSubmit() {
			var photoCheck = $('#photoCheck').val();
			if (photoCheck == "false") {
				$('#rstTx').append(' <div class="alert alert-danger" style="width:500px"><a href="#" class="close" data-dismiss="alert" aria-label="close" style="position:relative; left:10px;">&times;</a>사진판정은 필수입니다. </div></div>');

				return;
			}
			
			$('#insertPetForm').submit();

		}
		$()
				.ready(
						function() {

							setInterval(
									function() {
										$('div[id^=videochat-modal]')
												.each(
														function(i, item) {
															var divId = $(this)
																	.attr('id')
															console.log(divId);
															var classStatus = $(
																	this).attr(
																	'class');
															var sittingNo = divId
																	.slice(15);
															if (classStatus == 'modal fade apartment-modal') {
																$
																		.ajax({
																			url : 'pullVideoChat.action',
																			data : {
																				sittingNo : sittingNo
																			},
																			type : 'post',
																			success : function(
																					data) {
																				//console.log(data);
																				var spanId = '#videoNew'
																						+ sittingNo;
																				if (data.videoChat.status == 'created') {
																					$(
																							spanId)
																							.html(
																									'NEW');
																				} else {
																					var html = '';
																					$(
																							spanId)
																							.html(
																									html);
																				}
																				;

																			}
																		});
															}
														})

									}, 1000);

							$('.videoChat')
									.click(
											function() {
												var convId = $(this).attr(
														'value');
												var videoChatStatus;
												$
														.ajax({
															url : 'pullVideoChat.action',
															data : {
																sittingNo : convId
															},
															type : 'post',
															success : function(
																	data) {
																videoChatStatus = data.videoChat.status;
																console
																		.log(data.videoChat.status);
																console
																		.log('data.videoChat.status'
																				+ data.videoChat.status);
																videoChatStatus = data.videoChat.status;

																console
																		.log('videoChatStatus>>>>>>>>>>>>'
																				+ videoChatStatus);
																if (videoChatStatus == 'nocreated') {
																	create(convId);
																	//nextRTC.create(convId);
																	$
																			.ajax({
																				url : 'updateVideoChatToCreated',
																				data : {
																					sittingNo : convId
																				},
																				type : 'post'
																			});

																} else if (videoChatStatus == 'created') {
																	console
																			.log('createdStatus');
																	//nextRTC.join(convId);
																	join(convId);
																}
															}
														});

												//console.log('status>>>>>>>>>>>>>>' + videoChatStatus);
												/* if(videoChatStatus = 'nocreated'){
													nextRTC.create(convId);
													$.ajax({
														  url : 'updateVideoChatToCreated'
														, data : {
															sittingNo: convId
														}
														, type : 'post'
													})
													
												} else if(videoChatStatus = 'created'){
													nextRTC.join(convId);
												} */

												//console.log('>>>>>>>>>>>>>'+convId);
											});

							$('.close').click(function() {
								var sittingNo = $(this).attr('value');
								$.ajax({
									url : 'updateVideoChatToNocreated',
									data : {
										sittingNo : sittingNo
									},
									type : 'post'
								})
							});

						});

		function create(convId) {
			nextRTC.create(convId);
		}

		function join(convId) {
			console.log('join');
			nextRTC.join(convId);
		}

		var createConversation = function() {
			var convId = $('.convId').val();
			//console.log(nextRTC);
			nextRTC.create(convId);

			//console.log(nextRTC);
		};

		var joinConversation = function() {
			var convId = $('.convId').val();
			console.log(convId);
			nextRTC.join(convId);
		};

		function closeConversation() {
			console.log(nextRTC.signaling);
			nextRTC.signaling.close();
		}

		//wsURL : 'wss://examples.nextrtc.org/videochat/signaling',
		//wsURL : 'wss://203.233.196.64:8443/videochat/signaling',
		var nextRTC = null;
		NextRTC.onReady = function() {
			nextRTC = new NextRTC({
				wsURL : 'wss://examples.nextrtc.org/videochat/signaling',
				mediaConfig : {
					video : true,
					audio : true,
				},
				peerConfig : {
					'iceServers' : [ {
						url : "stun:stun.l.google.com:19302"
					} ]
				},
			});
			nextRTC.on('created', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				console.log('>>>>>>>>>>Created : ' + event.content);
				//alert('Room with id ' + event.content + ' has been created, share it with your friend to start videochat');
			});

			nextRTC.on('joined', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				console.log('>>>>>>>>>>Joined : ' + event.content);
				//alert('Member with id ' + event.from + ' joined conversation');
			});

			nextRTC.on('localStream', function(nextRTC, stream) {
				attachMediaStream($('#local')[0], stream.stream);
			});

			nextRTC.on('remoteStream', function(nextRTC, stream) {
				attachMediaStream($('#remote')[0], stream.stream);
			});

			nextRTC.on('left', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				alert(event.from + " left!");
			});

		};
	</script>

	<!-- 펫 등록 -->
	<script type="text/javascript" src="js/cloudVision.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#dogVaccineDiv').hide();
			$('#catVaccineDiv').hide();
			$('#etcVaccineDiv').hide();
			//$('#photoIdentificationResult').hide();
			$('#category').change(function() {
				var html = "";
				var category = $('#category option:selected').val();
				if (category == 'cat') {
					$('#catVaccineDiv').show();
					$('#dogVaccineDiv').hide();
					$('#etcVaccineDiv').hide();
				} else if (category == 'dog') {
					$('#dogVaccineDiv').show();
					$('#catVaccineDiv').hide();
					$('#etcVaccineDiv').hide();
				} else if (category == 'etc') {
					$('#dogVaccineDiv').hide();
					$('#catVaccineDiv').hide();
					$('#etcVaccineDiv').show();
				}

			})
		});
	</script>

	<!-- 쪽지 처리 -->
	<script type="text/javascript">
		$().ready(function() {

			/** 
				message-modal 창을 클릭시 메시지를 최초로 불러오는 부분
			 */
			$('#messageOpen').click(function() {
				var sittingNo = $(this).attr("value");
				var divId = "messageList" + sittingNo; //message-modal 창에서 메시지가 표시되는 div의 id
				getMessageList(sittingNo, divId);
				;
			})

			/** 
				messageList를 받아오는 부분
			 */
			function getMessageList(sittingNo, divId) {
				$.ajax({
					url : "viewMessageList",
					data : {
						sittingNo : sittingNo
					},
					type : "post",
					dataType : "JSON",
					success : function(data) {
						displayList(data, divId);

					}
				});
			}

			/**
				메시지를 표시
			 */
			function displayList(data, divId) {
				var id_get = "#" + divId;
				var messageList = data.messageList
				$(id_get).empty();
				$(messageList).each(function(i, item) {
					$(id_get).append(item.text);
				});
				updateToRead(divId); //메시지를 읽은 상태로 변경
			}

			/**
				쪽지를 보낸다.
			 */
			$('.message').click(function() {
				var buttonId = $(this).attr('id');

				//buttonId에서 sendMessage만큼을 잘라서 text에 붙여서 id로 만듬 
				var sittingNo = buttonId.slice(11);
				var divId = "messageList" + sittingNo;
				var textId = 'text' + sittingNo;

				var textMessage = $('#' + textId).val();
				$('#' + textId).val('');
				sendMessage(sittingNo, textMessage, divId);
			});

			function sendMessage(sittingNo, textMessage, divId) {
				$.ajax({
					url : "sendMessage",
					data : {
						sittingNo : sittingNo,
						text : textMessage
					},
					type : "post",
					dataType : "JSON",
					success : function(data) {
						alert(divId);
						displayList(data, divId);
					}
				});
			}

			/**
			 * 안 읽은 메시지를 확인함
			 */
			setInterval(function() {
				$('div[id^=messages-modal]').each(function(i, item) {
					var divId = $(this).attr('id')
					console.log(divId);
					var classStatus = $(this).attr('class');
					var sittingNo = divId.slice(14);
					if (classStatus == 'modal fade apartment-modal') {
						$.ajax({
							url : 'getNewCounter',
							data : {
								sittingNo : sittingNo
							},
							type : 'post',
							success : function(data) {
								var count = parseInt(data.newCount);
								if (count > 0) {
									//var a_value = 'a[value=' + sittingNo + ']';
									//$(a_value).after('new');
									console.log(count);
								} else {
									console.log(count);
								}
							}
						})
					}
				});

			}, 5000);

			function updateToRead(divId) {
				var sittingNo = divId.slice(11);
				$.ajax({
					url : 'updateToRead',
					data : {
						sittingNo : sittingNo
					},
					type : 'post'
				});
			}

		});

		function changePage() {
			var sel = $('#selbox').val();
			document.selForm.action = sel;
			document.selForm.submit();
		}

		function sittingNoFormSubmit() {
			document.sittingNoForm.submit();
		}
	</script>

</body>
</html>