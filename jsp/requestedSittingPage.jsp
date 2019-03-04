<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>신청받은 시터페이지</title>
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
	<!-- 글자체 -->
<link rel='stylesheet' type='text/css'
	href='https://fonts.googleapis.com/earlyaccess/nanumgothic.css'>
<link rel='stylesheet' type='text/css'
	href='https://fonts.googleapis.com/earlyaccess/hanna.css'>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/earlyaccess/jejugothic.css">
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
					<h1 class="second-color">sitter page</h1>
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
								<h5 class="subtitle-margin">sitter page</h5>
								<h1>REQUESTED SITTING<span class="special-color">.</span></h1>
							</div>
							<div class="col-xs-12 col-lg-5">											
								<div class="order-by-container">
									<form name="selForm">
									<select name="sort" class="bootstrap-select" title="리스트 선택:" onchange="changePage()" id="selbox">
										<option value="progressSittingPage.action">진행 리스트</option>
										<option value="requestedSittingPage.action">신청 리스트</option>
										<option value="approvedSittingPage.action">수락한 리스트</option>
										<!-- <option value="completedSittingPage.action">완료된 리스트</option> -->
									</select>
									</form>
								</div>	
							</div>							
							<div class="col-xs-12">
								<div class="title-separator-primary"></div>
							</div>
						</div>
						<div class="row list-offer-row" style="margin-top: 0px;">
							<div class="col-xs-12">

				<!-- 리스트 이터레이터 시작 -->
				<s:iterator value="requestedSitting" var="sitting">
				<div class="team-member-cont" >
					<div class="team-member wow fadeInLeft" style="width: 600px; height: 350px; margin: 50px">
						<div class="team-photo">
							<img src="download.action?photoNo=${sitting.photoNo }" style="width: 600px; height: 350px"/>
							<div class="big-triangle"></div>
							<div class="big-triangle2"></div>
							<!-- <a class="big-icon big-icon-plus" href="agent-right-sidebar.html"><i class="jfont">&#xe804;</i></a> -->
							<div class="team-description"> 
								<div>

									<p class="team-text">
												<div class="col-xs-6 col-sm-4" style="width: 70px">
														<ul class="details-ticks">
															<li>
																<s:if test='#sitting.option1 == "y"'>
																	<div class="team-desc-line">
																		<img src="images/parking-icon.png" style="height: 50px; width: 50px;" />
																	</div>
																	<li>&nbsp;</li>
																</s:if>
															</li>
															<li>
																<s:if test='#sitting.option2 == "y"'>
																	<div class="team-desc-line">
																		<img src="images/walk-icon.png" style="height: 50px; width: 50px;" />
																	</div>
																	<li>&nbsp;</li>
																</s:if>
															</li>
															<li>
																<s:if test='#sitting.option3 == "y"'>
																	<div class="team-desc-line">
																		<img src="images/bathrooms-icon.png" style="height: 50px; width: 50px;"/>
																	</div>
																</s:if>
															</li>
														</ul>
													</div>
									
												<div class="col-xs-6 col-sm-4" style="width: 250px">
														<ul class="details-ticks" style="font-size: medium;">
															<li>펫 종류&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.category }</li>
															<li>펫 품종&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.species }</li>
															<li>펫 크기&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.petSize }</li>
															<li>성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.sex }</li>
															<li>중성화&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.neutralization }</li>
															<li>성격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.petComment }</li>
															<li>vaccine1&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.vaccine1 }</li>
															<li>vaccine2&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.vaccine2 }</li>
															<li>vaccine3&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.vaccine3 }</li>
															<li>vaccine4&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.vaccine4 }</li>
														</ul>
												</div>
												
												<div class="col-xs-6 col-sm-4" style="width: 150px">
													<ul class="details-ticks" style="margin-right: 100px">
														<li>
															<div class="profile-list-info hidden-xs">
																<a style="height: 42px; width: 150px;" href="responseSitting.action?response=approved&sittingNo=<s:property value="sittingNo"/>" data-toggle="modal" class="button-alternative button-shadow button-full">
																	<span><b>시팅 수락</b></span>
																	<div class="button-triangle"></div>
																	<div class="button-triangle2"></div>
																</a>
															</div>
														</li>
														<li>&nbsp;</li>
														<li>&nbsp;</li>
														<li>
																<div class="profile-list-info hidden-xs">
																<a style="height: 42px; width: 150px;" href="responseSitting.action?response=refused&sittingNo=<s:property value="sittingNo"/>" data-toggle="modal" class="button-alternative button-shadow button-full">
																	<span><b>시팅 거절</b></span>
																	<div class="button-triangle"></div>
																	<div class="button-triangle2"></div>
																</a>
															</div>
														</li>
														<li>&nbsp;</li>
														<li>&nbsp;</li>
														<li>
																<div class="profile-list-info hidden-xs">
																<a style="height: 42px; width: 150px;" href="#messages-modal<s:property value="sittingNo"/>" data-toggle="modal" class="button-alternative button-shadow button-full messageOpen" value="<s:property value="sittingNo"/>" >
																	<span><b>대화창</b></span>
																	<div class="button-triangle"></div>
																	<div class="button-triangle2"></div>
																</a>
															</div>
														</li>
													</ul>
												</div>
												
													
									</p>

							  </div>
							</div>
						</div>
						<div class="team-name">
							<h4 style="margin: 5px">${sitting.pet.name }</h4>
							<h3>${sitting.startDate.substring(0,10) } ~ ${sitting.endDate.substring(0,10) }<span class="special-color">.</span></h3>
						</div>
					</div>
				</div>
				</s:iterator>
			<!-- </div> -->
			
<!-- 리스트 이터레이터 시작--------------------------------------------------------------------- -->

							
								<%-- <s:iterator value="requestedSitting" var="sitting">
								<div class="list-offer">
									<div class="list-offer-left">
										<div class="list-offer-front">
									<!-- 프론트 사진 -->
											<div class="list-offer-photo">
												<img src="download.action?photoNo=${sitting.photoNo }" style="widows: 262px; height: 177px;"/>
												<div class="type-container">
													<div class="estate-type">${sitting.pet.category }</div>
													<div class="transaction-type">${sitting.pet.species }</div>
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
											<div id="list-map1" class="list-offer-map"></div>
										</div>
										
									</div>
									<div class="list-offer-right">
										<div class="list-offer-text" style="width: 585px;">
											<i class="fa fa-map-marker list-offer-localization"></i>
											<div class="list-offer-h4">
												<a href="estate-details-right-sidebar.html">
													<h4 class="list-offer-title">${sitting.startDate.substring(0,10) }&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;${sitting.endDate.substring(0,10) }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.name }</h4>
												</a>
											</div>
											<div class="clearfix"></div>
													<div class="col-xs-6 col-sm-4" style="width: 250px">
														<ul class="details-ticks">
															<li><i class="jfont">&#xe815;</i>SEX&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.sex }</li>
															<li><i class="jfont">&#xe815;</i>중성화&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.neutralization }</li>
															<li><i class="jfont">&#xe815;</i>PET SIZE&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.pet.petSize }</li>
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
											<a style="height: 42px;" href="responseSitting.action?response=approved&sittingNo=<s:property value="sittingNo"/>" data-toggle="modal" class="button-primary button-shadow button-full approve" value="<s:property value="sittingNo"/>">
												<span>시팅 수락</span>
												<div class="button-triangle"></div>
												<div class="button-triangle2"></div>
											</a>
											</div>	
											<a href="#" class="profile-list-delete" title="delete offer">
												<i class="fa fa-trash fa-lg"></i>
											</a>	
											<a href="#" class="profile-list-edit" title="delete offer">
												<i class="fa fa-pencil fa-lg"></i>
											</a>	
											<div class="profile-list-info hidden-xs">
											<a style="height: 42px;" href="#messages-modal<s:property value="sittingNo"/>" data-toggle="modal" class="button-primary button-shadow button-full messageOpen" value="<s:property value="sittingNo"/>">
												<span><b>대화창</b></span>
												<div class="button-triangle"></div>
												<div class="button-triangle2"></div>
											</a>
											</div>
											<div class="profile-list-info hidden-xs">
											<a style="height: 42px;" href="responseSitting.action?response=refused&sittingNo=<s:property value="sittingNo"/>" data-toggle="modal" class="button-alternative button-shadow button-full">
												<span><b>시팅 거절</b></span>
												<div class="button-triangle"></div>
												<div class="button-triangle2"></div>
											</a>
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
								</s:iterator> --%>
<!-- 리스트 이터레이터 끝-------------------------------------------------------------------------- -->								
								
							</div>
						</div>
						
						<!-- <div class="offer-pagination margin-top-30">
							<a href="#" class="prev"><i class="jfont">&#xe800;</i></a><a class="active">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#" class="next"><i class="jfont">&#xe802;</i></a>
							<div class="clearfix"></div>
						</div> -->
				</div>			
				<div class="col-xs-12 col-md-3 col-md-pull-9">
					<div class="sidebar-left">
						<h3 class="sidebar-title">sitter page<span class="special-color">.</span></h3>
						<div class="title-separator-primary"></div>
						
						<div class="profile-info margin-top-60">
							<div class="profile-info-title negative-margin"  align="center">${member.name }시터님 환영합니다♥</div>
							<s:if test="sitter.photoSearch.photoNo!=null">
							<img style="width: 200px;" src="download.action?photoNo=${sitter.photoSearch.photoNo }" class="pull-left" /></s:if>
							
							<s:else>
							<img style="width: 200px" src="images/memberProfile.png" id="agent-profile-photo" class="pull-left" />
							</s:else>
							<div class="clearfix"></div>
							<div class="center-button-cont margin-top-30">
							<a href="#insertPet-modal" data-toggle="modal" class="button-alternative button-shadow button-full">
								<span>시터 정산 내역</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-th-list"></i></div>
							</a>
						</div>
						<div class="center-button-cont margin-top-15">
							<a href="askSitterQualificationPage" class="button-primary button-shadow button-full">
								<span>시터 해제 신청</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-user"></i></div>
							</a>
						</div>
						</div>
						<%-- <div class="center-button-cont margin-top-30">
							<a href="my-offers.html" class="button-primary button-shadow button-full">
								<span>PROGRESS SITTING</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-th-list"></i></div>
							</a>
						</div>
						<div class="center-button-cont margin-top-15">
							<a href="my-profile.html" class="button-alternative button-shadow button-full">
								<span>REQUESTED SITTING</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-user"></i></div>
							</a>
						</div>
						<div class="center-button-cont margin-top-15">
							<a href="submit-property.html" class="button-primary button-shadow button-full">
								<span>APPROVED SITTING</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="jfont fa-lg">&#xe804;</i></div>
							</a>
						</div> --%>
					
						
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
	
		<!-- Messages modal -->
	<s:iterator value="requestedSitting">
	<div class="modal fade apartment-modal" id="messages-modal<s:property value="sittingNo"/>">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<h1>
							쪽지
						</h1>
						<div class="short-title-separator"></div>
					</div>
					<p class="negative-margin forgot-info">
						Instert your account email address.
					</p>
					<input name="message.text" type="text" class="input-full main-input" placeholder="내용" id="text<s:property value="sittingNo"/>"/>
					<span class="button-primary button-shadow button-full message" id="sendMessage<s:property value="sittingNo"/>" > <span>쪽지 보내기</span>
						<div class="button-triangle"></div>
						<div class="button-triangle2"></div>
						<div class="button-icon">
							<i class="fa fa-user"></i>
						</div>
					</span>
					<!-- 쪽지 내용 -->
					<div class="dark-col" id="messageList<s:property value="sittingNo"/>">
						
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	</s:iterator>
	<!-- /.modal -->

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

<!-- google maps initialization -->	
	<script type="text/javascript">
            google.maps.event.addDomListener(window, 'load', init);
			function init() {		
				mapInit(41.2693,-70.0874,"list-map1","images/pin-house.png", false);
				mapInit(33.7544,-84.3857,"list-map2","images/pin-apartment.png", false);
				mapInit(33.7337,-84.4443,"list-map3","images/pin-land.png", false);
				mapInit(33.8588,-84.4858,"list-map4","images/pin-commercial.png", false);
				mapInit(34.0254,-84.3560,"list-map5","images/pin-apartment.png", false);
				mapInit(40.6128,-73.9976,"list-map6","images/pin-house.png", false);
				mapInit(40.6128,-73.7903,"list-map7","images/pin-house.png", false);
			}
	</script>
	
	<!-- 메시지 처리 -->
	<script type="text/javascript">
		$().ready(function(){
			
			/** 
				messages-modal 창을 클릭시 메시지를 최초로 불러오는 부분
			*/ 
			$('.messageOpen').click(function(){
				var sittingNo = $(this).attr("value");
				var divId = "messageList"+sittingNo; //message-modal 창에서 메시지가 표시되는 div의 id
				getMessageList(sittingNo, divId);
				
			})
			
			/** 
				messageList를 받아오는 부분
			*/
			function getMessageList(sittingNo, divId){
				$.ajax({
					url: "viewMessageList"
					, data: {
						sittingNo: sittingNo
					}
					, type: "post"
					, dataType: "JSON"
					, success: function(data){
						displayList(data, divId);
						
					}
				});
			}
			
			/**
				메시지를 표시
			*/
			function displayList(data, divId){
				var id_get = "#"+divId;
				var messageList = data.messageList
				var memberNo = data.memberNo;
				var html = '';
				$(id_get).empty();
				$(messageList).each(function(i, item){
					if(memberNo != item.sendNo){
						html = '<p><font size="3"><b>'+item.sendNo+'</b>&nbsp;&nbsp;'+item.text + "</font></p>";	
					}else{
						html = '<p align="right"><font size="3"><b>'+item.sendNo+'</b>&nbsp;&nbsp;'+item.text + "</font></p>";
					}
					$(id_get).append(html);
				});
				updateToRead(divId); //메시지를 읽은 상태로 변경
			}
			
			/**
				쪽지를 보낸다.
			*/
			$('.message').click(function(){
				var buttonId = $(this).attr('id');
				
				//buttonId에서 sendMessage만큼을 잘라서 text에 붙여서 id로 만듬 
				var sittingNo = buttonId.slice(11);
				var divId = "messageList"+sittingNo;
				var textId = 'text'+sittingNo;
				
				var textMessage = $('#'+textId).val();
				$('#'+textId).val('');
				sendMessage(sittingNo, textMessage, divId);
			});
			
			function sendMessage(sittingNo, textMessage, divId){
				$.ajax({
					url: "sendMessage"
					, data: {
						sittingNo: sittingNo,
						text: textMessage
					}
					, type: "post"
					, dataType: "JSON"
					, success: function(data){
						//alert(divId);
						displayList(data, divId);
					}
				});
			}
			
			/**
			* 안 읽은 메시지를 확인함
			*/
			setInterval(function(){
				$('div[id^=messages-modal]').each(function(i, item){
					var divId = $(this).attr('id')
					console.log(divId);
					var classStatus = $(this).attr('class');
					var sittingNo = divId.slice(14);
					if(classStatus == 'modal fade apartment-modal'){
						$.ajax({
							  url: 'getNewCounter'
							, data: {
								sittingNo: sittingNo
							}
							, type: 'post'
							, success: function(data){
								var count = parseInt(data.newCount);
								if(count > 0){
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
			
			function updateToRead(divId){
				var sittingNo = divId.slice(11);
				$.ajax({
					  url : 'updateToRead'
					, data : {
						sittingNo : sittingNo 
					}
					, type : 'post'
				});
			}
			
		});
		function changePage(){
			var sel = $('#selbox').val();
			document.selForm.action = sel;
			document.selForm.submit();
		}
	</script>
	
	</body>
</html>