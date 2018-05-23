<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>


<div class="top-banner-box top-banner-box-doi">
    <div class="container">
        <p class="page-title"></p>
        <div class="team-banner-btn-container">
            <a class="btn btn-info btn-sm" href="javascript:void(0);">
                <i class="fa fa-send-o"></i>
                Tham gia đội bóng
            </a>
            <a idd="9293" class="btn btn-info btn-sm modal-link-angularjs" data-modal-tpl="match.invitation" login-required="true" data-modal-qs="toTeamId=9293&amp;toUserId=1428&amp;toTeamName=fc2013_t4">
                <i class="fa fa-calendar" aria-hidden="true"></i> Mời đối
            </a>
        </div>
    </div>
</div>
<div class="tabs-chi-tiet-doi">
    <div class="container">
        <div class="img-doio"><img class="img-responsive" src='<c:url value="/resources/common/img/sis_1.jpg" />' align="thumb"></div>
        <div class="title-doi">
                    <h1>fc2013_t4<span class="gender"><i class="fa fa-mars" aria-hidden="true"></i></span></h1>
                    <p class="captain-item" owner-id="1428">
                        <span class="mobile-hidden">
                            <a href="${contextPath}/user/profile">Quyen Phan</a> (đội trưởng)
                            <span class="captain-item-status offline"></span>
                        </span>
                        <span class="chat-nhanh chat-nhanh-offline" ng-click="onQuickChat(1428);" title="Click để chat nhanh với đối."><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                    </p>
                </div>
                <div class="wrap-ul-doi">
                    <ul class="list-link-doi">
                        <li class="active"><a href="${contextPath}/team/management?tab=timdoi">Tìm đối</a></li>
                        <li><a href="${contextPath}/team/management?tab=thanhvien">Thành viên</a></li>
                        <li><a href="${contextPath}/team/management?tab=gioithieu">Giới thiệu</a></li>
                        <li><a >Quỹ bóng</a></li>
                        <li>
                            <a >
                                <i class="fa fa-gear"></i> Cập nhật thông tin
                            </a>
                        </li>
                    </ul>
                </div>
    </div>
</div>
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-8" id="chitiet-doi-left">
                <div class="content-cts">
<div class="item-card">
    <div class="row">
        <div class="col-md-12">
            <div class="right-item-san right-item-doi right-item-doi-ct">
                <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                    <ul class="nav nav-tabs" id="myTabs" role="tablist">
                        <li role="presentation" class="active"><a href="https://www.timdoinhanh.com/fc2013_t4?tab=thanhvien#dsdtd" id="dsdtd-tab" role="tab" data-toggle="tab" aria-controls="dsdtd" aria-expanded="true">Thành viên đội</a></li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade in active" role="tabpanel" id="dsdtd" aria-labelledby="dsdtd-tab">
                            <table class="table table-striped table-doi">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Avatar</th>
                                        <th>Họ tên</th>
                                        <th>Số áo</th>
                                        <th>Vị trí</th>
                                    </tr>
                                </thead>
                                <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td><img class="img-responsive avatar-list" src='<c:url value="/resources/common/img/default-user.png" />' align="thumb" alt="Quyen Phan"></td>
                                                <td>Quyen Phan</td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
                </div>
            </div>

            <div class="col-md-4" id="chitiet-doi-right">


    <div class="sidebar sidebar-tien-san">
        <p class="title-box">
            <i class="fa fa-soccer-ball-o" aria-hidden="true"></i> Cùng trình độ
        </p>
        <div class="list-doi-new">
            <ul class="ul-list-doi-new">
                    <li>
                        <div class="doi-lis-img">
                            <a href="https://www.timdoinhanh.com/take-down-fc.html"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="Take down FC" align="thumbnail"></a>
                        </div>
                        <div class="doi-lis-content">
                            <h3>
                                <a href="https://www.timdoinhanh.com/take-down-fc.html" title="Take down FC">Take down FC</a>
                            </h3>
                                <p>
                                    <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                    Mới chơi
                                </p>
                                                    </div>
                    </li>
                    <li>
                        <div class="doi-lis-img">
                            <a href="https://www.timdoinhanh.com/vcr.html"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="VCR" align="thumbnail"></a>
                        </div>
                        <div class="doi-lis-content">
                            <h3>
                                <a href="https://www.timdoinhanh.com/vcr.html" title="VCR">VCR</a>
                            </h3>
                                <p>
                                    <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                    Mới chơi
                                </p>
                                                    </div>
                    </li>
                    <li>
                        <div class="doi-lis-img">
                            <a href="https://www.timdoinhanh.com/fc-bsh-262011-262012.html"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="FC BSH" align="thumbnail"></a>
                        </div>
                        <div class="doi-lis-content">
                            <h3>
                                <a href="https://www.timdoinhanh.com/fc-bsh-262011-262012.html" title="FC BSH">FC BSH</a>
                            </h3>
                                <p>
                                    <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                    Mới chơi
                                </p>
                                                    </div>
                    </li>
                    <li>
                        <div class="doi-lis-img">
                            <a href="https://www.timdoinhanh.com/fc-bsh-262011.html"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="FC BSH" align="thumbnail"></a>
                        </div>
                        <div class="doi-lis-content">
                            <h3>
                                <a href="https://www.timdoinhanh.com/fc-bsh-262011.html" title="FC BSH">FC BSH</a>
                            </h3>
                                <p>
                                    <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                    Mới chơi
                                </p>
                                <p class="quost-doi">
                                	Đội FC BSH mới thành lập chủ yếu toàn anh em dân văn phòng mới đá hoặc đá yếu, giao lưu vui vẻ nâng cao sức khỏe là chính
									Mời các anh em dân văn phòng (ưu tiên các bác FC mảng Bảo hiểm hoặc Ngân hàng) để giao lưu kết hợp.</p>
                        </div>
                    </li>
                    <li>
                        <div class="doi-lis-img">
                            <a href="https://www.timdoinhanh.com/fc-bsh.html"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="FC BSH" align="thumbnail"></a>
                        </div>
                        <div class="doi-lis-content">
                            <h3>
                                <a href="https://www.timdoinhanh.com/fc-bsh.html" title="FC BSH">FC BSH</a>
                            </h3>
                                <p>
                                    <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                    Mới chơi
                                </p>
                         </div>
                    </li>
            </ul>
            <a href="https://www.timdoinhanh.com/doi-bong?level=1&amp;provinceId=2" class="doi-xem-them"><i class="fa fa-long-arrow-right" aria-hidden="true"></i> Xem thêm</a>
        </div>
        <div class="clearfix"></div>
    	</div>
         </div>
        </div>
    </div>
</div>


