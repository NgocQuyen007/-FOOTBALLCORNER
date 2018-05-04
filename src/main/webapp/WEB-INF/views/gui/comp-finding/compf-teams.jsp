<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>

<!--0.nav-mobile-->
<div id="left-sidebar" class="only-mobile">
    <div class="n-mobi-nav">
        <span class="menu-closer"></span>
        <a href="#" class="mobile-brand"><img class="img-responsive" src="img/logo-namviet-gate-li.png" alt="logo"></a>
        <ul class="n-nav-ul-mobile">
            <li class="nav-tim-doi dropdown dropdown-dat" id="dropdownMenu4">
                <a href="/tim-doi-da-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tìm đối đá bóng&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu4">
                    <li class="navbar-match-finding">
                        <a href="/tim-doi-da-bong" title="Tìm đối đá bóng">Đối đang chờ</a>
                    </li>
                    <li class="navbar-team">
                        <a href="/doi-bong" title="Danh sách đội bóng">Danh sách đội bóng</a>
                    </li>
                    <li class="navbar-invite">
                        <a href="javascript:void(0);" class="btn-link-moi-doi modal-link-angularjs" data-modal-tpl="match.create" login-required="true">
                            Mời đối giao lưu
                        </a>
                    </li>

                    <li style="display:none">View more</li>

                </ul>
            </li>
            <li style="display:none"></li>
            <li class="navbar-stadium dropdown dropdown-dat" id="dropdownMenu5">
                <a href="/san-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-futbol-o" aria-hidden="true"></i>&nbsp;Tìm sân bóng&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu5">
                    <li><a href="/san-bong-tai-ha-noi" title="Sân bóng tại Hà Nội">Sân bóng tại Hà Nội</a></li>
                    <li><a href="/san-bong-tai-ho-chi-minh" title="Sân bóng tại Hồ Chí Minh">Sân bóng tại HCM</a></li>
                    <li><a href="/san-bong" title="Toàn bộ sân bóng">Xem thêm</a></li>
                </ul>
            </li>
            <li class="navbar-stadium dropdown dropdown-dat" id="dropdownMenu6">
                <a href="/san-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-futbol-o" aria-hidden="true"></i>&nbsp;Tìm sân Tennis&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu6">
                    <li><a href="/san-tennis-tai-ha-noi" title="Sân tennis tại Hà Nội">Sân bóng tennis Hà Nội</a></li>
                    <li><a href="/san-tennis-tai-ho-chi-minh" title="Sân tennis tại Hồ Chí Minh">Sân tennis tại HCM</a></li>
                    <li><a href="/san-tennis" title="Toàn bộ sân tennis">Xem thêm</a></li>
                </ul>
            </li>
            <li class="navbar-stadium dropdown dropdown-dat" id="dropdownMenu7">
                <a href="/san-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-futbol-o" aria-hidden="true"></i>&nbsp;Tìm sân cầu lông&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu7">
                    <li><a href="/san-cau-long-tai-ha-noi" title="Sân cầu lông tại Hà Nội">Sân cầu lông tại Hà Nội</a></li>
                    <li><a href="/san-cau-long-tai-ho-chi-minh" title="Sân cầu lông tại Hồ Chí Minh">Sân cầu lông tại HCM</a></li>
                    <li><a href="/san-cau-long" title="Toàn bộ sân cầu lông">Xem thêm</a></li>
                </ul>
            </li>
            <li class="navbar-stadium dropdown dropdown-dat" id="dropdownMenu8">
                <a href="/san-bong" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-futbol-o" aria-hidden="true"></i>&nbsp;CLB bóng bàn&nbsp;&nbsp;<span class="caret"></span></a>
                <ul class="dropdown-menu navbar-nav-dropdown" aria-labelledby="dropdownMenu8">
                    <li><a href="/clb-bong-ban-tai-ha-noi" title="CLB bóng bàn tại Hà Nội">CLB bóng bàn tại Hà Nội</a></li>
                    <li><a href="/clb-bong-ban-tai-ho-chi-minh" title="CLB bóng bàn tại Hồ Chí Minh">CLB bóng bàn tại HCM</a></li>
                    <li><a href="/clb-bong-ban" title="Toàn bộ CLB bóng bàn">Xem thêm</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div id="right-sidebar" class="only-mobile right-user">


    <div class="n-mobi-nav">
        <span class="menu-closer"></span>
        <a href="#" class="user-title" data-toggle="dropdown">
            <img class="avatar-nav" src="img/default-user.png" alt="avatar">
            Quyen Phan        </a>
        <ul class="n-nav-ul-mobile">
            <li class="nav-bar-notification" ng-controller="NotificationCtrl" ng-click="onShowNotifications();">
                <a href="/notification/history" onclick="location.href = '/notification/history'">
                    <i class="fa fa-bell"></i>
                    Thông báo
                    <b class="badge badge-primary bg-red" style="display:none" ng-class="{'ngloaded-inline':notiItemCount!=''}">{{ notiItemCount }}</b>
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

<input type="hidden" id="provinceId" value="3" />
<input type="hidden" id="typeId" value="1" />

<div class="breadcrum">
    <div class="container">
        <div class="breadcrum-line">
            <a href="/">Trang chủ</a>
            <a href="/doi-bong" class="" title="Đội b&#243;ng">Đội b&#243;ng</a>
            <a>Đội b&#243;ng tại H&#224; Nội</a>
        </div>
    </div>
</div>

<div class="content-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="sidebar-filter-container">
                    <div class="m-btn-expand-holder mobile-only">
                        <span class="form-filter-san-span">Lọc kết quả <i class="fa fa-filter" aria-hidden="true"></i></span>
                    </div>
                    <h2 id="a" class="title-intent title-pages mobile-hidden"><i class="fa fa-filter" aria-hidden="true"></i>Lọc kết quả</h2>

                    <div class="sidebar sidebar-tien-ich sidebar-province">
                        <p class="title-box"><i class="fa fa-map-marker" aria-hidden="true"></i> Tỉnh / Thành phố</p>
                        <ul class="list-left-links">
                            <li   class="active"       >
                                <a href="/doi-bong-tai-ha-noi">H&#224; Nội <span>5850</span></a>
                            </li>
                            <li >
                                <a href="/doi-bong-tai-ho-chi-minh">Hồ Ch&#237; Minh <span>18</span></a>
                            </li>
                            <li >
                                <a href="/doi-bong-tai-da-nang">Đ&#224; Nẵng <span>4</span></a>
                            </li>
                            <li >
                                <a href="/doi-bong-tai-bac-giang">Bắc Giang <span>2</span></a>
                            </li>
                            <li >
                                <a href="/doi-bong-tai-thua-thien-hue">Thừa Thi&#234;n Huế <span>1</span></a>
                            </li>
                            <li >
                                <a href="/doi-bong-tai-kon-tum">Kon Tum <span>1</span></a>
                            </li>
                            <li >
                                <a href="/doi-bong-tai-ba-ria-vung-tau">B&#224; Rịa - Vũng T&#224;u <span>1</span></a>
                            </li>
                        </ul>
                    </div>

                    <div class="sidebar sidebar-tim-doi ">
                        <ul class="list-left-links list-left-check">
                            <li>
                                <strong>Tr&#236;nh độ</strong>
                                <ul>
                                    <li onclick="location.href='/doi-bong-tai-ha-noi?level=8';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fodd" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Kh&#225;
                                                <span class="pull-right filter-count">1</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/doi-bong-tai-ha-noi?level=6';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="ddddfo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Mềm
                                                <span class="pull-right filter-count">61</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/doi-bong-tai-ha-noi?level=1';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="f22222o" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Mới chơi
                                                <span class="pull-right filter-count">165</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/doi-bong-tai-ha-noi?level=7';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="dddfo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Rất mềm
                                                <span class="pull-right filter-count">12</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/doi-bong-tai-ha-noi?level=2';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fdddo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Trung b&#236;nh
                                                <span class="pull-right filter-count">764</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/doi-bong-tai-ha-noi?level=3';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Trung b&#236;nh kh&#225;
                                                <span class="pull-right filter-count">195</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/doi-bong-tai-ha-noi?level=5';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="f2322o" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Trung b&#236;nh yếu
                                                <span class="pull-right filter-count">4648</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                    </div>
                </div>

            </div>
            <div class="col-md-9 l-30">
                <div class="p-content">
                    <h1 id="3232a" class="title-intent title-pages"><i class="fa fa-futbol-o" aria-hidden="true"></i> Đội b&#243;ng tại H&#224; Nội</h1>

                    <div class="form-group list-search-top">
                        <form method="get">
                            <div class="col-md-7 nopaddingleft">
                                <input type="text" name="keyword" class="form-control input-sm" placeholder="Nhập tên đội bóng, sân nhà, hoặc khu vực"/>
                            </div>
                            <div class="col-md-3 nopaddingleft">
                                <div class="input-group date frm-date-time">
                                    <input id="matchFindingListSearchTime" name="time" type='text' placeholder="Thời gian đá" class="form-control input-sm jqueryTimePickerEnabled" />
                                    <label class="input-group-addon btn" for="matchFindingListSearchTime">
                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-2 nopadding">
                                <button class="btn btn-sm btn-default" type="submit">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>

                    <ul class="list-item-san">
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/royal-fc-262011.html" title="royal Fc"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="royal Fc" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/royal-fc-262011.html" title="royal Fc">royal Fc</a></h2>

                                        <button idd="9465" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9465&toUserId=1715&toTeamName=royal Fc">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1715">
                                        <a href="/user/profile/1715"><i class="fa fa-user" aria-hidden="true"></i> nguyễn kh&#225;nh</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1715);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p class="quost-doi">đội mới chơi c&#242;n k&#233;m t&#236;m đối k&#233;m ngang đ&#225; s&#225;ng 8h</p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Mới chơi
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Nhóm tuổi: </strong> Dưới 2005 tuổi
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong>08:00 - 09:30 Chủ Nhật hàng tuần

                                    </p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9465" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9465&toUserId=1715&toTeamName=royal Fc">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/fc-thieu-thinh.html" title="Fc Thiệu Thịnh"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="Fc Thiệu Thịnh" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/fc-thieu-thinh.html" title="Fc Thiệu Thịnh">Fc Thiệu Thịnh</a></h2>

                                        <button idd="9456" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9456&toUserId=1713&toTeamName=Fc Thiệu Thịnh">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1713">
                                        <a href="/user/profile/1713"><i class="fa fa-user" aria-hidden="true"></i> Cao đức  H&#249;ng</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1713);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Mới chơi
                                    </p>



                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9456" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9456&toUserId=1713&toTeamName=Fc Thiệu Thịnh">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/fc-ha-nam-262011.html" title="FC H&#224; Nam"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="FC H&#224; Nam" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/fc-ha-nam-262011.html" title="FC H&#224; Nam">FC H&#224; Nam</a></h2>

                                        <button idd="9455" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9455&toUserId=1712&toTeamName=FC H&#224; Nam">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1712">
                                        <a href="/user/profile/1712"><i class="fa fa-user" aria-hidden="true"></i> Nguyễn Ba</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1712);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong><a href="">Sân Đại Từ</a>

                                    </p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9455" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9455&toUserId=1712&toTeamName=FC H&#224; Nam">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/fc-ha-nam.html" title="FC H&#224; Nam"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="FC H&#224; Nam" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/fc-ha-nam.html" title="FC H&#224; Nam">FC H&#224; Nam</a></h2>

                                        <button idd="9454" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9454&toUserId=1712&toTeamName=FC H&#224; Nam">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1712">
                                        <a href="/user/profile/1712"><i class="fa fa-user" aria-hidden="true"></i> Nguyễn Ba</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1712);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p class="quost-doi">Đội đ&#225; văn ph&#242;ng, giao lưu l&#224; ch&#237;nh</p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Nhóm tuổi: </strong> Dưới 35 tuổi
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong>19:30 - 21:00 Thứ Hai hàng tuần - <a href="">sân Đại Từ</a>

                                    </p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9454" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9454&toUserId=1712&toTeamName=FC H&#224; Nam">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/fc82.html" title="FC82"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="FC82" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/fc82.html" title="FC82">FC82</a></h2>

                                        <button idd="9450" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9450&toUserId=1707&toTeamName=FC82">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1707">
                                        <a href="/user/profile/1707"><i class="fa fa-user" aria-hidden="true"></i> Đức  H&#249;ng</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1707);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p class="quost-doi">FC82 to&#224;n ae 36 tuổi. D&#226;n văn ph&#242;ng. Tr&#236;nh độ mềm. Giao lưu vui vẻ. Kh&#244;ng ch&#226;n tay miệng.</p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Mới chơi
                                    </p>



                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9450" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9450&toUserId=1707&toTeamName=FC82">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/fc-xwatch-262011.html" title="FC XWATCH"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="FC XWATCH" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/fc-xwatch-262011.html" title="FC XWATCH">FC XWATCH</a></h2>

                                        <button idd="9444" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9444&toUserId=1698&toTeamName=FC XWATCH">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1698">
                                        <a href="/user/profile/1698"><i class="fa fa-user" aria-hidden="true"></i> Phạm  C&#244;ng</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1698);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh yếu
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong><a href="/san-bong-dam-hong.html">Sân Bóng Đầm Hồng</a>

                                    </p>
                                    <p><i class="fa fa-map-o" aria-hidden="true"></i><strong> Địa chỉ:</strong> Cuối ng&#245; 183 Ho&#224;ng Văn Th&#225;i, cạnh chung cư H&#224; Đ&#244; (Quận Thanh Xu&#226;n H&#224; Nội)</p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9444" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9444&toUserId=1698&toTeamName=FC XWATCH">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/ddp02fc.html" title="Ddp02.FC"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="Ddp02.FC" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/ddp02fc.html" title="Ddp02.FC">Ddp02.FC</a></h2>

                                        <button idd="9438" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9438&toUserId=1701&toTeamName=Ddp02.FC">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1701">
                                        <a href="/user/profile/1701"><i class="fa fa-user" aria-hidden="true"></i> Phạm Quang</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1701);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Mới chơi
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Nhóm tuổi: </strong> Dưới 19 tuổi
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong>07:30 - 10:30 Thứ Bảy hàng tuần - <a href="">sân đh công đoàn</a>

                                    </p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9438" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9438&toUserId=1701&toTeamName=Ddp02.FC">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/fc-phich-thu.html" title="Fc phịch thủ"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="Fc phịch thủ" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/fc-phich-thu.html" title="Fc phịch thủ">Fc phịch thủ</a></h2>

                                        <button idd="9431" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9431&toUserId=1699&toTeamName=Fc phịch thủ">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1699">
                                        <a href="/user/profile/1699"><i class="fa fa-user" aria-hidden="true"></i> Vũ hồng Trung</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1699);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh yếu
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Nhóm tuổi: </strong> Dưới 36 tuổi
                                    </p>



                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9431" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9431&toUserId=1699&toTeamName=Fc phịch thủ">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/xwatch.html" title="Xwatch"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="Xwatch" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/xwatch.html" title="Xwatch">Xwatch</a></h2>

                                        <button idd="9425" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9425&toUserId=1698&toTeamName=Xwatch">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1698">
                                        <a href="/user/profile/1698"><i class="fa fa-user" aria-hidden="true"></i> Phạm  C&#244;ng</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1698);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p class="quost-doi">Xwatch l&#224; đội b&#243;ng văn ph&#242;ng c&#244;ng ty chuy&#234;n kinh doanh đồng hồ</p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh yếu
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Nhóm tuổi: </strong> Dưới 85 tuổi
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong>20:30 - 22:00 Thứ Năm hàng tuần - <a href="">Sân bóng Thủy Lợi</a>

                                    </p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9425" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9425&toUserId=1698&toTeamName=Xwatch">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/anh-em.html" title="Anh Em"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="Anh Em" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/anh-em.html" title="Anh Em">Anh Em</a></h2>

                                        <button idd="9400" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9400&toUserId=1695&toTeamName=Anh Em">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1695">
                                        <a href="/user/profile/1695"><i class="fa fa-user" aria-hidden="true"></i> Ho&#224;ng Phạm Ngọc Ho&#224;ng</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1695);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong><a href="/san-bong-phuc-anh.html">Sân bóng Phúc Anh</a>

                                    </p>
                                    <p><i class="fa fa-map-o" aria-hidden="true"></i><strong> Địa chỉ:</strong> Ng&#245; 72 Trần Th&#225;i T&#244;ng, Dịch Vọng (Quận Cầu Giấy H&#224; Nội)</p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9400" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9400&toUserId=1695&toTeamName=Anh Em">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/spectos.html" title="Spectos"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="Spectos" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/spectos.html" title="Spectos">Spectos</a></h2>

                                        <button idd="9399" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9399&toUserId=1695&toTeamName=Spectos">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1695">
                                        <a href="/user/profile/1695"><i class="fa fa-user" aria-hidden="true"></i> Ho&#224;ng Phạm Ngọc Ho&#224;ng</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1695);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh kh&#225;
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong>19:00 - 20:30 Thứ Ba hàng tuần - <a href="/san-bong-phuc-anh.html">Sân bóng Phúc Anh (Sân 7 số 1)</a>

                                        <span class="price-san">800.000<sup>vnđ</sup> / trận</span>
                                    </p>
                                    <p><i class="fa fa-map-o" aria-hidden="true"></i><strong> Địa chỉ:</strong> Ng&#245; 72 Trần Th&#225;i T&#244;ng, Dịch Vọng (Quận Cầu Giấy H&#224; Nội)</p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9399" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9399&toUserId=1695&toTeamName=Spectos">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/xacaca" title="xacaca"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="xacaca" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/xacaca" title="xacaca">xacaca</a></h2>

                                        <button idd="9367" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9367&toUserId=1689&toTeamName=xacaca">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1689">
                                        <a href="/user/profile/1689"><i class="fa fa-user" aria-hidden="true"></i> van ba</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1689);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Nhóm tuổi: </strong> Dưới 30 tuổi
                                    </p>

                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong> Sân nhà:</strong>15:00 - 20:00 Chủ Nhật hàng tuần

                                    </p>


                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9367" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9367&toUserId=1689&toTeamName=xacaca">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="/fc-ae-mo-lao-262011.html" title="FC Ae Mỗ Lao"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="FC Ae Mỗ Lao" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/fc-ae-mo-lao-262011.html" title="FC Ae Mỗ Lao">FC Ae Mỗ Lao</a></h2>

                                        <button idd="9365" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9365&toUserId=1688&toTeamName=FC Ae Mỗ Lao">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1688">
                                        <a href="/user/profile/1688"><i class="fa fa-user" aria-hidden="true"></i> Fc Ae Mỗ Lao</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1688);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> Trung b&#236;nh
                                    </p>



                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9365" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9365&toUserId=1688&toTeamName=FC Ae Mỗ Lao">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                    </ul>
                    <div class="col-md-12">
                        <div class="pagination_container">
                        	<div class="pagination">
                        		<span class="fix-pagination-padding noLinkPager hnpageprev_inactive">
                        			<i class="fa fa-angle-left" aria-hidden="true"></i>
                        		</span>
                        		<span class="noLinkPager hncurrpage">1</span>
		                       	<a href="/doi-bong-tai-ha-noi?pi=2" class="linkPager hnpagelink" title="2">
		                        	<span class="hnotherpage">2</span>
		                        </a>
		                        <a href="/doi-bong-tai-ha-noi?pi=3" class="linkPager hnpagelink" title="3">
		                        	<span class="hnotherpage">3</span>
		                        </a>
		                        
		                        <a href="/doi-bong-tai-ha-noi?pi=4" class="linkPager hnpagelink" title="390">
		                        	<span class="hnotherpage">390</span>
		                        </a>
		                        
		                        <a href="/doi-bong-tai-ha-noi?pi=2" class="fix-pagination-paddinglinkPager hnpagenext" title="Trang sau">
		                        	<span class="fix-pagination-padding hnotherpage">
		                        		<i class="fa fa-angle-right" aria-hidden="true"></i>
		                        	</span>
		                        </a>
                        	</div>
                        </div>
                    </div>

                    <div class="form-filter-doi">
                        <div class="title-btn-moi-doi">
                            <span>team của bạn Không tìm được đối tác phù hợp?</span>
                            <a href="#" class="btn btn-default btn-moi-doi btn-link-moi-doi modal-link-angularjs" data-modal-tpl="match.create" login-required="true"><i class="fa fa-beer" aria-hidden="true"></i> Mời đối giao lưu</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--#top hero box-->
<style type="text/css">
    .sp-autocomplete img {
        display: none;
    }
</style>
<script type="text/javascript">
    function onSearchMatchStadiumSelectedChange(data) {
        $('#searchMatchStadiumId').val(data.params.data.id);
    }
</script>
