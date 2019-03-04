<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>관리자 메인페이지</title>
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
								<span class="top-icon-circle pull-left"> <i	class="fa fa-map-marker"></i>
								</span> <span class="top-bar-text">서울특별시 강남구 영동대로 513 코엑스몰 4층
									ICT센터</span>
							</div>
						</div>
						<div class="col-xs-7 col-sm-4">
							<s:if test="#session.loginID ==null">
								<div class="top-social-last top-dark pull-right" data-toggle="tooltip" data-placement="bottom" title="Login/Register">
									<a class="top-icon-circle" href="#login-modal" data-toggle="modal"> <i class="fa fa-user"></i></a>
								</div>
								<div class="top-social pull-right">
									<a class="top-icon-circle" href="#register-modal" data-toggle="modal"> <i class="fa fa-user-plus"> </i></a>
								</div>
							</s:if>
							<s:else>
								<div class="top-social-last top-dark pull-right">
									<a class="top-icon-circle" href="logOut.action"> <i	class="fa fa-sign-in"></i>
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
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span class="icon-bar icon-bar1"></span> <span class="icon-bar icon-bar2"></span> <span class="icon-bar icon-bar3"></span>
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
						<h1 class="second-color">admin page</h1>
						<div class="short-title-separator"></div>
					</div>
				</div>
			</div>
		</section>

	<section class="section-light section-top-shadow">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12 col-lg-6">
								<h5 class="subtitle-margin">request: ALL</h5>
								<h1>sitter resume list<span class="special-color">.</span></h1>
							</div>
							<div class="col-xs-12 col-lg-6">											
							</div>							
							<div class="col-xs-12">
								<div class="title-separator-primary"></div>
							</div>
						</div>
						
						<div class="row list-agency-row">
							<div class="col-xs-12">
							
		<!-- iterator 시작 -------------------------------------------------------------------- -->	
							<s:iterator value="sitterList" var="list">
								<div class="" style="width: 1100px;height: 227px;border: 1px solid rgba(0, 0, 0, 0.2);">
									<div class="list-agency-left">
										<img style="width: 266px;height: 225px;" src="download.action?photoNo=${list.photoSearch.photoNo }" alt="" />
										<%-- <div class="list-agency-description">
											<div class="team-desc-line">
												<span class="team-icon-circle">
													<i class="fa fa-phone"></i>
												</span>
												<span>(0)-123-456-789</span>
											</div>
											<div class="team-desc-line">
												<span class="team-icon-circle">
													<i class="fa fa-phone"></i>
												</span>
												<span>(0)-987-654-321</span>
											</div>
											<div class="team-desc-line">
												<span class="team-icon-circle">
													<i class="fa fa-envelope fa-sm"></i>
												</span>
												<span><a href="#">apartment@domain.tld</a></span>
											</div>
											<div class="team-social-cont">
												<div class="team-social">
													<a class="team-icon-circle" href="#">
														<i class="fa fa-facebook"></i>
													</a>
												</div>
												<div class="team-social">
													<a class="team-icon-circle" href="#">
														<i class="fa fa-twitter"></i>
													</a>
												</div>
												<div class="team-social">
													<a class="team-icon-circle" href="#">
														<i class="fa fa-google-plus"></i>
													</a>
												</div>
												<div class="team-social">
													<a class="team-icon-circle" href="#">
														<i class="fa fa-skype"></i>
													</a>
												</div>
											</div>
										</div>	 --%>								
									</div>
									
									<a class="list-agency-right-large" href="#admin-Modal${list.memberNo }" data-toggle="modal">
										<div class="list-agency-text">
											<h3 class="list-agency-title">${list.memberSearch.name }</h3>
											<i class="fa fa-hand-o-down fa-3" aria-hidden="true"></i>
											<span class="list-agency-address">${list.memberSearch.address1 }&nbsp;${list.memberSearch.address2 }</span>
											<div style="width: 600px;" class="list-agency-separator"></div>
											<b><font size="6">${list.sitterComment }</font></b>
										</div>
									</a>
									<!-- <div class="small-triangle"></div>
									<div class="small-triangle2"></div>
									<a class="small-icon" href="agency-details-right-sidebar.html"><i class="jfont fa-2x">&#xe804;</i></a> -->
								</div>
								<br>
							</s:iterator>	
		<!-- iterator 끝 -------------------------------------------------------------------- -->					
							
							</div>
						</div>
						<div class="offer-pagination margin-top-15">
							<a href="#" class="prev"><i class="jfont">&#xe800;</i></a><a class="active">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#" class="next"><i class="jfont">&#xe802;</i></a>
							<div class="clearfix"></div>
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

<!-- admin-Modal -->
<s:iterator value="sitterList" var="list">
	<div class="modal fade apartment-modal" id="admin-Modal${list.memberNo }">
		<div class="modal-dialog"
			style="width: 600px; font-family: 'Jeju Gothic', serif; font-size: 18px; position: relative; position: relative; top: -120px;">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title">
						<span style="font-family: 'Hanna', serif; font-size: 35px;">SITTER DETAIL INFORMATION<span
							class="special-color"></span></span>
					</div>
					
						
							<div class="labelled-input" style="width: 850px;">
								<label for="first-name" style="width: 90px;">이름</label><input readonly="readonly" id="first-name" name="first-name" type="text" class="main-input" style="text-align: center; width: 430px;" placeholder="" value="${list.memberSearch.name }" />
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input" style="width: 850px;">
								<label for="sex" style="width: 90px;">성별</label><input readonly="readonly" id="sex" name="" type="text" class="main-input" style="text-align: center; width: 190px;font-size: 25px;font: bold;" value="${list.sex}" />
								<label for="age" style="width: 90px;">나이</label><input readonly="readonly" id="" name="" type="text" class="main-input" style="text-align: center; width: 150px;" value="${list.age}대"/>
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input" style="width: 850px;">
								<label for="availableCategory" style="width: 90px;">종류</label><input style="text-align: center; width: 190px;" readonly="readonly" id="" name="" type="text" class="main-input" placeholder="" value="${list.availableCategory}"/>
								<label for="availableSize" style="width: 90px;">크기</label><input style="text-align: center; width: 150px;" readonly="readonly" id="" name="" type="text" class="main-input" placeholder="" value="${list.availableSize}"/>
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input last" style="width: 850px;">
								<label for="qualification" style="width: 100px;">자격증</label><input style="text-align: center; width: 440px;" readonly="readonly" id="" name="" type="text" class="main-input" placeholder="" value="${list.license}"/>
								<div class="clearfix"></div>
							</div>
							<div class="labelled-input last" style="width: 540px;">
								<textarea class="input-full main-input property-textarea" rows="" cols="">${list.sitterComment }</textarea>
							</div>
					
					
				</div>
				<table id="result-table" class="table table-striped">
					<thead></thead>
					<tbody></tbody>
				</table>
				<canvas id="canvas" width="0" height="0"></canvas>
			</div>
				
				<form class="sitterNoForm" name="" action="approveSitter" method="POST" id="sitterNoForm">
					<input type="hidden" name="sitterNo" value="${list.memberNo }">
				</form>
				
				<a href="#" id="test"  onclick=""
					style="width: 150px; position: relative; border-radius: 5px; left: 255px; top: -70px;"
					class="button-primary button-shadow button-full"><span>Grant</span>
					<div class="button-triangle"></div>
					<div class="button-triangle2"></div>
					<div class="button-icon">
						<i class="fa fa-paw"></i>
					</div> 
				</a>
				
				<a href="#" onclick=""
					style="width: 150px; position: relative; border-radius: 5px; left: 260px; top: -70px;"
					class="button-alternative button-shadow button-full"><span>Refuse</span>
					<div class="button-triangle"></div>
					<div class="button-triangle2"></div>
					<div class="button-icon">
						<i class="fa fa-paw"></i>
					</div> 
				</a>
			<div id="rstTx" style="position: relative; top:-55px;"></div>
		</div>
	</div>
	<!-- /.modal -->
	<!-- insertPetModal -->
</s:iterator>

<!-- jQuery  -->
    <script type="text/javascript" src="js/jQuery/jquery.min.js"></script>
	<script type="text/javascript" src="js/jQuery/jquery-ui.min.js"></script>
	<script>
	$("#test").click(function(){
		$("#sitterNoForm").submit();
	})
	</script>
	
<!-- Bootstrap-->
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>

<!-- Google Maps -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfDCV5hXiPamCIT8_vwGXuzimLQ9MF76g&amp;sensor=false&amp;libraries=places"></script>
	
<!-- plugins script -->
	<script type="text/javascript" src="js/plugins.js"></script>

<!-- template scripts -->
	<script type="text/javascript" src="mail/validate.js"></script>
    <script type="text/javascript" src="js/apartment.js"></script>

	</body>
</html>