<%@page import="java.util.regex.Pattern"%>
<%@page import="java.text.Normalizer"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="apple-touch-icon" sizes="180x180" href="https://www.timdoinhanh.com/Assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" href="https://www.timdoinhanh.com/Assets/img/favicons/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="https://www.timdoinhanh.com/Assets/img/favicons/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="https://www.timdoinhanh.com/Assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="https://www.timdoinhanh.com/Assets/img/favicons/safari-pinned-tab.svg">
    <meta name="theme-color" content="#ffffff">
    
    <!--Booking verify-->
    <title>Đặt kèo nhanh</title>
    
    <!-- Google Font -->
    <link href='<c:url value="/resources/common/css/css.css" />' rel="stylesheet" type="text/css">
    <link href='<c:url value="/resources/common/css/font-awesome.min.css"/>' rel="stylesheet">
    
    <!--Stylesheets-->
    <link href='<c:url value="/resources/common/css/plugins.css"/>' rel="stylesheet">
    <link href='<c:url value="/resources/common/css/main.css"/>' rel="stylesheet">
    <link href='<c:url value="/resources/common/css/style.css"/>' rel="stylesheet">
    
    
    <link href='<c:url value="/resources/common/css/jquery-ui.css" />'  rel="stylesheet">
    <link href='<c:url value="/resources/common/css/summernote.css"/>' rel="stylesheet">
    
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
    
    
    
</head>

<body class="page-frontpage  ng-scope">
<input type='hidden' value="${contextPath}" id="contextPath">

<!--0.nav-mobile MOBILE -->
<div id="left-sidebar" class="only-mobile">
    <div class="n-mobi-nav">
        <span class="menu-closer"></span>
        <a href="${contextPath}" class="mobile-brand"><img class="img-responsive" src='<c:url value="/resources/common/img/logo-namviet-gate-li.png"/>' alt="logo"></a>
        <ul class="n-nav-ul-mobile">
            <li class="nav-tim-doi dropdown dropdown-dat" id="dropdownMenu4">
                <a href="${contextPath}/tim-doi-da-bong-tai-da-nang" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tìm đối đá bóng&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu4">
                    <li class="navbar-match-finding">
                        <a href="${contextPath}/tim-doi-da-bong-tai-da-nang" title="Tìm đối đá bóng">Đối đang chờ</a>
                    </li>
                    <li class="navbar-team">
                        <a href="${contextPath}/doi-bong-tai-da-nang" title="Danh sách đội bóng">Danh sách đội bóng</a>
                    </li>
                    <li class="navbar-invite">
	                    <c:choose>
							<c:when test="${empty sessionScope.sessionUserInfo}"> 
								<a href="javascript:void(0);" data-toggle="modal" data-target="#modalNotAuthorize">
		                            Mời đối giao lưu
		                        </a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" data-toggle="modal" data-target="#commonModal">
		                            Mời đối giao lưu
		                        </a>
							</c:otherwise>
						</c:choose> 	
                    </li>

                    <li style="display:none">View more</li>

                </ul>
            </li>
            <li style="display:none"></li>
            <li class="navbar-stadium dropdown dropdown-dat" id="dropdownMenu5">
                <a href="${contextPath}/san-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-futbol-o" aria-hidden="true"></i>&nbsp;Tìm sân bóng&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu5">
	                <c:forEach var="district" items="${districtdtos}" begin="0" end="1">
	                	<c:set var="name" value="${district.name.substring(district.name.indexOf(' '))}"></c:set>
	                	<li><a href="${contextPath}/san-bong-tai${dnameurl}-${district.zipcode}" title="${district.name}">Sân bóng tại ${name}</a></li>
	                </c:forEach>
                    <li><a href="${contextPath}/san-bong" title="Toàn bộ sân bóng">Xem thêm</a></li>
                </ul>
            </li>
            <li class="navbar-stadium dropdown dropdown-dat" id="dropdownMenu7">
                <a href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fa fa-futbol-o" aria-hidden="true"></i>
	                &nbsp;Tìm sân cầu lông&nbsp;&nbsp;
	                <span class="caret"></span>
	            </a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu7">
                    <li><a href="" title="Sân cầu lông tại Liên chiểu">Sân cầu lông tại Liên chiểu</a></li>
                    <li><a href="" title="Sân cầu lông tại Hải Châu">Sân cầu lông tại Hải Châu</a></li>
                    <li><a href="" title="Toàn bộ sân cầu lông">Xem thêm</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>


<!-- Right side bar -->

<c:choose>
	<c:when test="${empty sessionScope.sessionUserInfo}">
		<div id="right-sidebar" class="only-mobile right-user">
		    <div class="n-mobi-nav">
		        <span class="menu-closer"></span>
		        <a href="${contextPath}" class="user-title" data-toggle="dropdown">
		        </a>
		        <ul class="n-nav-ul-mobile">
		            <li>
		                <a href="${contextPath}" title="Đăng ký thành viên">
		                    <i class="fa fa-user" aria-hidden="true"></i> Đăng ký
		                </a>
		            </li>
		            <li>
		                <a href="javascript:void(0);" data-toggle="modal" data-target="#loginModal" title="Đăng nhập">
		                    <i class="fa fa-lock" aria-hidden="true"></i> Đăng nhập
		                </a>
		            </li>
		        </ul>
		    </div>
		</div>
	</c:when>
	
	<c:otherwise>
		<div id="right-sidebar" class="only-mobile right-user">
		    <div class="n-mobi-nav">
		        <span class="menu-closer"></span>
		        <a href="#" class="user-title" data-toggle="dropdown">
		            <img class="avatar-nav" src='<c:url value="/resources/common/img/default-user.png" />' alt="avatar">
		            ${tagfunc:getLastAndFirstOfFullName(sessionScope.sessionUserInfo.fullname)}        
		        </a>
		        <ul class="n-nav-ul-mobile">
		            <li class="nav-bar-notification">
		                <a>
		                    <i class="fa fa-bell"></i>
		                    Thông báo
		                    <b class="badge badge-primary bg-red" style="display:none"> </b>
		                </a>
		            </li>
		            <li>
		                <a href="${contextPath}/user/profile">
		                    <i class="fa fa-user"></i>
		                    Thông tin tài khoản
		                </a>
		            </li>
		            <li>
		                <a href="${contextPath}/match/inviting">
		                    <i class="fa fa-futbol-o"></i>
		                    Trận đấu của tôi
		                </a>
		            </li>
		            <li>
		                <a href="${contextPath}/team/management/newteam">
		                    <i class="fa fa-group"></i>
		                    Đội bóng của tôi
		                </a>
		            </li>
		            <li>
		                <a >
		                    <i class="fa fa-history"></i>
		                    Lịch sử đặt sân
		                </a>
		            </li>
		            <li>
		                <a href="${contextPath}/stadium/management">
		                    <i class="fa fa-th-large"></i>
		                    Quản lý sân
		                </a>
		            </li>
		            <li>
		                <a href="${contextPath}/logout">
		                    <i class="fa fa-sign-out" aria-hidden="true"></i>
		                    Đăng xuất
		                </a>
		            </li>
		        </ul>
		    </div>
		</div>
	</c:otherwise>
</c:choose>


<div class="overlay-nav"></div>
<!--#0.nav-mobile spend for mobile-->

<header class="n-nav navbar nav-down" role="banner">
    <div class="container">
        <div class="navbar-header">
        <!-- Responsive web for Login -->
            <span id="btn-left-sidebar" class="only-mobile-btn"><i class="fa fa-bars" aria-hidden="true"></i></span>
            <a class="logo-top" href="${contextPath}" title="Tìm Đối Nhanh">
                <img src='<c:url value="/resources/common/img/logo-dat-keo-nhanh.png"/>' alt="Đặt kèo nhanh">
            </a>
            <span id="btn-right-sidebar" class="only-mobile-btn btn-right-user ng-scope" >
            <i class="fa fa-user" aria-hidden="true"></i>
            <b class="badge badge-primary bg-red ng-binding" style="display:none" ></b>
        </span>
        </div> 
        <!-- /.navbar-header -->
        <nav class="mobi-none" role="navigation">
            <ul class="nav navbar-nav navbar-right ng-scope" >
            	<!-- ===================== HEADER TIM DOI =========================  -->
                <li>
                    <a href="${contextPath}/tim-doi-da-bong-tai-da-nang" title="">Tìm đối thủ</a>
                    <ul class="navbar-nav-dropdown">
                        <li class="navbar-match-finding">
                            <a href="${contextPath}/tim-doi-da-bong-tai-da-nang" title="">
                                <i class="fa fa-futbol-o" aria-hidden="true"></i>
                                Đối đang chờ
                            </a>
                        </li>
                        <li class="navbar-team">
                            <a href="${contextPath}/doi-bong-tai-da-nang" title="">
                                <i class="fa fa-futbol-o" aria-hidden="true"></i>
                                Danh sách đội bóng
                            </a>
                        </li>
                        <li class="navbar-invite">
		                    <c:choose>
								<c:when test="${empty sessionScope.sessionUserInfo}"> 
									<a href="javascript:void(0);" data-toggle="modal" data-target="#modalNotAuthorize">
										<i class="fa fa-beer"></i>
			                            Mời đối giao lưu
			                        </a>
								</c:when>
								<c:otherwise>
									<a href="javascript:void(0);" data-toggle="modal" data-target="#commonModal">
										<i class="fa fa-beer"></i>
			                            Mời đối giao lưu
			                        </a>
								</c:otherwise>
							</c:choose> 	
	                    </li>

                        <li style="display:none">View more</li>

                    </ul>
                </li>
                
                <li style="display:none"></li>
                
                <li class="navbar-stadium">
                    <a href="${contextPath}/san-bong" title="">
                    	<i class="fa fa-futbol-o" aria-hidden="true"></i>Đặt sân
                    </a>
                    <ul class="navbar-nav-dropdown">
                    <c:forEach var="district" items="${districtdtos}">
                    	<c:set var="name" value="${district.name.substring(district.name.indexOf(' '))}"></c:set>
                    	<%
                    		String name = (String)pageContext.getAttribute("name");
                    		String temp = Normalizer.normalize(name, Normalizer.Form.NFD);
                    		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
                    		pageContext.setAttribute("dnameurl", pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d"));
                    	%>
                    	
                        <li>
                            <a href="${contextPath}/san-bong-tai${dnameurl}-${district.zipcode}" title="${district.name}">
                                <i class="fa fa-futbol-o" aria-hidden="true"></i>
                                Sân bóng tại ${name}
                            </a>
                        </li>
                       </c:forEach>
                        <li style="display:none">View more</li>
                    </ul>
                </li>
				
				
				
				<c:choose>
					<c:when test="${empty sessionScope.sessionUserInfo}">
						<li>
		                    <a href="javascript:;" id="loginBtn" data-toggle="modal" data-target="#loginModal">
		                        Đăng nhập
		                    </a>
		                </li>
					</c:when>
					<c:otherwise>
					
						<input type ="hidden" name="curl" id='current-url' value="" />
				        <script type="text/javascript">
				        	var curl = window.location.href;
				        	document.getElementById("current-url").value = curl;
				        </script>
				        
				        <!-- Notification header -->
				        
		                <li class="dropdown navbar-notification">
		                      <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" id="btn-notification">
		                      <c:set var="notis" value="${findingRecipientNotifications.size() + stadiumDetailStatusNoti.size()}" />
		                      <c:choose>
									<c:when test="${notis == 0}">
										<i class="fix-notification-padding fa fa-bell navbar-notification-icon"></i>
		                          		<span class="visible-xs-inline">&nbsp;Notifications</span>	
									</c:when>
									<c:otherwise>
										<i class="fa fa-bell navbar-notification-icon"></i>
		                          		<span class="visible-xs-inline">&nbsp;Notifications</span>
		                          		
		                          		<c:if test="${notis > 5 }">
		                          			<b class="badge badge-primary" >${notis}+ </b>		
		                          		</c:if>
		                          		<c:if test="${notis <= 5 }">
		                          			<b class="badge badge-primary" >${notis} </b>		
		                          		</c:if>	
									</c:otherwise>		                      	
		                      </c:choose>   
		                          
		                      </a>
		                      <div class="dropdown-menu">
		                          <div class="dropdown-header">Thông báo</div>
		                          <div class="notification-list scrollbar-enabled">
		                          
		                          <c:choose>
			                          <c:when test="${notis > 0}">
			                          
			                          <c:if test="${not empty findingRecipientNotifications}">
			                          	<c:forEach var="frnotification" items="${findingRecipientNotifications}">
					                              <div class="force-overflow" >
					                                  <a href="#" class="notification" >
					                                      <span class="notification-icon">
					                                      	<img src='<c:url value="/resources/common/img/sport.png" />' class="text-primary" />
					                                      </span>
					                                      <span class="notification-title">${frnotification.getInformation()} FC</span>
					                                      <span class="notification-description" > 
					                                       		Đội ${frnotification.getInformation()} FC đã tham gia trận đấu của bạn:
					                                      		<strong>${tagfunc:getMatchTime(frnotification.getEvent().getCreatedAt())}</strong>
					                                      </span>
					                                      <img style="float: left; padding-right: 10px" class="_10cu img _8o _8r img" src="https://static.xx.fbcdn.net/rsrc.php/v3/yP/r/OaW9iVUiIFk.png?_nc_eui2=AeGPZ3QxLw1FyMPakMmVixtUaqkXuK-j2FTzbW_FJe839n6C0z4s25kSf2c9GTIGfSFZg_1qjk4ruQG6DsKMbM8Sj2PgqAzD05Ir6LMF52_3xQ" alt="">
					                                      <span class="notification-time">${tagfunc:getTimesAge(frnotification.getCreatedAt())}</span>
					                                  </a>
					                              </div>
			                              	</c:forEach>
			                          </c:if>
			                          <c:if test="${not empty stadiumDetailStatusNoti}">
			                          		<c:forEach var="stNoti" items="${stadiumDetailStatusNoti}">
					                              <div class="force-overflow" >
					                                  <a href="#" class="notification" >
					                                      <span class="notification-icon">
					                                      	<img src='<c:url value="/resources/common/img/sport.png" />' class="text-primary" />
					                                      </span>
					                                      <span class="notification-title">${stNoti.getCost().getPitchDetail().getPitch().getName()} FC</span>
					                                      <c:if test="${stNoti.getStatus() == 2}">
						                                      <span class="notification-description" >
						                                       		Yêu cầu đặt sân ${stNoti.getCost().getPitchDetail().getPitch().getName()} của bạn không thành công
						                                      		<br><strong>Thời gian diễn ra trận đấu: ${stNoti.getMatchDateTime()}</strong>
						                                      </span>
					                                      </c:if>
					                                      <c:if test="${stNoti.getStatus() == 1}">
						                                      <span class="notification-description" >
						                                       		Bạn đã đặt sân ${stNoti.getCost().getPitchDetail().getPitch().getName()} thành công.
						                                       		<br><strong>Thời gian diễn ra trận đấu: ${stNoti.getMatchDateTime()}</strong>
						                                      </span>
					                                      </c:if>
					                                      <img style="float: left; padding-right: 10px" src="https://static.xx.fbcdn.net/rsrc.php/v3/yP/r/OaW9iVUiIFk.png?_nc_eui2=AeGPZ3QxLw1FyMPakMmVixtUaqkXuK-j2FTzbW_FJe839n6C0z4s25kSf2c9GTIGfSFZg_1qjk4ruQG6DsKMbM8Sj2PgqAzD05Ir6LMF52_3xQ" alt="">
					                                      <span class="notification-time">${tagfunc:getTimesAge(stNoti.getCreatedAt())}</span>
					                                  </a>
					                              </div>
			                              	</c:forEach>
			                          		
			                          		
			                          </c:if>
			                          
			                          		
					                         <a href="" class="notification-link-all text-center" style="padding-left: 20px">Xem tất cả</a>
			                          </c:when>
			                          <c:otherwise>
			                          		<a href="javascript:void(0);" style="padding-left: 20px" class="notification-link-all text-center">&nbsp;&nbsp;Không có thông báo mới nào</a>
			                          </c:otherwise>
		                          </c:choose>
		                          
		                          
		                          
		                          
		                          </div>
		                          
		                      </div> 
		                  </li>
		                  
		                  
		                  <li class="dropdown navbar-profile">
		                       <a class="dropdown-toggle user-menu" data-toggle="dropdown" href="javascript:;">
		                           <img src='<c:url value="/resources/common/img/default-user.png" />' class="navbar-profile-avatar" alt="">
		                           <span class="visible-xs-inline user-name">${tagfunc:getLastAndFirstOfFullName(sessionScope.sessionUserInfo.fullname)}   &nbsp;</span>
		                           <i class="fa fa-caret-down"></i>
		                       </a>
		                       <ul class="navbar-nav-dropdown" role="menu">
		
		                           <li>
		                               <a href="${contextPath}/user/profile">
		                                   <i class="fa fa-user"></i>
		                                   Thông tin tài khoản
		                               </a>
		                           </li>
		                           <li>
		                               <a href="${contextPath}/match/inviting">
		                                   <i class="fa fa-futbol-o"></i>
		                                   Trận đấu của tôi
		                               </a>
		                           </li>
		                           <li>
		                               <a >
		                                   <i class="fa fa-history"></i>
		                                   Lịch sử đặt sân
		                               </a>
		                           </li>
		                           <li>
		                               <a href="${contextPath}/team/management/newteam">
		                                   <i class="fa fa-futbol-o"></i>
		                                   Đội bóng của tôi
		                               </a>
		                           </li>
		                           <li>
		                               <a href="${contextPath}/stadium/management">
		                                   <i class="fa fa-th-large"></i>
		                                   Sân bóng của tôi 
		                               </a>
		                           </li>
		                           <li>
		                               <a href="${contextPath}/logout">
		                                   <i class="fa fa-sign-out" aria-hidden="true"></i>
		                                   Đăng xuất
		                               </a>
		                           </li>
		                           <li style="display:none"></li>
		                       </ul>
		                   </li>
					</c:otherwise>
				</c:choose> 
                 
            </ul>
        </nav>
    </div> 
    <div id="loadingBar" class="load-bar hidden">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
    </div>
</header>