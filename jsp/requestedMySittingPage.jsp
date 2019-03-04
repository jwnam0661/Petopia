<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>신청한 마이시팅 페이지</title>
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
								<h5 class="subtitle-margin">petopia</h5>
								<h1>
									requested MySITTING<span class="special-color">.</span>
								</h1>
							</div>
							<div class="col-xs-12 col-lg-5">											
								<div class="order-by-container">
									<form name="selForm">
									<select name="sort" class="bootstrap-select" title="리스트 선택:" onchange="changePage()" id="selbox">
										<option value="newMyPage.action">진행 리스트</option>
										<option value="requestedMySittingPage.action">신청 리스트</option>
										<option value="approvedMySittingPage.action">수락된 리스트</option>
										<option value="completedMySittingPage.action">완료된 리스트</option>
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
<s:iterator value="sittingListRequested" var="sitting">
				<div class="col-xs-12 col-lg-6 blog-grid1-right-col" style="width: 310px;">
					<article class="blog-grid1-item zoom-cont" style="width: 800px;height: 300px;margin: 10px;border: 1px solid rgba(0, 0, 0, 0.2);">
						<figure class="" style=""><img style="width: 322px;height: 418px;" src="download.action?photoNo=${sitting.photoNo }" /></figure>
						<div class="blog-grid1-post-content" style="width: 450px;padding: 5px;top: 18px;">
						<div class="clearfix"></div>
							<div class="blog-grid1-topline">
								<div class="blog-grid1-author pull-left" style="font-size: x-large; font-weight: bold; width:40%;"><i class="fa fa-paw" aria-hidden="true"></i>${sitting.pet.name }</div>
								<div class="blog-grid1-date pull-right" style="font-size: large; width: 60%; text-align: left;"><i class="fa fa-calendar-o"></i>${sitting.startDate.substring(0,10) } ~ ${sitting.endDate.substring(0,10) }</div>
								<div class="clearfix"></div>
							</div>
							<a href="blog-right-sidebar.html" class="blog-grid1-title"><h4>시터ID :  ${sitting.member.memberID}</h4></a>
							<div class="blog-grid1-separator"></div>
							<p style="margin: 30px; font-size: medium; height: 220px;">

								시터 주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.member.address1 }</br>				
								시터 성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;
								<s:if test='#sitting.sitter.sex == "M"'>
										♂
									</s:if>
									<s:if test='#sitting.sitter.sex == "F"'>
										♀
									</s:if>
								</br>
								
								시터 나이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.sitter.age } 대</br>
								시팅 펫 종류 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.sitter.availableCategory}</br>
								시팅 펫 크기 &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.sitter.availableSize}</br>
								팻 양육 경력&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.sitter.sittingLength }</br>
								
								현재 펫 유무&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
									<s:if test='#sitting.sitter.pet == "y"'>
										있음
									</s:if>
									<s:if test='#sitting.sitter.pet == "n"'>
										없음
									</s:if>	
								</br>
								선택한 서비스 : &nbsp;&nbsp;
									<s:if test='#sitting.option1 == "y"'>
										픽업
									</s:if>
									<s:if test='#sitting.option2 == "y"'>
										산책
									</s:if>
									<s:if test='#sitting.option3 == "y"'>
										목욕
									</s:if>
									<s:if test='#sitting.option1 == "n" and #sitting.option2 == "n" #sitting.option3 == "n"'>
										없음
									</s:if>
								</br>
								총 시팅 가격&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${sitting.price } <i class="fa fa-krw" aria-hidden="true"></i></br>
							</p>
							<div align="center">
							<a id="messageOpen"	href="#messages-modal<s:property value="sittingNo"/>"
							data-toggle="modal" class="blog-grid1-button" style="position: relative;" value="<s:property value="sittingNo"/>">
								<span>대화창</span><span id="messageIcon<s:property value="sittingNo"/>" ></span>
								<div class="blog-grid1-triangle"></div>
							</a>
							<a href="blog-right-sidebar.html" class="blog-grid1-button" style="position: relative;">
								<span>신청취소</span>
								<div class="blog-grid1-triangle"></div>
							</a>
							</div>
						</div>
					</article>
				</div>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				
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
							<div id="catVaccineDiv">
								<select id="catVaccine" title="접종한 백신종류" name="vaccine"
									class="bootstrap-select" multiple data-actions-box="true"
									hidden="hidden">
									<option value="vaccine1">종합 7종 백신</option>
									<option value="vaccine2">코로나 장염 예방접종</option>
									<option value="vaccine3">켄넬코즈 예방접종</option>
									<option value="vaccine4">광견병 예방 접종</option>
								</select>
							</div>
							<div id="dogVaccineDiv">
								<select id="dogVaccine" title="접종한 백신종류" name="vaccine"
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
	<!-- /.modal-content -->
	
	<!-- /.modal-dialog -->
	
	<!-- /.modal -->
	<!-- insertPetModal -->
	
	<!-- Messages modal -->
	<s:iterator value="sittingListRequested">
		<div class="modal fade apartment-modal"	id="messages-modal<s:property value="sittingNo"/>">
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
						<input type="hidden" class="sssss" value="${member.memberID }">
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
		function displayList(data, divId){
			var id_get = "#"+divId;
			var messageList = data.messageList;
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
						displayList(data, divId);
					}
				});
			}

			/**
			 * 안 읽은 메시지를 확인함
			 */
			var messageIconHtmlOn = '<i class="fa fa-comments fa-2x" aria-hidden="true" style="color:red;"></i>'
			var messageIconHtmlOff = '';
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
								var messageIconId = '#messageIcon'+sittingNo;
								console.log(messageIconId);
								if (count > 0) {
									//var a_value = 'a[value=' + sittingNo + ']';
									//$(a_value).after('new');
									$(messageIconId).html(messageIconHtmlOn);
									
									console.log(count);
								} else {
									$(messageIconId).html(messageIconHtmlOff);
									console.log(count);
								}
							}
						})
					}
				});

			}, 5000);
			
			setInterval(function(){
				$('div[id^=messages-modal]').each(function(i, item){
					var divId = $(this).attr('id')
					console.log(divId);
					var classStatus = $(this).attr('class');
					var sittingNo = divId.slice(14);
					var messageDivId = "messageList"+sittingNo;
					console.log('2500 >>>>>>>>' + sittingNo);
					if(classStatus == 'modal fade apartment-modal message in'){
						getMessageList(sittingNo, messageDivId);
					} else {
						console.log('class status' + classStatus)
					}
				});
				
			}, 2500);

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
</html>