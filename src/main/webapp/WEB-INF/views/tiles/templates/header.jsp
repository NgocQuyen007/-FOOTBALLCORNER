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
    <link rel="mask-icon" href="https://www.timdoinhanh.com/Assets/img/favicons/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="theme-color" content="#ffffff">
    <!--Booking verify-->

    <title>Tìm đối đá bóng</title>

    <!-- Google Font -->
    <link href='<c:url value="/resources/common/css/css.css" />' rel="stylesheet" type="text/css">
    <link href='<c:url value="/resources/common/css/font-awesome.min.css"/>' rel="stylesheet">

    <!--Stylesheets-->
    <link href='<c:url value="/resources/common/css/plugins.css"/>' rel="stylesheet">

    <link href='<c:url value="/resources/common/css/main.css"/>' rel="stylesheet">

    <link href='<c:url value="/resources/common/css/style.css"/>' rel="stylesheet">
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>

</head>
<body class="page-frontpage  ng-scope">

<!--0.nav-mobile-->
<div id="left-sidebar" class="only-mobile">
    <div class="n-mobi-nav">
        <span class="menu-closer"></span>
        <a href="https://www.timdoinhanh.com/#" class="mobile-brand"><img class="img-responsive" src='<c:url value="/resources/common/img/logo-namviet-gate-li.png"/>' alt="logo"></a>
        <ul class="n-nav-ul-mobile">
            <li class="nav-tim-doi dropdown dropdown-dat" id="dropdownMenu4">
                <a href="https://www.timdoinhanh.com/tim-doi-da-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tìm đối đá bóng&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu4">
                    <li class="navbar-match-finding">
                        <a href="https://www.timdoinhanh.com/tim-doi-da-bong" title="Tìm đối đá bóng">Đối đang chờ</a>
                    </li>
                    <li class="navbar-team">
                        <a href="https://www.timdoinhanh.com/doi-bong" title="Danh sách đội bóng">Danh sách đội bóng</a>
                    </li>
                    <li class="navbar-invite">
                        <a href="javascript:void(0);" data-toggle="modal" data-target="#commonModal" login-required="true">
                            Mời đối giao lưu
                        </a>
                    </li>

                    <li style="display:none">View more</li>

                </ul>
            </li>
            <li style="display:none"></li>
            <li class="navbar-stadium dropdown dropdown-dat" id="dropdownMenu5">
                <a href="https://www.timdoinhanh.com/san-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-futbol-o" aria-hidden="true"></i>&nbsp;Tìm sân bóng&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu5">
	                <c:forEach var="district" items="${districtdtos}" begin="0" end="1">
	                	<c:set var="name" value="${district.name.substring(district.name.indexOf(' '))}"></c:set>
	                	<li><a href="https://www.timdoinhanh.com/san-bong-tai-ha-noi" title="${district.name}">Sân bóng tại ${name}</a></li>
	                </c:forEach>
                    <li><a href="https://www.timdoinhanh.com/san-bong" title="Toàn bộ sân bóng">Xem thêm</a></li>
                </ul>
            </li>
            <li class="navbar-stadium dropdown dropdown-dat" id="dropdownMenu7">
                <a href="https://www.timdoinhanh.com/san-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-futbol-o" aria-hidden="true"></i>&nbsp;Tìm sân cầu lông&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu7">
                    <li><a href="https://www.timdoinhanh.com/san-cau-long-tai-ha-noi" title="Sân cầu lông tại Hà Nội">Sân cầu lông tại Hà Nội</a></li>
                    <li><a href="https://www.timdoinhanh.com/san-cau-long-tai-ho-chi-minh" title="Sân cầu lông tại Hồ Chí Minh">Sân cầu lông tại HCM</a></li>
                    <li><a href="https://www.timdoinhanh.com/san-cau-long" title="Toàn bộ sân cầu lông">Xem thêm</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div id="right-sidebar" class="only-mobile right-user">
    <div class="n-mobi-nav">
        <span class="menu-closer"></span>
        <a href="https://www.timdoinhanh.com/#" class="user-title" data-toggle="dropdown">
        </a>
        <ul class="n-nav-ul-mobile">
            <li>
                <a href="https://www.timdoinhanh.com/#frmRegister" onclick="location.href =''" title="Đăng ký thành viên">
                    <i class="fa fa-user" aria-hidden="true"></i> Đăng ký
                </a>
            </li>
            <li>
                <a href="https://www.timdoinhanh.com/#" data-toggle="modal" data-target="#loginModal" title="Đăng nhập">
                    <i class="fa fa-lock" aria-hidden="true"></i> Đăng nhập
                </a>
            </li>
        </ul>
    </div>
</div>

<!-- LOGIN - ED -->
<div id="right-sidebar" class="only-mobile right-user">

    <div class="n-mobi-nav">
        <span class="menu-closer"></span>
        <a href="#" class="user-title" data-toggle="dropdown">
            <img class="avatar-nav" src='<c:url value="/resources/common/img/default-user.png" />' alt="avatar">
            Quyen Phan        </a>
        <ul class="n-nav-ul-mobile">
            <li class="nav-bar-notification">
                <a>
                    <i class="fa fa-bell"></i>
                    Thông báo
                    <b class="badge badge-primary bg-red" style="display:none"> </b>
                </a>
            </li>
            <li>
                <a href="/user/profile">
                    <i class="fa fa-user"></i>
                    Thông tin tài khoản
                </a>
            </li>
            <li>
                <a href="/match/inviting">
                    <i class="fa fa-futbol-o"></i>
                    Trận đấu của tôi
                </a>
            </li>
            <li>
                <a href="{{ firstTeamUrl() }}">
                    <i class="fa fa-group"></i>
                    Đội bóng của tôi
                </a>
            </li>
            <li>
                <a href="/stadium/bookinghistory">
                    <i class="fa fa-history"></i>
                    Lịch sử đặt sân
                </a>
            </li>
            <li>
                <a href="/stadium/management">
                    <i class="fa fa-th-large"></i>
                    Quản lý sân
                </a>
            </li>
            <li>
                <a href="/User/logout">
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                    Đăng xuất
                </a>
            </li>
        </ul>
    </div>
</div>

<div class="overlay-nav"></div>
<!--#0.nav-mobile-->

<header class="n-nav navbar nav-down" role="banner">
    <div class="container">
        <div class="navbar-header">
        <!-- Responsive web for Login -->
            <span id="btn-left-sidebar" class="only-mobile-btn"><i class="fa fa-bars" aria-hidden="true"></i></span>
            <a class="logo-top" href="https://www.timdoinhanh.com/" title="Tìm Đối Nhanh">
                <img src='<c:url value="/resources/common/img/logo-tim-doi-nhanh.png"/>' alt="Tìm Đối Nhanh">
            </a>
            <span id="btn-right-sidebar" class="only-mobile-btn btn-right-user ng-scope" >
            <i class="fa fa-user" aria-hidden="true"></i>
            <b class="badge badge-primary bg-red ng-binding" style="display:none" ></b>
        </span>
        </div> <!-- /.navbar-header -->
        <nav class="mobi-none" role="navigation">
            <ul class="nav navbar-nav navbar-right ng-scope" >
                <li>
                    <a href="${contextPath}/tim-doi-da-bong-tai-da-nang" title="">Tìm đối</a>
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
                            <a href="javascript:void(0);" class="btn-link-moi-doi modal-link-angularjs" data-modal-tpl="match.create"  data-toggle="modal" data-target="#commonModal">
                                <i class="fa fa-beer"></i>
                                Mời đối giao lưu
                            </a>
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

                <li>
                    <a href="javascript:;" id="loginBtn" data-toggle="modal" data-target="#loginModal">
                        Đăng nhập
                    </a>
                </li>
            </ul>
        </nav>
    </div> <!-- /.container -->
    <div id="loadingBar" class="load-bar hidden">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
    </div>
</header>