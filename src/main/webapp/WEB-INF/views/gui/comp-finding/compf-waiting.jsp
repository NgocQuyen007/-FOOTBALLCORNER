<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="breadcrum">
    <div class="container">
        <div class="breadcrum-line">
            <a href="/">Trang chủ</a>
            <a href="/tim-doi-da-bong" class="" title="T&#236;m đối đ&#225; b&#243;ng">T&#236;m đối đ&#225; b&#243;ng</a>
            <a>T&#236;m đối đ&#225; b&#243;ng tại H&#224; Nội</a>
        </div>
    </div>
</div>

<div class="content-wrap" ng-controller="matchFindingCtrl">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="sidebar-filter-container">
                    <div class="m-btn-expand-holder mobile-only">
                        <span class="form-filter-san-span">Lọc kết quả <i class="fa fa-filter" aria-hidden="true"></i></span>
                    </div>
                    <h2 id="a" class="title-intent title-pages mobile-hidden"><i class="fa fa-filter" aria-hidden="true"></i>Lọc kết quả</h2>


                    <div class="sidebar sidebar-tim-doi">
                        <ul class="list-left-links list-left-check">
                            <li>
                                <strong>S&#226;n nh&#224;</strong>
                                <ul>
                                    <li onclick="location.href='/tim-doi-da-bong-tai-ha-noi?hasstadium=1';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="eeeeee2fo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> C&#243; s&#226;n nh&#224;
                                                <span class="pull-right filter-count">162</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/tim-doi-da-bong-tai-ha-noi?hasstadium=0';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fdsso" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Cần đi kh&#225;ch
                                                <span class="pull-right filter-count">103</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <strong>Tr&#236;nh độ</strong>
                                <ul>
                                    <li onclick="location.href='/tim-doi-da-bong-tai-ha-noi?level=6';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fdsswo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Mềm
                                                <span class="pull-right filter-count">7</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/tim-doi-da-bong-tai-ha-noi?level=1';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fhgro" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Mới chơi
                                                <span class="pull-right filter-count">1</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/tim-doi-da-bong-tai-ha-noi?level=2';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Trung b&#236;nh
                                                <span class="pull-right filter-count">59</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/tim-doi-da-bong-tai-ha-noi?level=3';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fsdso" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Trung b&#236;nh kh&#225;
                                                <span class="pull-right filter-count">9</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/tim-doi-da-bong-tai-ha-noi?level=5';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fdssso" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Trung b&#236;nh yếu
                                                <span class="pull-right filter-count">194</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </li>

                        </ul>

                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class="p-content">
                    <h1 id="wqwa" class="title-intent title-pages"><i class="fa fa-futbol-o" aria-hidden="true"></i>T&#236;m đối đ&#225; b&#243;ng tại H&#224; Nội</h1>
                    <div class="form-group list-search-top">
                        <form method="get" action="https://www.timdoinhanh.com/tim-doi-da-bong-tai-ha-noi" class="search-form">
                            <div class="col-md-6 nopaddingleft">
                                <input type="text" class="form-control input-sm" name="keyword" placeholder="Nhập tên khu vực, đội bóng hoặc sân bóng..." />
                            </div>

                            <div class="col-md-4 nopaddingleft">
                                <div class="input-group date frm-date-time">
                                    <input id="matchFindingListSearchTime" placeholder="Thời gian" name="time" type='text' class="form-control input-sm jqueryDateTimePickerEnabled" />
                                    <label class="input-group-addon btn" for="matchFindingListSearchTime">
                                        <span class="glyphicon glyphicon-calendar">
                                        </span>
                                    </label>
                                </div>
                            </div>

                            <div class="col-md-2 nopadding">
                                <button class="btn btn-sm btn-default width-100p" type="submit">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>

                    <ul class="list-item-san">


                        <li class="item-card match-finding-item" idd="38281">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-ki-luat.html?matchId=38281" title="Fc kỉ luật">Fc kỉ luật<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng viettel 2</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1572">
                                                <a href="/user/profile/1572"><i class="fa fa-user" aria-hidden="true"></i> Hà Đen</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1572);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=8925&toUserId=1572&toMatchId=38281&matchId=38281&teamId=8925&toTeamName=Fc kỉ luật">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>19h00 Thứ Hai ngày 23/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-viettel-2.html" target="_blank">Sân bóng viettel 2</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Ngõ 155, Ngách 155/206 Trường Chinh - Cầu Phương Liệt (Quận Thanh Xuân Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh yếu
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        3-4-5
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Thân mời ae giao lưu ạ . Đội e cũng toàn các anh các chú dưỡng sinh thôi ạ . Sđt : 01237884033
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
                                            <span class="dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-angle-down" aria-hidden="true"></i>
                                            </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=8925&toUserId=1572&toMatchId=38281&matchId=38281&teamId=8925&toTeamName=Fc kỉ luật">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="40994">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-ha-nam-262011.html?matchId=40994" title="FC H&#224; Nam">FC H&#224; Nam<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n Đại Từ</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1712">
                                                <a href="/user/profile/1712"><i class="fa fa-user" aria-hidden="true"></i> Nguyễn Ba</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1712);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=9455&toUserId=1712&toMatchId=40994&matchId=40994&teamId=9455&toTeamName=FC H&#224; Nam">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>19h30 Thứ Hai ngày 23/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a target="_blank">Sân Đại Từ</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Tất cả, Hà Nội</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        2-4-6
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Anh em văn phòng , đá văn nghệ cho khỏe 0972.506.343
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=9455&toUserId=1712&toMatchId=40994&matchId=40994&teamId=9455&toTeamName=FC H&#224; Nam">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="40358">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/tan-phat-fc.html?matchId=40358" title="Tấn Ph&#225;t FC">Tấn Ph&#225;t FC<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng đ&#225; Gi&#225;p Nhất</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1170">
                                                <a href="/user/profile/1170"><i class="fa fa-user" aria-hidden="true"></i> Từ Việt An</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1170);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=7364&toUserId=1170&toMatchId=40358&matchId=40358&teamId=7364&toTeamName=Tấn Ph&#225;t FC">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>17h30 Thứ Ba ngày 24/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-da-giap-nhat.html" target="_blank">Sân bóng đá Giáp Nhất</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Hẻm 62 , ngách 1, ngõ 72, Nguyễn Trãi, Nhân Chính (Quận Thanh Xuân Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Mềm
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        Thỏa thuận
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Đội bóng Công ty Cổ phần Tấn Phát gồm toàn các anh em văn phòng, trình độ mềm, không ctm.<br>Ae có nhu cầu giao lưu liên hệ 01688774627 (Ngọc 1994)
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=7364&toUserId=1170&toMatchId=40358&matchId=40358&teamId=7364&toTeamName=Tấn Ph&#225;t FC">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="40727">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/anh-em.html?matchId=40727" title="Anh Em">Anh Em<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng Ph&#250;c Anh</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1695">
                                                <a href="/user/profile/1695"><i class="fa fa-user" aria-hidden="true"></i> Hoàng Phạm Ngọc Hoàng</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1695);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=9400&toUserId=1695&toMatchId=40727&matchId=40727&teamId=9400&toTeamName=Anh Em">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>19h00 Thứ Ba ngày 24/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-phuc-anh.html" target="_blank">Sân bóng Phúc Anh</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Ngõ 72 Trần Thái Tông, Dịch Vọng (Quận Cầu Giấy Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Anh em văn phòng đá giao lưu vui vẻ, sân nước 50-50
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=9400&toUserId=1695&toMatchId=40727&matchId=40727&teamId=9400&toTeamName=Anh Em">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="40600">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-ae-mo-lao-262011.html?matchId=40600" title="FC Ae Mỗ Lao">FC Ae Mỗ Lao</a>
                                                <a href="/tim-doi-da-bong-tai-ha-noi?hasstadium=0">
                                                    <i class="fa fa-caret-right" aria-hidden="true"></i>Cần đi khách</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1688">
                                                <a href="/user/profile/1688"><i class="fa fa-user" aria-hidden="true"></i> Fc Ae Mỗ Lao </a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1688);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.invitation"
                                                    login-required="true" data-modal-qs="toTeamId=9365&toUserId=1688&toMatchId=40600&matchId=40600&teamId=9365&toTeamName=FC Ae Mỗ Lao">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>20h30 Thứ Ba ngày 24/04/2018</p>

                                    <p class="guest-stadium-list">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Khu vực:</strong><a href="/tim-doi-da-bong-tai-ha-noi?keyword=H%c3%a0+%c4%90%c3%b4ng" target="_blank" class="label label-success">Hà Đông</a>
                                    </p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        Thỏa thuận
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Ae đam mê bóng đá cùng giao lưu nhé
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.invitation"
                                                login-required="true" data-modal-qs="toTeamId=9365&toUserId=1688&toMatchId=40600&matchId=40600&teamId=9365&toTeamName=FC Ae Mỗ Lao">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="34879">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/esolution.html?matchId=34879" title="Esolution">Esolution<i class="fa fa-caret-right" aria-hidden="true"></i>Th&#224;nh l&#226;m green park dương đ&#236;nh nghệ</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1440">
                                                <a href="/user/profile/1440"><i class="fa fa-user" aria-hidden="true"></i> Minh Đức Trần Minh Đức</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1440);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=8349&toUserId=1440&toMatchId=34879&matchId=34879&teamId=8349&toTeamName=Esolution">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>19h00 Thứ Tư ngày 25/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a target="_blank">Thành lâm green park dương đình nghệ</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Tất cả, Hà Nội</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh, Trung b&#236;nh yếu, Mềm
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        Thỏa thuận
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Giao lưu trên tinh thần rèn luyện sức khỏe,toàn anh em bụng to khối văn phòng, không khô máu , quả khó thì bỏ  nha ae
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=8349&toUserId=1440&toMatchId=34879&matchId=34879&teamId=8349&toTeamName=Esolution">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="39329">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/doi-bong-vien-han-lam-khoa-hoc-xa-hoi-viet-nam.html?matchId=39329" title="Đội b&#243;ng Viện H&#224;n l&#226;m Khoa học x&#227; hội Việt Nam">Đội b&#243;ng Viện H&#224;n l&#226;m Khoa học x&#227; hội Việt Nam<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng Th&#224;nh Đồng</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1601">
                                                <a href="/user/profile/1601"><i class="fa fa-user" aria-hidden="true"></i> Lê Ngọc Điển</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1601);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=9094&toUserId=1601&toMatchId=39329&matchId=39329&teamId=9094&toTeamName=Đội b&#243;ng Viện H&#224;n l&#226;m Khoa học x&#227; hội Việt Nam">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>17h30 Thứ Năm ngày 26/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-thanh-dong-26677211.html" target="_blank">Sân bóng Thành Đồng</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Nam Trung Yên, Trung Hoà (Quận Cầu Giấy Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        3-4-5
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Đội bóng đá nam Viện Hàn lâm KHXH Việt Nam toàn các đồng chí mắt cận đá ko hay nhưng yêu thích đá bóng, tuy nhiên vì lý do muốn được tham gia giao lưu với nhiều đội khách nhau để có một cái nhìn khái quát về các đội bóng phong trào. Thi đấu trên tinh thần fair play ko cay cú ăn thua, ko chân tay miệng... Chỉ là đá vui  nâng cao sức khỏe sau những ngày kết thúc công việc thứ 5 hàng tuần. Mời tất cả những đội khác tham gia giao lưu, điện thoại liên hệ Điển ( 1979 số đt 0908424882).
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=9094&toUserId=1601&toMatchId=39329&matchId=39329&teamId=9094&toTeamName=Đội b&#243;ng Viện H&#224;n l&#226;m Khoa học x&#227; hội Việt Nam">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="39811">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-dong-doi.html?matchId=39811" title="FC Đồng Đội">FC Đồng Đội<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng Trung K&#237;nh Hạ</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="162">
                                                <a href="/user/profile/162"><i class="fa fa-user" aria-hidden="true"></i> Phan Trung Tiến</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(162);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=89&toUserId=162&toMatchId=39811&matchId=39811&teamId=89&toTeamName=FC Đồng Đội">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>17h30 Thứ Năm ngày 26/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-trung-kinh-ha.html" target="_blank">Sân bóng Trung Kính Hạ</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Số 6 Nguyễn Chánh, Trung Hoà (Quận Cầu Giấy Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        Thỏa thuận
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Fc Đồng Đội cần tìm đối tác Chủ Nhật hàng tuần khung giờ 17h30 sân Trung Kính Hạ .Giao lưu vui vẻ không chân tay miệng xin liên hệ Mr Tiến 0908839218
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=89&toUserId=162&toMatchId=39811&matchId=39811&teamId=89&toTeamName=FC Đồng Đội">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="38948">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi team-logo-enabled">
                                        <div class="match-team-logo">
                                            <a href="/lg2018?matchId=38948" title="Lạng Giang Plus">
                                                <img class="img-responsive" src="https://res.givator.com/pictures/11017/600/2018_03/medium/keepingyourpcsafethumb_2.jpg" align="thumbnail" alt="Lạng Giang Plus">
                                            </a>
                                        </div>
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/lg2018?matchId=38948" title="Lạng Giang Plus">Lạng Giang Plus</a>
                                                <a href="/tim-doi-da-bong-tai-ha-noi?hasstadium=0">
                                                    <i class="fa fa-caret-right" aria-hidden="true"></i>Cần đi khách</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="110">
                                                <a href="/user/profile/110"><i class="fa fa-user" aria-hidden="true"></i> CHU NHAT</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(110);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.invitation"
                                                    login-required="true" data-modal-qs="toTeamId=7188&toUserId=110&toMatchId=38948&matchId=38948&teamId=7188&toTeamName=Lạng Giang Plus">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>19h00 Thứ Sáu ngày 27/04/2018</p>

                                    <p class="guest-stadium-list">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Khu vực:</strong><a href="/tim-doi-da-bong-tai-ha-noi?keyword=L%c3%aa+V%c4%83n+L%c6%b0%c6%a1ng" target="_blank" class="label label-success">Lê Văn Lương</a> <a href="/tim-doi-da-bong-tai-ha-noi?keyword=Ho%c3%a0ng+Minh+Gi%c3%a1m" target="_blank" class="label label-success">Hoàng Minh Giám</a> <a href="/tim-doi-da-bong-tai-ha-noi?keyword=L%c3%aa+Tr%e1%bb%8dng+T%e1%ba%a5n" target="_blank" class="label label-success">Lê Trọng Tấn</a>
                                    </p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh yếu
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        Thỏa thuận
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Đội ae cùng quê Lạng Giang, Bắc Giang. Cam kết đá đẹp ko chân tay miệng
                                    </p>
                                    <img src="https://res.givator.com/pictures/11017/600/2018_03/original/keepingyourpcsafethumb_3.jpg" alt="Lạng Giang Plus" class="img-responsive margin-top-10" />

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.invitation"
                                                login-required="true" data-modal-qs="toTeamId=7188&toUserId=110&toMatchId=38948&matchId=38948&teamId=7188&toTeamName=Lạng Giang Plus">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="37003">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi team-logo-enabled">
                                        <div class="match-team-logo">
                                            <a href="/fc-street-262868011.html?matchId=37003" title="Fc Street">
                                                <img class="img-responsive" src="https://res.givator.com/pictures/11017/600/2018_03/medium/28619285102131383069867171459988820157298946o.jpg" align="thumbnail" alt="Fc Street">
                                            </a>
                                        </div>
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-street-262868011.html?matchId=37003" title="Fc Street">Fc Street<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng đ&#225; Minh Kiệt 104 Nguyễn An Ninh</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1520">
                                                <a href="/user/profile/1520"><i class="fa fa-user" aria-hidden="true"></i> Trieu  Hung</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1520);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=8680&toUserId=1520&toMatchId=37003&matchId=37003&teamId=8680&toTeamName=Fc Street">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>19h00 Thứ Sáu ngày 27/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-da-minh-kiet-104-nguyen-an-ninh.html" target="_blank">Sân bóng đá Minh Kiệt 104 Nguyễn An Ninh</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>104 Nguyễn An Ninh, Tương Mai (Quận Hoàng Mai Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        Thỏa thuận
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Fc Street độ tuổi trung bình trên 30 ,tìm đối đá giao lưu tránh va chạm . Tiền sân 4-5-6, hoặc 50-50
                                    </p>
                                    <img src="https://res.givator.com/pictures/11017/600/2018_03/original/12729223102071569529366048321664891562388864n.jpg" alt="Fc Street" class="img-responsive margin-top-10" />

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=8680&toUserId=1520&toMatchId=37003&matchId=37003&teamId=8680&toTeamName=Fc Street">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="37591">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-dong-doi.html?matchId=37591" title="FC Đồng Đội">FC Đồng Đội<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng Trung K&#237;nh Hạ</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="162">
                                                <a href="/user/profile/162"><i class="fa fa-user" aria-hidden="true"></i> Phan Trung Tiến</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(162);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=89&toUserId=162&toMatchId=37591&matchId=37591&teamId=89&toTeamName=FC Đồng Đội">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>17h30 Chủ Nhật ngày 29/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-trung-kinh-ha.html" target="_blank">Sân bóng Trung Kính Hạ</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Số 6 Nguyễn Chánh, Trung Hoà (Quận Cầu Giấy Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        4-4
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Fc Đồng Đội cần tìm đối tác Chủ Nhật hàng tuần khung giờ 17h30 sân Trung Kính Hạ .Giao lưu vui vẻ không chân tay miệng xin liên hệ Mr Tiến 0908839218
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=89&toUserId=162&toMatchId=37591&matchId=37591&teamId=89&toTeamName=FC Đồng Đội">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="38282">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-ki-luat.html?matchId=38282" title="Fc kỉ luật">Fc kỉ luật<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng viettel 2</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1572">
                                                <a href="/user/profile/1572"><i class="fa fa-user" aria-hidden="true"></i> Hà Đen</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1572);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=8925&toUserId=1572&toMatchId=38282&matchId=38282&teamId=8925&toTeamName=Fc kỉ luật">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>19h00 Thứ Hai ngày 30/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-viettel-2.html" target="_blank">Sân bóng viettel 2</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Ngõ 155, Ngách 155/206 Trường Chinh - Cầu Phương Liệt (Quận Thanh Xuân Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh yếu
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        3-4-5
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Thân mời ae giao lưu ạ . Đội e cũng toàn các anh các chú dưỡng sinh thôi ạ . Sđt : 01237884033
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=8925&toUserId=1572&toMatchId=38282&matchId=38282&teamId=8925&toTeamName=Fc kỉ luật">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="40995">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-ha-nam-262011.html?matchId=40995" title="FC H&#224; Nam">FC H&#224; Nam<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n Đại Từ</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1712">
                                                <a href="/user/profile/1712"><i class="fa fa-user" aria-hidden="true"></i> Nguyễn Ba</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1712);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=9455&toUserId=1712&toMatchId=40995&matchId=40995&teamId=9455&toTeamName=FC H&#224; Nam">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>19h30 Thứ Hai ngày 30/04/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a target="_blank">Sân Đại Từ</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Tất cả, Hà Nội</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        2-4-6
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Anh em văn phòng , đá văn nghệ cho khỏe 0972.506.343
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=9455&toUserId=1712&toMatchId=40995&matchId=40995&teamId=9455&toTeamName=FC H&#224; Nam">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="40359">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/tan-phat-fc.html?matchId=40359" title="Tấn Ph&#225;t FC">Tấn Ph&#225;t FC<i class="fa fa-caret-right" aria-hidden="true"></i>S&#226;n b&#243;ng đ&#225; Gi&#225;p Nhất</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1170">
                                                <a href="/user/profile/1170"><i class="fa fa-user" aria-hidden="true"></i> Từ Việt An</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1170);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                    login-required="true" data-modal-qs="toTeamId=7364&toUserId=1170&toMatchId=40359&matchId=40359&teamId=7364&toTeamName=Tấn Ph&#225;t FC">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>17h30 Thứ Ba ngày 01/05/2018</p>

                                    <p class="item-stadium-p">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="/san-bong-da-giap-nhat.html" target="_blank">Sân bóng đá Giáp Nhất</a>
                                    </p>
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>Hẻm 62 , ngách 1, ngõ 72, Nguyễn Trãi, Nhân Chính (Quận Thanh Xuân Hà Nội)</p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Mềm
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        Thỏa thuận
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Đội bóng Công ty Cổ phần Tấn Phát gồm toàn các anh em văn phòng, trình độ mềm, không ctm.<br>Ae có nhu cầu giao lưu liên hệ 01688774627 (Ngọc 1994)
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=7364&toUserId=1170&toMatchId=40359&matchId=40359&teamId=7364&toTeamName=Tấn Ph&#225;t FC">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>


                        <li class="item-card match-finding-item" idd="40601">
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>

                                                <a href="/fc-ae-mo-lao-262011.html?matchId=40601" title="FC Ae Mỗ Lao">FC Ae Mỗ Lao</a>
                                                <a href="/tim-doi-da-bong-tai-ha-noi?hasstadium=0">
                                                    <i class="fa fa-caret-right" aria-hidden="true"></i>Cần đi khách</a>
                                            </h2>
                                            <p class="captain-item noborder" owner-id="1688">
                                                <a href="/user/profile/1688"><i class="fa fa-user" aria-hidden="true"></i> Fc Ae Mỗ Lao </a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh" ng-click="onQuickChat(1688);"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">

                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.invitation"
                                                    login-required="true" data-modal-qs="toTeamId=9365&toUserId=1688&toMatchId=40601&matchId=40601&teamId=9365&toTeamName=FC Ae Mỗ Lao">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>



                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>20h30 Thứ Ba ngày 01/05/2018</p>

                                    <p class="guest-stadium-list">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Khu vực:</strong><a href="/tim-doi-da-bong-tai-ha-noi?keyword=H%c3%a0+%c4%90%c3%b4ng" target="_blank" class="label label-success">Hà Đông</a>
                                    </p>
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Trình độ:</strong>Trung b&#236;nh
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Kèo:</strong>
                                        Thỏa thuận
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        Ae đam mê bóng đá cùng giao lưu nhé
                                    </p>

                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
    <span class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.invitation"
                                                login-required="true" data-modal-qs="toTeamId=9365&toUserId=1688&toMatchId=40601&matchId=40601&teamId=9365&toTeamName=FC Ae Mỗ Lao">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="col-md-12">
                        <div class="pagination_container">
                        <div class="pagination">
                        <span class="fix-pagination-padding noLinkPager hnpageprev_inactive">
                        <i class="fa fa-angle-left" aria-hidden="true"></i></span><span class="noLinkPager hncurrpage">1</span><a href="/tim-doi-da-bong-tai-ha-noi?pi=2" class="linkPager hnpagelink" title="2"><span class="hnotherpage">2</span></a><a href="/tim-doi-da-bong-tai-ha-noi?pi=3" class="linkPager hnpagelink" title="3"><span class="hnotherpage">3</span></a><a href="/tim-doi-da-bong-tai-ha-noi?pi=4" class="linkPager hnpagelink" title="4"><span class="hnotherpage">4</span></a><a href="/tim-doi-da-bong-tai-ha-noi?pi=5" class="linkPager hnpagelink" title="5"><span class="hnotherpage">5</span></a><span class="noLinkPager dot">...</span><a href="/tim-doi-da-bong-tai-ha-noi?pi=17" class="linkPager hnpagelink" title="17"><span class="hnotherpage">17</span></a><a href="/tim-doi-da-bong-tai-ha-noi?pi=18" class="linkPager hnpagelink" title="18"><span class="hnotherpage">18</span></a>
                        <a href="/tim-doi-da-bong-tai-ha-noi?pi=2" class="linkPager hnpagenext" title="Trang sau">
                        <span class="fix-pagination-padding hnotherpage"><i class="fa fa-angle-right" aria-hidden="true"></i></span></a></div></div>
                    </div>

                    <div class="form-filter-doi">
                        <div class="title-btn-moi-doi">
                            <span>Team của bạn Không tìm được đối tác phù hợp?</span>
                            <a href="javascript:void(0)" class="btn btn-default btn-moi-doi btn-link-moi-doi modal-link-angularjs" data-modal-tpl="match.create" login-required="true"><i class="fa fa-beer" aria-hidden="true"></i> Mời đối giao lưu</a>
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
