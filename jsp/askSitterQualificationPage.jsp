<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>시터 자격신청 페이지</title>
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
	
	<!-- 달력 -->
	<link href="css/datepicker.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Fira+Sans:400,300,500&amp;subset=latin,cyrillic" rel="stylesheet" type="text/css">
	
	<%-- <link rel='stylesheet' href='calendar/lib/cupertino/jquery-ui.min.css' />
	<link href='calendar/fullcalendar.css' rel='stylesheet' />
	<link href='calendar/fullcalendar.print.css' rel='stylesheet' media='print' />

<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style> --%>
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
	
  		
    <section class="short-image no-padding agent">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-lg-12 short-image-title">
					<h5 class="subtitle-margin second-color">more us</h5>
					<h1 class="second-color">펫시터 신청</h1>
					<div class="short-title-separator"></div>
				</div>
			</div>
		</div>
    </section>
	
	<section class="section-light section-top-shadow no-bottom-padding">	
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					
					<div class="row">
						<div class="col-xs-12">
							<h5 class="subtitle-margin">Are you...?</h5>
							<h1>펫시터가 되시렵니까?<span class="special-color">.</span></h1>
							<div class="title-separator-primary"></div>
						</div>
					</div>
					
					<div class="dark-col row margin-top-60" >
<!-- form 보내기------------------------------------------------------------------------------------------ -->
					<form name="askSitterQualificationForm" action="askSitterQualification" method="post" enctype="multipart/form-data">
						<div class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 pull-right">	
						<!-- 얼굴이미지 첨부 -->	
							<div class="agent-photos">
								<img style="width: 360px;height: 443px;" src="images/agent3.jpg" id="agent-profile-photo" class="img-responsive" alt="" />
								<div class="change-photo">
									<i class="fa fa-pencil fa-lg"></i>
									<input type="file" name="upload" id="agent-photo" accept="image/*"/>
								</div>
								<input type="text" disabled="disabled" id="agent-file-name" class="main-input" />
							</div>
						<!-- 얼굴이미지 첨부 -->		
						</div>
						<select name="sitter.age" class="btn-group bootstrap-select col-xs-4" title="나이대를 선택해주세요">
							<option>10</option>
							<option>20</option>
							<option>30</option>
							<option>40</option>
							<option>50</option>
							<option>60</option>
						</select>
						<select name="sitter.sex" class="bootstrap-select col-xs-3" title="성별을 선택해주세요">
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
						<br>
						<br>
						<select name="sitter.availableSize" class="bootstrap-select col-xs-4" title="시팅가능한 펫사이즈" multiple="multiple">
							<option value="대">대</option>
							<option value="중">중</option>
							<option value="소">소</option>
						</select>
						<select name="sitter.availableCategory" class="btn-group bootstrap-select col-xs-3" title="시팅가능한 동물의 종류" multiple="multiple">
							<option>강아지</option>
							<option>고양이</option>
						</select>
						<br>
						<br>
						<select name="sitter.availableNumber" class="btn-group bootstrap-select col-xs-4" title="시팅가능한 동물은 몇마리입니까?">
							<option value="1">1마리</option>
							<option value="2">2마리</option>
							<option value="3">3마리</option>
						</select>
						<select name="sitter.pet" class="btn-group bootstrap-select col-xs-3" title="펫 유무">
							<option value="y">현재 함께 하고 있다</option>
							<option value="n">없음</option>
						</select>
						<br>
						<br>
						<select name="sitter.houseCategory" class="btn-group bootstrap-select col-xs-4" title="거주지 정보를 선택해주세요">
							<option value="주택">단독주택</option>
							<option value="아파트">아파트</option>
							<option value="오피스텔">오피스텔</option>
						</select>
						<select name="sitter.sittingLength" class="btn-group bootstrap-select col-xs-3" title="시팅 경험">
							<option value="1">처음</option>
							<option value="6">12개월 미만</option>
							<option value="12">12개월 이상</option>
						</select>
						<br>
						<br>
						<select name="sitter.license" class="btn-group bootstrap-select col-xs-7" title="소유하고 있는 자격증" multiple="multiple">
							<option>없음</option>
							<option>반려동물장례지도사</option>
							<option>반려동물관리사</option>
							<option>반려동물훈련교정사</option>
							<option>반려동물행동교정사</option>
							<option>미용사</option>
							<option>동물매개치료사</option>
						</select>
						<br>
						<br>
						<select name="options" class="btn-group bootstrap-select col-xs-4" title="제공가능 서비스" multiple="multiple">
							<option value="pick up">픽업</option>
							<option value="shower">목욕</option>
							<option value="jogging">산책</option>
						</select>
						<input name="sitter.account" type="text" class="input-short main-input center" placeholder="개인 계좌번호" />
						<br>
						<br>
						
	<!-- 달력 표시 ------------------------------------------------------------------------------- -->
						<!-- <div id='calendar'></div> -->
						<input type="text"
						   class="datepicker-here input-full main-input"
						   placeholder="시팅 불가능일자 표기"
						   data-language='en'
						   data-multiple-dates="31"
						   data-multiple-dates-separator=","
						   data-position='top left'
						   id="unavailableDate"
						   name="unavailableDate"
						/>
	<!-- 달력 표시 ------------------------------------------------------------------------------- -->					
						
						<textarea name="sitter.sitterComment" class="input-full agent-textarea main-input" placeholder="펫시팅 경험 사례 및 각오"></textarea>
								<div class="form-submit-cont">
									
									<div class="clearfix"></div>
								</div>
						<!-- 아파트 내부 사진올리기 -->
						<div class="col-xs-12 margin-top-60">
							<input id="file-upload" name="files" type="file" accept="image/*" multiple >
						</div>
						<!-- 아파트 내부 사진올리기 -->
						<div class="col-xs-12">
						<div class="center-button-cont margin-top-60">
							<a href="javascript:askSitterQualificationFormSubmit()" class="button-primary button-shadow">
								<span>JOIN Sitter!!</span>
								<div class="button-triangle"></div>
								<div class="button-triangle2"></div>
								<div class="button-icon"><i class="fa fa-lg fa-home"></i></div>
							</a>
						</div>
					</form><!-- ----------------------------------------------------------------------------/form -->
						<div class="col-xs-12">
						<div class="agent-social-bar margin-top-30">
							<div class="pull-left">
								
							</div>
							<div class="pull-left">
								
							</div>
							<div class="pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
						
					</div>
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

<script src='js/datepicker.js'></script>
<script src='js/i18n/datepicker.en.js'></script>
<script>
$().ready(function(){
	 function readURL(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
             reader.onload = function (e) {
             //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                 $('#agent-profile-photo').attr('src', e.target.result);
                 //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                 //(아래 코드에서 읽어들인 dataURL형식)
             }                   
             reader.readAsDataURL(input.files[0]);
             //File내용을 읽어 dataURL형식의 문자열로 저장
         }
     }//readURL()--
     
	 $("#agent-photo").change(function(){
         //alert(this.value); //선택한 이미지 경로 표시
         readURL(this);
     });
});
function askSitterQualificationFormSubmit(){
	document.askSitterQualificationForm.submit();
}
</script>

<%-- <script src='js/jquery-2.2.2.min.js'></script> --%>
<%-- 
<script src='calendar/lib/moment.min.js'></script>
<script src='calendar/fullcalendar.min.js'></script>
<script src='calendar/fullcalendar.js'></script>
<script>
$(document).ready(function() {
	//----------------------------------------현재날짜 불러오기 로직
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	} 
	var todayis = yyyy+'-'+mm+'-'+dd;
	var events = new Array();
	//---------------------------------------현재날짜 불러오기 로직
	//-----------------------------------------달력 뷰
	$('#calendar').fullCalendar({
		theme: true,
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultDate: todayis,
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: events
	});
	//-----------------------------------------달력 뷰
	//--------------------------------------------달력 클릭 이벤트
	$('.fc-day').on('click', function(){
		var calendarValue = $(this).attr('data-date');
		var title = 'canNot';
		
		review(title, calendarValue);
		
		/* events.forEach(function(item, i){
			alert(i + ',' + item.title + ', ' + item.start);
		}); */
	});
	
	function review(title, calendarValue){
		
		events.push({
			title: title,
			start: calendarValue
		});

		$('#calendar').fullCalendar('destroy');
		$('#calendar').fullCalendar({
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: todayis,
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: events
		});
	}
});

</script>
<!-- google maps initialization -->	
	<script type="text/javascript">
            google.maps.event.addDomListener(window, 'load', init);
			function init() {						
				mapInit(41.2693,-70.0874,"grid-map1","images/pin-house.png", false);
				mapInit(33.7544,-84.3857,"grid-map2","images/pin-apartment.png", false);
				mapInit(33.7337,-84.4443,"grid-map3","images/pin-land.png", false);
				mapInit(33.8588,-84.4858,"grid-map4","images/pin-commercial.png", false);
				mapInit(34.0254,-84.3560,"grid-map5","images/pin-apartment.png", false);
				mapInit(40.6128,-73.9976,"grid-map6","images/pin-house.png", false);
			}
	</script>
 --%>

	</body>
</html>