<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>완료된 마이시팅</title>
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
    <!-- star rating -->
    <link rel="stylesheet" type="text/css" href="css/star-rating-svg.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
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
								<h1>completed mySITTING<span class="special-color">.</span></h1>
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
<s:iterator value="sittingListFinished" var="sitting">
				<div class="col-xs-12 col-lg-6 blog-grid1-right-col" style="width: 310px;">
					<article class="blog-grid1-item zoom-cont" style="width: 800px;height: 300px;margin: 10px;border: 1px solid rgba(0, 0, 0, 0.2);">
						<figure class="" style=""><img style="width: 322px; height: 418px;" src="download.action?photoNo=${sitting.photoNo }" /></figure>
						<div class="blog-grid1-post-content" style="width: 450px;padding: 5px;top: 18px;">
						<div class="clearfix"></div>
							<div class="blog-grid1-topline">
								<div class="blog-grid1-author pull-left" style="font-size: x-large; font-weight: bold; width:40%;"><i class="fa fa-paw" aria-hidden="true"></i>${sitting.pet.name }</div>
								<div class="blog-grid1-date pull-right" style="font-size: large; width: 60%; text-align: left;"><i class="fa fa-calendar-o"></i>${sitting.startDate.substring(0,10) } ~ ${sitting.endDate.substring(0,10) }</div>
								<div class="clearfix"></div>
							</div>
							<a href="blog-right-sidebar.html" class="blog-grid1-title"><h4>시터ID : ${sitting.member.memberID}</h4></a>
							<div class="blog-grid1-separator"></div>
							
								<div class="list-offer-text" style="width: 310px; height: 200px;">
									<form action="ratingSitter.action" method="post" id="ratingForm<s:property value="sittingNo"/>">
									<textarea name="sitterRating.ratingComment" class="input-full agent-textarea main-input" placeholder="Your Comment"
											style="height: 160px; width: 380px; padding: 0px;"></textarea>
									<input type="hidden" name="sitterRating.rating" value="3.5" id="hiddenRating<s:property value="sittingNo"/>">
									<input type="hidden" name="sitterRating.sittingNo" value="<s:property value="sittingNo"/>">
									<input type="hidden" name="sitterRating.sitterNo" value="<s:property value="sitterNo"/>">
									</form>
								</div>

							<div align="center" style="margin-top: 30px; margin-left: 30px;">
								<a style="height: 42px; position: relative;" href="#" data-toggle="modal" class="blog-grid1-button">
									<!-- star rating -->
									<div class="rating<s:property value="sittingNo"/> my-rating-7" value="<s:property value="sittingNo"/>" style="padding-top: 5px;"></div>
								</a>
								<a style="height: 42px; position: relative;" href="#" data-toggle="modal" class="blog-grid1-button">
									<!-- star rating 숫자 -->
									 <div class="live-rating liveRating<s:property value="sittingNo"/>" style="width: 80px; padding-top: 10px; margin-left: 0px;"></div>
								</a>
								<a id="messageOpen"	href="#messages-modal<s:property value="sittingNo"/>"
								data-toggle="modal" class="blog-grid1-button ratingBt" style="position: relative; height: 42px; font-size: large; padding-top: 5px;" value="<s:property value="sittingNo"/>">
									<span>평가하기</span>
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
						
						
				</div>			<div class="col-xs-12 col-md-3 col-md-pull-9">
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
<!-- Messages modal -->
	<s:iterator value="sittingListProgress">
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
					<div id="messageList<s:property value="sittingNo"/>">
						
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

<!-- star rating -->
	<script src="js/jquery.star-rating-svg.js"></script>
	<script>function insertPetSubmit() {
		var photoCheck = $('#photoCheck').val();
		if (photoCheck == "false") {
			$('#rstTx').append(' <div class="alert alert-danger" style="width:500px"><a href="#" class="close" data-dismiss="alert" aria-label="close" style="position:relative; left:10px;">&times;</a>사진판정은 필수입니다. </div></div>');

			return;
		}
		$('#insertPetForm').submit();

	}
	$().ready(function(){
		
		
		 $('.my-rating-7').starRating({
				totalStars: 5,
			    initialRating: 3.5,
			    starSize: 25,
			    disableAfterRate: false,
			    onHover: function(currentIndex, currentRating, $el){
			      $('.live-rating').text(currentIndex);
			    },
			    onLeave: function(currentIndex, currentRating, $el){
			      $('.live-rating').text(currentRating);
			    }
		  })
		  
		  $('.ratingBt').click(function(){
			 var sittingNo = $(this).attr('value');
			 
			 var rating = $('.liveRating'+sittingNo).text();
			 
			 var hiddenRatingId = '#hiddenRating'+sittingNo;
			 
			 if(rating != ""){
				 $(hiddenRatingId).attr('value', rating); 
			 }
			 
			 
			var ratingFormId = '#ratingForm'+sittingNo;
			$(ratingFormId).submit();
		  });
		 

	});
	function changePage(){
		var sel = $('#selbox').val();
		document.selForm.action = sel;
		document.selForm.submit();
	}
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
	
	</body>
</html>