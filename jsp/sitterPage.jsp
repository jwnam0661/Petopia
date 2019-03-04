<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>현재 시터페이지</title>
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
								<span class="top-icon-circle"> <i class="fa fa-envelope fa-sm"></i>
								</span> <span class="top-bar-text">apartment@domain.tld</span>
							</div>
							<div class="top-phone pull-left hidden-xxs">
								<span class="top-icon-circle"> <i class="fa fa-phone"></i>
								</span> <span class="top-bar-text">(0)-123-456-789</span>
							</div>
							<div
								class="top-localization pull-left hidden-sm hidden-md hidden-xs">
								<span class="top-icon-circle pull-left"> <i	class="fa fa-map-marker"></i>
								</span> <span class="top-bar-text">One Brookings Drive St.
									Louis, Missouri 63130-4899, USA</span>
							</div>
						</div>
						<div class="col-xs-7 col-sm-4">
							<div class="top-social-last top-dark pull-right"
								data-toggle="tooltip" data-placement="bottom"
								title="Login/Register">
								<a class="top-icon-circle" href="#login-modal" data-toggle="modal"> <i class="fa fa-lock"></i>
								</a>
							</div>

							<div class="top-social pull-right">
								<a class="top-icon-circle" href="#"> <i
									class="fa fa-facebook"></i>
								</a>
							</div>
							<div class="top-social pull-right">
								<a class="top-icon-circle" href="#"> <i
									class="fa fa-twitter"></i>
								</a>
							</div>
							<div class="top-social pull-right">
								<a class="top-icon-circle" href="#"> <i
									class="fa fa-google-plus"></i>
								</a>
							</div>
							<div class="top-social pull-right">
								<a class="top-icon-circle" href="#"> <i class="fa fa-skype"></i>
								</a>
							</div>
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
						 <img src="images/logo-dark.png" alt="Apartment - Premium Real Estate Template" />
						</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="index.html"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">Home</a>
								<ul class="dropdown-menu">
									<li><a href="index.html">Homepage 1 - slider</a></li>
									<li><a href="index-map.html">Homepage 1 - map</a></li>
									<li><a href="index2.html">Homepage 2 - slider</a></li>
									<li><a href="index2-map.html">Homepage 2 - map</a></li>
									<li><a href="index3.html">One Page Single Propery -	slider</a></li>
									<li><a href="index3-street-view.html">One Page Single Propery - panorama!</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Listings</a>
								<ul class="dropdown-menu">
									<li class="dropdown-submenu"><a tabindex="-1"
										href="listing-grid-right-sidebar.html">Grid Listing</a>
										<ul class="dropdown-menu">
											<li><a href="listing-grid-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="listing-grid-left-sidebar.html">Left
													Sidebar</a></li>
											<li><a href="listing-grid-no-sidebar.html">No
													Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="listing-masonry-right-sidebar.html">Masonry Listing</a>
										<ul class="dropdown-menu">
											<li><a href="listing-masonry-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="listing-masonry-left-sidebar.html">Left
													Sidebar</a></li>
											<li><a href="listing-masonry-no-sidebar.html">No
													Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="listing-list-right-sidebar.html">Classic Listing</a>
										<ul class="dropdown-menu">
											<li><a href="listing-list-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="listing-list-left-sidebar.html">Left
													Sidebar</a></li>
											<li><a href="listing-list-no-sidebar.html">No
													Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="estate-details-right-sidebar.html">Single Property</a>
										<ul class="dropdown-menu">
											<li><a href="estate-details-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="estate-details-left-sidebar.html">Left
													Sidebar</a></li>
											<li><a href="estate-details-no-sidebar.html">No
													Sidebar</a></li>
										</ul></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Agencies</a>
								<ul class="dropdown-menu">
									<li class="dropdown-submenu"><a tabindex="-1"
										href="agencies-listing-right-sidebar.html">Agencies
											Listing</a>
										<ul class="dropdown-menu">
											<li><a href="agencies-listing-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="agencies-listing-left-sidebar.html">Left
													Sidebar</a></li>
											<li><a href="agencies-listing-no-sidebar.html">No
													Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="agency-details-right-sidebar.html">Agency Details</a>
										<ul class="dropdown-menu">
											<li><a href="agency-details-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="agency-details-left-sidebar.html">Left
													Sidebar</a></li>
											<li><a href="agency-details-no-sidebar.html">No
													Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="agents-right-sidebar.html">Agents List</a>
										<ul class="dropdown-menu">
											<li><a href="agents-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="agents-left-sidebar.html">Left Sidebar</a></li>
											<li><a href="agents-no-sidebar.html">No Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="agent-right-sidebar.html">Agent Details</a>
										<ul class="dropdown-menu">
											<li><a href="agent-right-sidebar.html">Right Sidebar</a></li>
											<li><a href="agent-left-sidebar.html">Left Sidebar</a></li>
											<li><a href="agent-no-sidebar.html">No Sidebar</a></li>
										</ul></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Pages</a>
								<ul class="dropdown-menu">
									<li class="dropdown-submenu"><a tabindex="-1"
										href="typography-no-sidebar.html">Typography &amp;
											Elements</a>
										<ul class="dropdown-menu">
											<li><a href="typography-no-sidebar.html">No Sidebar</a></li>
											<li><a href="typography-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="typography-left-sidebar.html">Left
													Sidebar</a></li>
										</ul></li>
									<li><a href="404.html">Error 404</a></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="rtl-index.html">RTL Pages</a>
										<ul class="dropdown-menu">
											<li><a href="rtl-index.html">RTL Homepage</a></li>
											<li><a href="rtl-page.html">RTL Estate details</a></li>
										</ul></li>
									<li role="separator" class="divider"></li>
									<li><a href="#login-modal" data-toggle="modal">Login</a></li>
									<li><a href="#register-modal" data-toggle="modal">Register</a></li>
									<li><a href="#forgot-modal" data-toggle="modal">Forgotten
											Password</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="my-offers.html">My account - Offers</a></li>
									<li><a href="my-profile.html">My account - Profile</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Blog</a>
								<ul class="dropdown-menu">
									<li><a href="archive-grid.html">Default Grid</a></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="archive-grid2-right-sidebar.html">Masonry Grid</a>
										<ul class="dropdown-menu">
											<li><a href="archive-grid2-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="archive-grid2-left-sidebar.html">Left
													Sidebar</a></li>
											<li><a href="archive-grid2-no-sidebar.html">No
													Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="archive-right-sidebar.html">Classic List</a>
										<ul class="dropdown-menu">
											<li><a href="archive-right-sidebar.html">Right
													Sidebar</a></li>
											<li><a href="archive-left-sidebar.html">Left Sidebar</a></li>
											<li><a href="archive-no-sidebar.html">No Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1"
										href="blog-right-sidebar.html">Single Post</a>
										<ul class="dropdown-menu">
											<li><a href="blog-right-sidebar.html">Right Sidebar</a></li>
											<li><a href="blog-left-sidebar.html">Left Sidebar</a></li>
											<li><a href="blog-no-sidebar.html">No Sidebar</a></li>
										</ul></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Contact Us</a>
								<ul class="dropdown-menu">
									<li><a href="contact1.html">Contact version 1</a></li>
									<li><a href="contact2.html">Contact version 2</a></li>
								</ul></li>
							<li><a href="submit-property.html" class="special-color">Submit
									property</a></li>
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
						<h5 class="subtitle-margin second-color">dashboard</h5>
						<h1 class="second-color">my account</h1>
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
							<div class="col-xs-12">
								<h5 class="subtitle-margin">Right Now.</h5>
								<h1>
									진행중 시팅신청<span class="special-color">.</span>
								</h1>
								<div class="title-separator-primary"></div>
							</div>
						</div>

							<!-- 덭붙인 시티신청현황 -->
							<div class="container">
								<div class="row">
									<div class="col-xs-12">
										<div class="row">
											<%-- <div class="col-xs-12 col-lg-6">
												<div class="order-by-container">
													<select name="transaction1" class="bootstrap-select"
														title="Localization:">
														<option>Localization 1</option>
														<option>Localization 2</option>
														<option>Localization 3</option>
														<option>Some Long Localization 4</option>
													</select>
												</div>
											</div> --%>
											<div class="col-xs-12">
											</div>
										</div>
		
										
										<div class="row list-agency-row">
										<!-- 여기서부터 현재 시팅 리스트 시작----------------------------------------------- -->
										
										<s:iterator value="sittingList" var="sitting">
											<div class="col-xs-12">
												<div class="list-agency">
													<div class="list-agency-left">
														<img style="width: 280px; height: 230px;" src="download.action?photoNo=${sitting.photoNo }" alt="" />
														<div class="list-agency-description">
															<div class="team-desc-line">
																<span class="team-icon-circle"> <i
																	class="fa fa-phone"></i>
																</span> <span></span>
															</div>
															<div class="team-desc-line">
																<span class="team-icon-circle"> <i
																	class="fa fa-phone"></i>
																</span> <span>(0)-987-654-321</span>
															</div>
															<div class="team-desc-line">
																<span class="team-icon-circle"> <i
																	class="fa fa-envelope fa-sm"></i>
																</span> <span><a href="#">apartment@domain.tld</a></span>
															</div>
															<div class="team-social-cont">
																<div class="team-social">
																	<a href="#messages-modal<s:property value="sittingNo"/>" id="messageOpen" data-toggle="modal" value="<s:property value="sittingNo"/>">              
																		쪽지
																	</a>
																</div>
																<div class="team-social">
																	<a class="team-icon-circle" href="#"> <i
																		class="fa fa-twitter"></i>
																	</a>
																</div>
																<div class="team-social">
																	<a class="team-icon-circle" href="#"> <i
																		class="fa fa-google-plus"></i>
																	</a>
																</div>
																<div class="team-social">
																	<a class="team-icon-circle" href="#"> <i
																		class="fa fa-skype"></i>
																	</a>
																</div>
															</div>
														</div>
													</div>

													<a class="list-agency-right"
														href="agency-details-right-sidebar.html">
														<div class="list-agency-text" style="width: 300px">
														
														
															<h2 class="list-agency-title" align="center">시팅 기간</h2>
															<%-- <i class="fa fa-map-marker"></i> <span
																class="list-agency-address">Fort Collins,
																Colorado 80523, USA</span>
															<div class="list-agency-separator"></div> --%>
															<br>
															<font size="5">
																<p align="left">${sitting.startDate.substring(0,10) }</p>
																<p align="center">~</p>
																<p align="right">${sitting.endDate.substring(0,10) }</p>
															</font>
															
														</div>
													</a>
													
													<div class="list-agency-right"
														href="agency-details-right-sidebar.html">
														<div class="list-agency-text" style="width: 330px">

															<h2 class="list-agency-title" align="center">펫주인 요구사항</h2>
															<br>
															<font size="5">
									<!-- 뷰단할때는 이미지 넣어주자 ------------------------------------------------------------------>
																<p align="center">픽업&nbsp; : &nbsp;&nbsp; ${sitting.option1 }</p>
																<p align="center">목욕&nbsp; : &nbsp;&nbsp; ${sitting.option2 }</p>
																<p align="center">산책&nbsp; : &nbsp;&nbsp; ${sitting.option3 }</p>
															</font>
															
														</div>
													</div>
													
													<div class="list-agency-right"
														href="agency-details-right-sidebar.html">
															<a style="height: 69px;" href="#insertPet-modal" data-toggle="modal" class="button-primary button-shadow button-full">
																<span><font size="6">영상통화</font></span>
																<div class="button-triangle"></div>
																<div class="button-triangle2"></div>
																<div class="button-icon">
																	<i class="fa fa-th-list"></i>
																</div>
															</a>
															<a style="height: 69px;" href="#insertPet-modal" data-toggle="modal" class="button-primary button-shadow button-full">
																<span><font size="6">대화창</font></span>
																<div class="button-triangle"></div>
																<div class="button-triangle2"></div>
																<div class="button-icon">
																	<i class="fa fa-th-list"></i>
																</div>
															</a>
															<a style="height: 69px;" href="#insertPet-modal" data-toggle="modal" class="button-primary button-shadow button-full">
																<span><font size="6">사진</font></span>
																<div class="button-triangle"></div>
																<div class="button-triangle2"></div>
																<div class="button-icon">
																	<i class="fa fa-th-list"></i>
																</div>
															</a>
													</div>
													
													<!-- <div class="small-triangle"></div>
													<div class="small-triangle2"></div>
													<a class="small-icon"
														href="agency-details-right-sidebar.html"><i
														class="jfont fa-2x">&#xe804;</i>
													</a> -->
												</div>
											</div>
											</s:iterator>
										</div>
									<!-- 여기까지 시팅 리스트 -->
									</div>
								</div>
							</div>


							<div class="row margin-top-15">
					<!-- 	<div class="col-xs-12">
							<div class="labelled-textarea">
								<label for="description">Description</label>
								<textarea id="description" name="description" class="input-full main-input">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</textarea>
							</div>
						</div> -->
					</div>
							<div class="row margin-top-30">
								<%-- <div class="col-xs-12 col-lg-6">
									<div class="labelled-input-short">
										<label for="facebook"> <span
											class="label-icon-circle pull-left"> <i
												class="fa fa-facebook"></i>
										</span> Facebook
										</label> <input id="facebook" name="facebook" type="text"
											class="input-full main-input" placeholder=""
											value="http://facebook.url" />
										<div class="clearfix"></div>
									</div>
									<div class="labelled-input-short">
										<label for="gplus"> <span
											class="label-icon-circle pull-left"> <i
												class="fa fa-google-plus"></i>
										</span> Google +
										</label> <input id="gplus" name="gplus" type="text"
											class="input-full main-input" placeholder=""
											value="http://gplus.url" />
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="col-xs-12 col-lg-6">
									<div class="labelled-input-short">
										<label for="twitter"> <span
											class="label-icon-circle pull-left"> <i
												class="fa fa-twitter"></i>
										</span> Twitter
										</label> <input id="twitter" name="twitter" type="text"
											class="input-full main-input" placeholder=""
											value="http://twitter.url" />
										<div class="clearfix"></div>
									</div>
									<div class="labelled-input-short">
										<label for="skype"> <span
											class="label-icon-circle pull-left"> <i
												class="fa fa-skype"></i>
										</span> Skype
										</label> <input id="skype" name="skype" type="text"
											class="input-full main-input" placeholder=""
											value="Skype_name" />
										<div class="clearfix"></div>
									</div>
								</div> --%>
							</div>
							<!-- <div class="row margin-top-30">
								<div class="col-xs-12">
									<div class="info-box">
										<p>Fill this fields only if you want to change your
											password</p>
										<div class="small-triangle"></div>
										<div class="small-icon">
											<i class="fa fa-info fa-lg"></i>
										</div>
									</div>
								</div>
							</div> -->
							<%-- <div class="row margin-top-15">
								<div class="col-xs-12 col-lg-6">
									<div class="labelled-input-short">
										<label for="first-name">New Password</label> <input
											id="password" name="password" type="password"
											class="input-full main-input" placeholder="" value="" />
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="col-xs-12 col-lg-6">
									<div class="labelled-input-short">
										<label for="first-name">Repeat Password</label> <input
											id="repeat-password" name="repeat-password" type="password"
											class="input-full main-input" placeholder="" value="" />
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							<div class="row margin-top-15">
								<div class="col-xs-12">
									<div class="center-button-cont center-button-cont-border">
										<a href="#" class="button-primary button-shadow"> <span>save</span>
											<div class="button-triangle"></div>
											<div class="button-triangle2"></div>
											<div class="button-icon">
												<i class="fa fa-lg fa-floppy-o"></i>
											</div>
										</a>
									</div>
								</div>
							</div> --%>
						</form>
						<div class="row margin-top-60"></div>
					</div>
					
					
					<div class="col-xs-12 col-md-9 col-md-push-3">
						<div class="row">
							<div class="col-xs-12">
								<h5 class="subtitle-margin">Right Now.</h5>
								<h1>
									진행중 시팅신청<span class="special-color">.</span>
								</h1>
								<div class="title-separator-primary"></div>
							</div>
						</div>

							<!-- 덭붙인 시티신청현황 -->
							<div class="container">
								<div class="row">
									<div class="col-xs-12">
										<div class="row">
											<%-- <div class="col-xs-12 col-lg-6">
												<div class="order-by-container">
													<select name="transaction1" class="bootstrap-select"
														title="Localization:">
														<option>Localization 1</option>
														<option>Localization 2</option>
														<option>Localization 3</option>
														<option>Some Long Localization 4</option>
													</select>
												</div>
											</div> --%>
											<div class="col-xs-12">
											</div>
										</div>
		<!-- 여기서부터 현재 시팅 리스트 시작----------------------------------------------- -->
										
										<s:iterator value="sittingList" var="sitting">
										
										<div class="row list-agency-row">
											<div class="col-xs-12">
												<div class="list-agency">
													<div class="list-agency-left">
														<img style="width: 280px; height: 230px;" src="download.action?photoNo=${sitting.photoNo }" alt="" />
														<div class="list-agency-description">
															<div class="team-desc-line">
																<span class="team-icon-circle"> <i
																	class="fa fa-phone"></i>
																</span> <span></span>
															</div>
															<div class="team-desc-line">
																<span class="team-icon-circle"> <i
																	class="fa fa-phone"></i>
																</span> <span>(0)-987-654-321</span>
															</div>
															<div class="team-desc-line">
																<span class="team-icon-circle"> <i
																	class="fa fa-envelope fa-sm"></i>
																</span> <span><a href="#">apartment@domain.tld</a></span>
															</div>
															<div class="team-social-cont">
																<div class="team-social">
																	<a href="#messages-modal<s:property value="sittingNo"/>" id="messageOpen" data-toggle="modal" value="<s:property value="sittingNo"/>">              
																		쪽지
																	</a>
																</div>
																<div class="team-social">
																	<a class="team-icon-circle" href="#"> <i
																		class="fa fa-twitter"></i>
																	</a>
																</div>
																<div class="team-social">
																	<a class="team-icon-circle" href="#"> <i
																		class="fa fa-google-plus"></i>
																	</a>
																</div>
																<div class="team-social">
																	<a class="team-icon-circle" href="#"> <i
																		class="fa fa-skype"></i>
																	</a>
																</div>
															</div>
														</div>
													</div>

													<a class="list-agency-right"
														href="agency-details-right-sidebar.html">
														<div class="list-agency-text" style="width: 300px">
														
														
															<h2 class="list-agency-title" align="center">시팅 기간</h2>
															<%-- <i class="fa fa-map-marker"></i> <span
																class="list-agency-address">Fort Collins,
																Colorado 80523, USA</span>
															<div class="list-agency-separator"></div> --%>
															<br>
															<font size="5">
																<p align="left">${sitting.startDate.substring(0,10) }</p>
																<p align="center">~</p>
																<p align="right">${sitting.endDate.substring(0,10) }</p>
															</font>
															
														</div>
													</a>
													
													<div class="list-agency-right"
														href="agency-details-right-sidebar.html">
														<div class="list-agency-text" style="width: 330px">

															<h2 class="list-agency-title" align="center">펫주인 요구사항</h2>
															<br>
															<font size="5">
									<!-- 뷰단할때는 이미지 넣어주자 ------------------------------------------------------------------>
																<p align="center">픽업&nbsp; : &nbsp;&nbsp; ${sitting.option1 }</p>
																<p align="center">목욕&nbsp; : &nbsp;&nbsp; ${sitting.option2 }</p>
																<p align="center">산책&nbsp; : &nbsp;&nbsp; ${sitting.option3 }</p>
															</font>
															
														</div>
													</div>
													
													<div class="list-agency-right"
														href="agency-details-right-sidebar.html">
															<a style="height: 69px;" href="#insertPet-modal" data-toggle="modal" class="button-primary button-shadow button-full">
																<span><font size="6">영상통화</font></span>
																<div class="button-triangle"></div>
																<div class="button-triangle2"></div>
																<div class="button-icon">
																	<i class="fa fa-th-list"></i>
																</div>
															</a>
															<a style="height: 69px;" href="#insertPet-modal" data-toggle="modal" class="button-primary button-shadow button-full">
																<span><font size="6">대화창</font></span>
																<div class="button-triangle"></div>
																<div class="button-triangle2"></div>
																<div class="button-icon">
																	<i class="fa fa-th-list"></i>
																</div>
															</a>
															<a style="height: 69px;" href="#insertPet-modal" data-toggle="modal" class="button-primary button-shadow button-full">
																<span><font size="6">사진</font></span>
																<div class="button-triangle"></div>
																<div class="button-triangle2"></div>
																<div class="button-icon">
																	<i class="fa fa-th-list"></i>
																</div>
															</a>
													</div>
													
													<!-- <div class="small-triangle"></div>
													<div class="small-triangle2"></div>
													<a class="small-icon"
														href="agency-details-right-sidebar.html"><i
														class="jfont fa-2x">&#xe804;</i>
													</a> -->
												</div>
											</div>
										</div>
										

										</s:iterator>
										
										<!-- 여기까지 시팅 리스트 -->
									</div>
								</div>
							</div>
					
					<%-- <div class="col-xs-12 col-md-3 col-md-pull-9">
						<div class="sidebar-left">
							<h3 class="sidebar-title">
								sitter page<span class="special-color">.</span>
							</h3>
							<div class="title-separator-primary"></div>

							<div class="profile-info margin-top-60">
							<div class="profile-info-title negative-margin">${member.name }</div>
							<!-- <img src="images/comment-photo2.jpg" alt="" class="pull-left" /> -->
							<div class="profile-info-text pull-left">
								<p class="subtitle-margin">Agent</p>
								<p class="">42 Estates</p>
								
								<a href="#" class="logout-link margin-top-30"><i class="fa fa-lg fa-sign-out"></i>Logout</a>
							</div>
							<div class="clearfix"></div>
						</div>

							<div class="center-button-cont margin-top-30">
								<a href="#insertPet-modal" data-toggle="modal" class="button-primary button-shadow button-full">
									<span>펫 등록</span>
									<div class="button-triangle"></div>
									<div class="button-triangle2"></div>
									<div class="button-icon">
										<i class="fa fa-th-list"></i>
									</div>
								</a>
							</div>
							<div class="center-button-cont margin-top-15">
								<a href="askSitterQualificationPage"
									class="button-primary button-shadow button-full"> <span>펫시터
										신청</span>
									<div class="button-triangle"></div>
									<div class="button-triangle2"></div>
									<div class="button-icon">
										<i class="fa fa-user"></i>
									</div>
								</a>
							</div>
							<div class="center-button-cont margin-top-15">
								<a href="submit-property.html"
									class="button-alternative button-shadow button-full"> <span>즐겨찾는
										시터</span>
									<div class="button-triangle"></div>
									<div class="button-triangle2"></div>
									<div class="button-icon">
										<i class="jfont fa-lg">&#xe804;</i>
									</div>
								</a>
							</div>


							<h3 class="sidebar-title margin-top-60">Your offers<span class="special-color">.</span></h3>
						<div class="title-separator-primary"></div>
						
						<div class="sidebar-select-cont">
							<select name="transaction1" class="bootstrap-select" title="Transaction:" multiple>
								<option>For sale</option>
								<option>For rent</option>
							</select>
							<select name="conuntry1" class="bootstrap-select" title="Country:" multiple data-actions-box="true">
								<option>United States</option>
								<option>Canada</option>
								<option>Mexico</option>
							</select>
							<select name="city1" class="bootstrap-select" title="City:" multiple data-actions-box="true">
								<option>New York</option>
								<option>Los Angeles</option>
								<option>Chicago</option>
								<option>Houston</option>
								<option>Philadelphia</option>
								<option>Phoenix</option>
								<option>Washington</option>
								<option>Salt Lake Cty</option>
								<option>Detroit</option>
								<option>Boston</option>
							</select>					
							<select name="location1" class="bootstrap-select" title="Location:" multiple data-actions-box="true">
								<option>Some location 1</option>
								<option>Some location 2</option>
								<option>Some location 3</option>
								<option>Some location 4</option>
							</select>
						</div>
							<div class="adv-search-range-cont">	
								<label for="slider-range-price-sidebar-value" class="adv-search-label">Price:</label>
								<span>$</span>
								<input type="text" id="slider-range-price-sidebar-value" readonly class="adv-search-amount">
								<div class="clearfix"></div>
								<div id="slider-range-price-sidebar" data-min="0" data-max="300000" class="slider-range"></div>
							</div>
							<div class="adv-search-range-cont">	
								<label for="slider-range-area-sidebar-value" class="adv-search-label">Area:</label>
								<span>m<sup>2</sup></span>
								<input type="text" id="slider-range-area-sidebar-value" readonly class="adv-search-amount">
								<div class="clearfix"></div>
								<div id="slider-range-area-sidebar" data-min="0" data-max="180" class="slider-range"></div>
							</div>
							<div class="adv-search-range-cont">	
								<label for="slider-range-bedrooms-sidebar-value" class="adv-search-label">Bedrooms:</label>
								<input type="text" id="slider-range-bedrooms-sidebar-value" readonly class="adv-search-amount">
								<div class="clearfix"></div>
								<div id="slider-range-bedrooms-sidebar" data-min="1" data-max="10" class="slider-range"></div>
							</div>
							<div class="adv-search-range-cont">	
								<label for="slider-range-bathrooms-sidebar-value" class="adv-search-label">Bathrooms:</label>
								<input type="text" id="slider-range-bathrooms-sidebar-value" readonly class="adv-search-amount">
								<div class="clearfix"></div>
								<div id="slider-range-bathrooms-sidebar" data-min="1" data-max="4" class="slider-range"></div>
							</div>
							<div class="sidebar-search-button-cont">
								<a href="#" class="button-primary"> <span>search</span>
									<div class="button-triangle"></div>
									<div class="button-triangle2"></div>
									<div class="button-icon">
										<i class="fa fa-search"></i>
									</div>
								</a>
							</div>
						</div>
					</div> --%>
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
      					<option value="dog">개</option>
      					<option value="etc">기타(품종에 종류도 입력해 주세요)</option>
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
      					<option value="vaccine1">개 백신1</option>
      					<option value="vaccine2">개 백신2</option>
      					<option value="vaccine3">개 백신3</option>
      					<option value="vaccine4">개 백신4</option>
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
    	<input type="hidden" id="photoCheck" value="true">
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
	<script type="text/javascript" src="js/cloudVision.js"></script>

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
	
	<!-- ? -->
	<script type="text/javascript">
	function insertPetSubmit(){
		var photoCheck = $('#photoCheck').val();
		alert(photoCheck);
		
		if(photoCheck == "false"){
			alert("false");
			return;
		}
		
		$('#insertPetForm').submit();
	}
	</script>
	
	<!-- 쪽지 처리 -->
	<script type="text/javascript">
		$().ready(function(){
			
			/** 
				message-modal 창을 클릭시 메시지를 최초로 불러오는 부분
			*/ 
			$('#messageOpen').click(function(){
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
				$(id_get).empty();
				$(messageList).each(function(i, item){
					$(id_get).append(item.text);
				});
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
						alert(divId);
						displayList(data, divId);
					}
				});
			}
		});
		
		
	</script>
</body>
</html>