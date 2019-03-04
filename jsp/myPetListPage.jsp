<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>마이 펫리스트</title>
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
								<h1>my pet list<span class="special-color">.</span></h1>
							</div>
							<div class="col-xs-12 col-lg-5">											
								<div class="order-by-container">
								</div>	
							</div>							
							<div class="col-xs-12">
								<div class="title-separator-primary"></div>
							</div>
						</div>
						<div class="row list-offer-row">
							<div class="col-xs-12">
							
							
<!-- 리스트 이터레이터 시작--------------------------------------------------------------------- -->							
								<s:iterator value="petList" var="pet">
								<div class="team-member-cont" >
					<div class="team-member wow fadeInLeft" style="width: 600px; height: 350px; margin: 50px">
						<div class="team-photo">
							<img src="download.action?photoNo=${pet.photoNo }" style="width: 600px; height: 350px"/>
							<div class="big-triangle"></div>
							<div class="big-triangle2"></div>
							<div class="team-description"> 
								<div>

									<p class="team-text">
												<div class="col-xs-6 col-sm-4" style="width: 150px;">
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
									
												<div class="col-xs-6 col-sm-4" style="width: 150px">
													<ul class="details-ticks" style="margin-right: 400px;">
														<li>
																<div class="profile-list-info hidden-xs" style="position:relative; top:120px;">
																<a style="font-size:25px; height: 50px; width: 200px; background-color:#ffb3e6;" href="#messages-modal<s:property value="sittingNo"/>" data-toggle="modal" class="button-alternative button-shadow button-full messageOpen" value="<s:property value="sittingNo"/>">
																	<span><b>펫정보 수정</b></span>
																	<div class="button-triangle"  ></div>
																	<div class="button-triangle2" ></div>
																</a>
															</div>
														</li>
														<li>
															<!-- 신청 취소 메소드가 없음. 만들어야하나?? -->
															<div class="profile-list-info hidden-xs">
																<a style="font-size:25px;height: 50px; width: 200px; background-color:#00ace6;" href="responseSitting.action?response=refused&sittingNo=<s:property value="sittingNo"/>" data-toggle="modal" class="button-alternative button-shadow button-full">
																	<span><b>펫 삭제</b></span>
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
							<!-- <h5></h5> -->
							<h3>${pet.name}<span class="special-color">♥</span></h3>

						</div>
					</div>
				</div>
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
							<s:if test='%{sitter != null}'>
								<img style="width: 200px;" src="download.action?photoNo=${sitter.photoSearch.photoNo }" class="pull-left" />
								<div class="profile-info-title negative-margin"  align="center">${member.name }님 환영합니다♥</div>
								
							</s:if>
							<s:else>
								<img style="width: 200px;" src="images/memberProfile.png" id="agent-profile-photo" class="pull-left" />
								<div class="profile-info-title negative-margin" align="center">
									${member.name }님 환영합니다♥<br/><br/>
									시터가 되고 싶으시면<br/>
									시터등록를 눌러주세요.
								</div>
								
							</s:else>
							<br>
							<%-- <div class="profile-info-text pull-left">
								<p class="">Email&nbsp;:&nbsp;&nbsp;${member.email }</p>
								<p class="">Phone&nbsp;:&nbsp;&nbsp;${member.phone }</p>
								<p class="">Address&nbsp;:&nbsp;&nbsp;${member.address1 }</p>
								
								<a href="#" class="logout-link margin-top-30"><i class="fa fa-lg fa-sign-out"></i>Logout</a>
							</div> --%>
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

<!-- insertPet Modal -->
	<div class="modal fade apartment-modal" id="insertPet-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<div class="modal-title">
						<h1>펫 등록<span class="special-color">.</span></h1>
						<div class="short-title-separator"></div>
					</div>
				<form action="insertPet" method="POST" id="insertPetForm" enctype="multipart/form-data">
					<input type="text" id="name" name="pet.name" class="input-full main-input" placeholder="펫 이름" />
					<select id="category" name="pet.category" class="bootstrap-select">
      					<option value="needSelect">펫 종류 선택</option>
      					<option value="cat">고양이</option>
      					<option value="dog">강아지</option>
      				</select>
      				
					<input type="text" id="species" name="pet.species" class="input-full main-input" placeholder="품종" /><br/>
					<select id="ageClass" name="pet.ageClass" class="bootstrap-select">
						<option value="-1">나이 선택</option>
						<option value="0">6개월 미만</option>
						<option value="1">6개월 ~ 1년</option>
						<option value="2">1년 이상(아래에 나이를 추가로 입력해 주세요)</option>
					</select>
					<input type="text" id="species" name="pet.age" class="input-full main-input" placeholder="나이(2세 이상인 경우)" />
					<select id="sex" name="pet.sex" class="bootstrap-select">
						<option value="-1">펫의 성별</option>
						<option value="M">수컷</option>
						<option value="F">암컷</option>
					</select>
					<select id="neutralization" name="pet.neutralization" class="bootstrap-select">
						<option value="-1">중성화 여부</option>
						<option value="Y">중성화 했음</option>
						<option value="N">안했음</option>
					</select>
					<select id="petSize" name="pet.petSize" class="bootstrap-select">
						<option value="-1">크기</option>
						<option value="s">소형</option>
						<option value="m">중형</option>
						<option value="l">대형</option>
					</select>
			<!-- vaccine 정보가 들어감 -->
   				<div id="vaccine">
    				백신(동물 종류를 선택해 주세요)
   					<br/>
   					<div id="catVaccineDiv">
   					<select id="catVaccine" name="vaccine" class="bootstrap-select" multiple data-actions-box="true" hidden="hidden">
      					<option value="vaccine1">고양이 백신1</option>
      					<option value="vaccine2">고양이 백신2</option>
      					<option value="vaccine3">고양이 백신3</option>
      					<option value="vaccine4">고양이 백신4</option>
      				</select>
      				</div>
      				<div id="dogVaccineDiv">
      				<select id="dogVaccine" name="vaccine" class="bootstrap-select" multiple data-actions-box="true" hidden="hidden">
      					<option value="vaccine1">강아지 백신1</option>
      					<option value="vaccine2">강아지 백신2</option>
      					<option value="vaccine3">강아지 백신3</option>
      					<option value="vaccine4">강아지 백신4</option>
      				</select>
      				</div>
      				<div id="etcVaccineDiv">
      					<input type="text" id="vaccineEtc" name="pet.vaccine1" class="input-full main-input" placeholder="접종한 백신을 입력해 주세요" />
      				</div>
      			</div>
      			<textarea rows="5" cols="" id="comment" name="pet.petComment" class="input-full main-input" placeholder="펫에 대한 코멘트" ></textarea>
				<div class="form-group">
          <p><label for="input-img">펫 사진 업로드</label>:펫 혼자 찍힌, 동물로서의 특징이 잘 드러난 사진을 골라 주세요.</p>
          
          <input type="file" id="input-img" name="input_img" class="form-control" accept="image/*" multiple="false" />
        </div>
        <div class="form-group">
          <img id="img" src="" class="img-responsive"></img>
        </div>
        <button id="submit-btn" class="btn btn-primary">판정</button>
      </form>
    </div>
    <hr>
    <div id="result">
      <h2>결과</h2>
      <div id="resultText">
      
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
		<a href="#" class="button-primary button-shadow button-full" onClick="javascript:insertPetSubmit()">
			<span>펫 등록</span>
			<div class="button-triangle"></div>
			<div class="button-triangle2"></div>
			<div class="button-icon"><i class="fa fa-user"></i></div>
		</a>
	</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal --><!-- insertPetModal -->

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
<!-- sel box -->
<script>
function changePage(){
	var sel = $('#selbox').val();
	document.selForm.action = sel;
	document.selForm.submit();
}
</script>
	
	</body>
</html>