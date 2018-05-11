<%@page import="entities.PitchDetail"%>
<%@page import="entities.Cost"%>
<%@page import="dto.PitchInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp" %> 

<style>
    .ui-autocomplete {
        z-index: 9999;
    }

    #ticket-select-date table tr th {
        text-transform: capitalize;
    }
</style>


<c:set var="pitch" value="${pitch}" />

<c:set var="pitchDetails" value="${pitchDetails}"></c:set>
<c:set var="pitchInfodtos" value="${pitchInfodtos}"></c:set>

<%
	List<PitchDetail> pitchDetails = (List<PitchDetail>)pageContext.getAttribute("pitchDetails");
	List<PitchInfoDto> pitchInfodtos = (List<PitchInfoDto>)pageContext.getAttribute("pitchInfodtos");
%>

<%!
	public List<PitchDetail> getPitchDetailsByPitchId(int pitchId, List<PitchDetail> pitchDetails) {
		List<PitchDetail> pitchDetailByPitchIds = new ArrayList<>();
		for(PitchDetail item: pitchDetails) {
			if(item.getPitch().getId() == pitchId) {
				pitchDetailByPitchIds.add(item);
			}
		}
		return pitchDetailByPitchIds;
	}
%>

<div class="breadcrum">
    <div class="container">
        <div class="breadcrum-line">
            <a href="/">Trang chủ</a>
            <a href="/san-bong" class="" title="Sân bóng">Sân bóng</a>
            <a href="/san-bong-tai-ho-chi-minh" class="" title="Sân bóng tại ${pitch.desName}">Sân bóng tại ${pitch.desName}</a>
            <a>${pitch.name}</a>
        </div>
    </div>
</div>

<div class="content-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="content-cts">
                    <div class="item-card">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h1 class="title-sans">${pitch.name}</h1>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="des-san">
                                            <div class="san-address-line">
                                                <i class="fa fa-map-o" aria-hidden="true"></i> ${pitch.detail} (${pitch.desName}, Đà Nẵng)
                                                <a href="javascript:showGmapPopup('map_canvas', 10.7779868, 106.6373224, 'Hệ Thống Sân Bóng Cỏ Nhân Tạo Nhân Việt HighSchool')"><span class="fa fa-map-marker"></span></a>
                                            </div>
                                            
                                           	<%
												PitchInfoDto pitch = (PitchInfoDto)pageContext.getAttribute("pitch");
												List<PitchDetail> pitchDetailByPitchIds = getPitchDetailsByPitchId(pitch.getId(), pitchDetails);
												for(PitchDetail pDetailById: pitchDetailByPitchIds) {
											%> 
                                            <div>
                                                <strong>Giá thuê sân <%=pDetailById.getPitchType().getId()%> người</strong>
                                            </div>
                                            
                                            <% 
												for (PitchInfoDto dto : pitchInfodtos) {
													if (dto.getPitchDetailId() != null) {
														if (dto.getPitchDetailId() == pDetailById.getId()) {
														pageContext.setAttribute("wdays", dto.getWdayStart());
														pageContext.setAttribute("wdaye", dto.getWdayEnd());
                                            %>
                                            
                                            <div class="san-price-line calendar-row" data-numberofplays="5" data-price="160000" data-stadiumId="1263" data-stadiumnumberid="06:00 - 09:00 Từ thứ 2-6">
                                                <%=dto.getHourStart()%>:00 - <%=dto.getHourEnd()%>:00  ${tagfunc:getWday(wdays,wdaye)}
                                                <div>
                                                    <span class="price-san"><%=dto.getPrice()%>.000<sup>vnđ</sup></span>
                                                    <button class="check-san" onclick="sport.stadiumDetail.showCalendar(this)">
                                                        <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Đặt sân
                                                    </button>
                                                </div>

                                                <div class="stadium-calendar">
                                                    <div class="stadium-container">
                                                    	<!-- HANDING BOOK STADIUM -->
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div style='display:none' class="san-price-line calendar-row">
                                            	<b style='color:purple'>HELLO STADIUM - CALLENDAR</b>
                                            </div>
                                            
                                            <% }}}} %>
                                            
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="title-img">Liên hệ đặt sân</div>
                                        <div class="des-san contact-info">
                                            <div class="phone-numb">
                                                <i class="fa fa-phone-square" aria-hidden="true"></i> <a href="/user/profile/1236" class="text-highlight" target="_blank">${pitch.fullName} - ${pitch.phoneNumber}</a>
                                                <div class="manager-chat user-online-status-container" owner-id="1236">
                                                    <span class="user-online-status offline"></span>
                                                    <span class="chat-nhanh" ng-click="onQuickChat(1236);"><i class="fa fa-comments" aria-hidden="true"></i> Liên hệ nhanh</span>
                                                </div>
                                            </div>
                                            <div class="des-email">
                                                <a href="${pitch.email}"><i class="fa fa-envelope" aria-hidden="true"></i> ${pitch.email} </a>
                                            </div>
                                            <div class="des-facebook">
                                                <a href="${pitch.facebook}" target="_blank"><i class="fa fa-facebook-square" aria-hidden="true"></i> ${pitch.facebook}</a>
                                            </div>
                                            <div class="des-website">
                                                <a href="${pitch.website}" target="_blank"><i class="fa fa-globe" aria-hidden="true"></i> ${pitch.website}</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="title-img">Giới thiệu về sân</div>
                                        <div class="content-sans">
                                            <p>${pitch.description}</p>
                                        </div>
                                        <div class="slider-home-banner slider-chi-san owl-carousel">
                                            <div>
                                                <img class="img-responsivex" src="https://vhtt.danang.gov.vn/documents/10180/3062926/SHB%20Da%20Nang.jpg?t=1520387088573" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/mocsanbongnhanviet.png" align="thumbnail">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="fb-comments" data-href="https://www.timdoinhanh.com/he-thong-san-bong-co-nhan-tao-nhan-viet-highschool-266126311.html" data-numposts="5"></div>
                </div>

            </div>
            
            
            <!--STadium list right-->
            <div class="col-md-4">
                <div class="sidebar sidebar-tien-san">
                    <p class="title-box"><i class="fa fa-map-marker" aria-hidden="true"></i> Sân bóng cùng địa bàn</p>
                    <div class="list-item-san list-item-san-sidebar">
                        <div class="slider-near-san owl-carousel">
                        	<c:forEach var="connectionPitch" items="${connectionPitches}">
	                            <div>
	                                <div class="item-card">
	                                    <div class="row">
	                                        <div class="col-md-12 item-preview-image">
	                                            <a href="/san-bong-da-tan-thoi-hoa.html" title="${connectionPitch.name}">
	                                                <img class="img-responsive" src="https://res.givator.com/pictures/11017/600/2017_11/medium/2321325515134632920560542406925300748229066o.jpg" alt="${connectionPitch.name}" align="thumbnail">
	                                            </a>
	                                        </div>
	                                        <div class="col-md-12 right-item-san">
	                                            <h2><a href="/san-bong-da-tan-thoi-hoa.html" class="item-name-link">${connectionPitch.name}</a></h2>
	                                            <p>
	                                                <i class="fa fa-map-o" aria-hidden="true"></i> ${connectionPitch.detail} (${connectionPitch.desName}, Đà Nẵng)
	                                                <a href="javascript:showGmapPopup('map_canvas', 10.76087, 106.6318, 'Sân Bóng Đá Tân Thới Hòa')"><span class="fa fa-map-marker"></span></a>
	                                            </p>
	                                            <p>Thông tin giá chưa được cập nhật. Bạn vui lòng gọi điện trực tiếp tới quản lý sân để biết thông tin giá </p>
	
	                                            <p class="phone-numb"><i class="fa fa-phone-square" aria-hidden="true"></i> ${connectionPitch.phoneNumber}</p>
	
	                                            <a href="${contextPath}/san-bong/${connectionPitch.id}" title="Sân Bóng Đá Tân Thới Hòa" class="btn-chi-tiet"><i class="fa fa-long-arrow-right" aria-hidden="true"></i> Chi tiết</a>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                        
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
            <!--Stadium list right END-->
        </div>
    </div>
</div>
<input type="hidden" id="hasSignin" value="True" />

<div class="hidden calendar-tpl">
    <div class="item-other-detail">
        <div id="ticket-select-date-time" class="ticket-select-date-time item-other-detail-section">
            <div class="item-other-detail-section-header">
                <strong>ĐẶT SÂN</strong>
            </div>
            <div class="row item-other-detail-section-content">
                <div class="form-group">
                    <div class="col-md-7">
                        <div id="ticket-select-date" class="ticket-select-date"></div>
                    </div>
                    <div class="col-md-5">
                        <div class="ticket-select-time-wrapper">
                            <div class="row">
                                <div class="col-xs-6 col-sm-12">
                                    <div class="ticket-select-time-title">NGÀY ĐẶT</div>
                                    <div class="ticket-select-day-summary"> <span class="currentDay"></span><small class="currentMonth"></small></div>
                                    <hr>
                                </div>
                                <div class="col-xs-6 col-sm-12">
                                    <input type="hidden" id="stadium-booking-data" />
                                    <div id="calendarBookingTime">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="booking-popup" class="modal fade" role="dialog" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 class="modal-title">Đặt sân</h3>
            </div> <!-- /.modal-header -->
            <div class="modal-body ">

            </div> <!-- /.modal-body -->
            <div class="modal-footer">
                <button onclick="sport.stadiumDetail.createBooking(event);" id="reserveCalendar"
                        data-loading-text="<i class='fa fa-spinner fa-spin '></i> Đang xử lý..."
                        class="btn btn-primary btn-primary-extra">
                    <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Đặt lịch
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
            </div> <!-- /.modal-footer -->
        </div> <!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<div class="hidden booking-info">
    <form class="form-horizontal">
        <div class="col-sm-12">
            <div class="form-group row">
                <label class="control-label col-md-2 col-xs-12">Thời gian:</label>
                <div class="col-xs-12 col-md-6">
                    <input type="text" class="form-control" disabled value="17:30 - 19:00 ngày 15/02/2017" id="selectedTimeText" />
                </div>
            </div>
            <div class="form-group row">
                <label class="control-label col-md-2 col-xs-12">Chọn Đội</label>
                <div class="col-xs-12 col-md-6">
                    <select class="form-control" id="ddlTeam" name="ddlTeam"><option value="9293">fc2013_t4</option>
                        <option value="8918">FC13T4</option>
                    </select>
                </div>
            </div>

            <div class="row form-group">
                <label class="control-label col-md-2 col-xs-12">Ghi chú:</label>
                <div class="col-xs-12 col-md-10">
                    <textarea placeholder="Nhập tin liên hệ, thông báo để chủ sân xử lý yêu cầu của bạn nhanh hơn" id="note" type='text' class="form-control"></textarea>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-xs-12">
                    <label class="control-label" for="is-repeat"><input id="is-repeat" type="checkbox" /> Đặt lịch cố định hàng tuần</label>
                    <input id="hddRepeat" type="hidden" value="0" />
                </div>
            </div>
            <div class="hidden date-schedule">
                <div class="row form-group">
                    <label class="control-label col-md-2 col-xs-12">Thứ:</label>
                    <div class="col-xs-12 col-md-4">
                        <select class="form-control" id="dayofweek">
                            <option value="1">Thứ 2</option>
                            <option value="2">Thứ 3</option>
                            <option value="3">Thứ 4</option>
                            <option value="4">Thứ 5</option>
                            <option value="5">Thứ 6</option>
                            <option value="6">Thứ 7</option>
                            <option value="0">Chủ nhật</option>
                        </select>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-md-2 col-xs-12">Từ ngày</label>
                    <div class="col-xs-12 col-md-4">
                        <div class='input-group date' id='fromDateDatePicker'>
                            <input id="fromDate" type='text' class="form-control" />
                            <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                        </div>
                    </div>
                    <label class="control-label col-md-2 col-xs-12" style="padding-left:0px;">Đến ngày</label>
                    <div class="col-xs-12 col-md-4">
                        <div class='input-group date' id='toDateDatePicker'>
                            <input id="toDate" type='text' class="form-control" />
                            <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- /.portlet-body -->
    </form>
</div>

