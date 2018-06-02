<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entities.StadiumDetailStatus"%>
<%@page import="common.DataStaticModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>


<!-- ngView: --><div  class="ng-scope" style="">
<div class="breadcrum ng-scope">
    <div class="container">
        <div class="breadcrum-line">
            <a href="${contextPath}/">Trang chủ</a>
            <a href="${contextPath}/stadium/management">Danh sách sân</a>
            <a href="${contextPath}/stadium/management/stadium-info/1273">Cồn tộc</a>
            <a href="${contextPath}/stadium/management/bookingManager/1273" class="">Đặt sân</a>
        </div>
    </div>
</div>

<%!
public StadiumDetailStatus isBooking(List<StadiumDetailStatus> stadiumDetailStatusList, int hourStep, int pitchType, int position ) {
	for (StadiumDetailStatus detailStatus: stadiumDetailStatusList) {
		if (hourStep == detailStatus.getMatchTime() 
				&& pitchType == detailStatus.getCost().getPitchDetail().getPitchType().getId()
				&& position == detailStatus.getPosition()) {
			return detailStatus;
		}
	}
	return null;
}
%>

<div class="content-wrap ng-scope">
    <div class="container">
        <div class="item-card">
            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li>
                        <a href="${contextPath}/stadium/management/booking" aria-expanded="true">
                            <i class="fa fa-list" aria-hidden="true"></i>
                            Yêu cầu đặt sân <b class="badge badge-primary" style="background-color:red">2</b>
                        </a>
                    </li>
                    <li>
                        <a href="${contextPath}/stadium/management/stadium-info/${bookingManagerDto.getPitchId()}" aria-expanded="false" >
                            <i class="glyphicon glyphicon-info-sign"></i>
                            &nbsp;&nbsp;Thông tin cơ bản
                        </a>
                    </li>

                    <li  class="active">
                        <a href="${contextPath}/stadium/management/bookingManager/${bookingManagerDto.getPitchId()}" aria-expanded="true">
                            <i class="fa fa-calendar" aria-hidden="true"></i>
                            &nbsp;&nbsp;Đặt sân
                        </a>
                    </li>
                </ul>
                <div id="myTab1Content" class="tab-content stadium-booking-manager">
                    <div class="tab-pane fade active in" id="#/calendar">
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <form class="form-inline ng-pristine ng-valid">
                                    <div class="form-group">
                                        <button ng-click="loadTodayBookingDates($event)" class="btn btn-info mobile-w-100p m-mtop-10">Hôm nay</button>
                                    </div>
                                    <div class="input-group date frm-date-time">
                                        <input type="text" class="form-control jqueryDatePickerEnabled2" placeholder="04/06/2018">
                                        <label class="input-group-addon btn" for="bookingDatePicker">
                                            <span class="glyphicon glyphicon-calendar">
                                            </span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <button ng-click="loadTodayBookingDates($event)" class="btn btn-info mobile-w-100p m-mtop-10">Thông tin sân bóng</button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="clear-bordered">&nbsp;</div>
                            </div>
                            <div class="col-sm-12 ng-scope" id="stadiumBookingTable">
                            
                            
                            <!-- =========================== MONDAY BEGIN ========================= -->
                            
                                <div class="stadiumBookingTableContainer ng-scope" ng-repeat="bookingDate in bookingDates track by $index" ng-init="dateIndex = $index">
                                    <h4>
                                        <a class="pointer ng-binding" ng-click="bookingDate.isVisible = !bookingDate.isVisible">
                                            <!-- ngIf: !bookingDate.isVisible -->
                                            <!-- ngIf: bookingDate.isVisible --><i class="fa fa-minus-square ng-scope" aria-hidden="true" ng-if="bookingDate.isVisible"></i><!-- end ngIf: bookingDate.isVisible -->
                                            Thứ Hai ngày 04/06/2018
                                        </a>
                                    </h4>
                                    <br>
                                    
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead>
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <c:forEach var="map" items="${loaiSanVsSoLuongMap}">
                                                    	<c:forEach begin="1" end="${map.getValue()}" var="i" step="1">
                                                    		<th width="235px" class="ng-binding ng-scope">Sân ${map.getKey()} số ${i}</th>
                                                    	</c:forEach>
                                                    </c:forEach>
                                                </tr>
                                            </thead>
                                            
                                            <tbody >
                                            <c:forEach var="hourStep" begin="${bookingManagerDto.getHourStart()}" end="${bookingManagerDto.getHourEnd()-1}" step="1">
                                            	<tr>
                                                    <td class="time-frame-td">
                                                    	<span class="time-frame-text ng-binding">
                                                    		<%=DataStaticModel.HOUR_LESS_THAN_10.get(Integer.parseInt(pageContext.getAttribute("hourStep").toString()))%>
                                                    		&nbsp;-&nbsp;
                                                    		<%=DataStaticModel.HOUR_LESS_THAN_10.get(Integer.parseInt(pageContext.getAttribute("hourStep").toString())+1)%>
                                                    	</span>
                                                    </td>
                                                    
                                                   <c:forEach var="map" items="${loaiSanVsSoLuongMap}">
                                                   		<c:forEach begin="1" end="${map.getValue()}" var="i" step="1">
		                                                    <td class='minipitch-${hourStep}-${map.getKey()}-${i}'>
		                                                        <div class="stadium-number-name mobile-only">
		                                                        	<strong class="ng-binding">Sân ${map.getKey()} số ${i}</strong>
		                                                        </div>
		                                                        
		                                                        <c:if test="${not empty stadiumDetailStatusList}">
		                                                        <% 
		                                                        	List<StadiumDetailStatus> stadiumDetailStatusList = (List<StadiumDetailStatus>)request.getAttribute("stadiumDetailStatusList"); 
		                                                        	int hourStep = Integer.parseInt(pageContext.getAttribute("hourStep").toString());
		                                                        	Entry<Integer, Integer> map = (Entry<Integer, Integer>)pageContext.getAttribute("map");
		                                                        	int pitchType = map.getKey();
		                                                        	int position = Integer.parseInt(pageContext.getAttribute("i").toString());
		                                                        	StadiumDetailStatus detailStatus = isBooking(stadiumDetailStatusList, hourStep, pitchType, position);
		                                                        	pageContext.setAttribute("detailStatus", detailStatus);
		                                                        %>
		                                                        	<c:choose>
		                                                        		<c:when test="${detailStatus != null }">
			                                                        		<div class="booking-info-available-${hourStep}-${map.getKey()}-${i} ng-scope" onclick="$('.stadium-booking-form-${hourStep}-${map.getKey()}-${i}').removeClass('ng-hide'); $(this).addClass('ng-hide')">
					                                                            <a class="pointer text-underline color-red"><i>Đã được đặt</i></a>
					                                                        </div>
			                                                        		
			                                                        		<form action="javascript:void(0);" class="stadium-booking-form-${hourStep}-${map.getKey()}-${i} ng-hide">
					                                                            <div class="form-group">
					                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
					                                                                placeholder="Tên Người đặt / Đội bóng" value="${detailStatus.getCustomerName()}">
					                                                            </div>
					                                                            <div class="form-group">
					                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
					                                                                placeholder="Điện thoại liên hệ" value="${detailStatus.getPhoneNumber()}">
					                                                            </div>
					                                                            <div class="form-group">
					                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
					                                                                placeholder="Ghi chú" value="${detailStatus.getNote()}">
					                                                            </div>
					                                                            
					                                                            
					                                                            <div class="form-group text-right">
					                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
					                                                                    Lưu
					                                                                </button>
					                                                                <button onclick="$('.stadium-booking-form-${hourStep}-${map.getKey()}-${i}').addClass('ng-hide'); $('.booking-info-available-${hourStep}-${map.getKey()}-${i}').removeClass('ng-hide')" class="btn btn-default btn-sm">Huỷ</button>
					                                                            </div>
					                                                        </form>
		                                                        		</c:when>
		                                                        		<c:otherwise>
			                                                       			<div class="booking-info-available-${hourStep}-${map.getKey()}-${i} ng-scope" onclick="$('.stadium-booking-form-${hourStep}-${map.getKey()}-${i}').removeClass('ng-hide'); $(this).addClass('ng-hide')">
					                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
					                                                        </div>
					                                                        <form action="javascript:void(0);" class="stadium-booking-form-${hourStep}-${map.getKey()}-${i} ng-hide">
					                                                            <div class="form-group">
					                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
					                                                                placeholder="Tên Người đặt / Đội bóng" >
					                                                            </div>
					                                                            <div class="form-group">
					                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
					                                                                placeholder="Điện thoại liên hệ" >
					                                                            </div>
					                                                            <div class="form-group">
					                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
					                                                                placeholder="Ghi chú" >
					                                                            </div>
					                                                            <div class="form-group text-right">
					                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
					                                                                    Lưu
					                                                                </button>
					                                                                <button onclick="$('.stadium-booking-form-${hourStep}-${map.getKey()}-${i}').addClass('ng-hide'); $('.booking-info-available-${hourStep}-${map.getKey()}-${i}').removeClass('ng-hide')" class="btn btn-default btn-sm">Huỷ</button>
					                                                            </div>
					                                                        </form>
		                                                        		</c:otherwise>
		                                                        	</c:choose>
		                                                        </c:if>
		                                                        
		                                                        <c:if test="${empty stadiumDetailStatusList}">
		                                                        	<div class="booking-info-available-${hourStep}-${map.getKey()}-${i} ng-scope" onclick="$('.stadium-booking-form-${hourStep}-${map.getKey()}-${i}').removeClass('ng-hide'); $(this).addClass('ng-hide')">
			                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
			                                                        </div>
			                                                        <form action="javascript:void(0);" class="stadium-booking-form-${hourStep}-${map.getKey()}-${i} ng-hide">
			                                                            <div class="form-group">
			                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
			                                                                placeholder="Tên Người đặt / Đội bóng" >
			                                                            </div>
			                                                            <div class="form-group">
			                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
			                                                                placeholder="Điện thoại liên hệ" >
			                                                            </div>
			                                                            <div class="form-group">
			                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
			                                                                placeholder="Ghi chú" >
			                                                            </div>
			                                                            <div class="form-group text-right">
			                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
			                                                                    Lưu
			                                                                </button>
			                                                                <button onclick="$('.stadium-booking-form-${hourStep}-${map.getKey()}-${i}').addClass('ng-hide'); $('.booking-info-available-${hourStep}-${map.getKey()}-${i}').removeClass('ng-hide')" class="btn btn-default btn-sm">Huỷ</button>
			                                                            </div>
			                                                        </form>	
		                                                        </c:if>
		                                                        
		                                                    </td>
                                                    	</c:forEach>
                                                    </c:forEach>
                                                    
                                                </tr>
                                            
                                            </c:forEach>
                                                
                                                <tr class="additional-row">
                                                    <td colspan="3">
                                                        <form class="form-inline ng-pristine ng-valid">
                                                            <input type="text" class="form-control input-sm textbox-timepicker ng-pristine ng-untouched ng-valid ng-empty" style="width:80px" placeholder="Bắt đầu" ng-model="bookingDate.startTimeOfDayNew">
                                                            <input type="text" class="form-control input-sm textbox-timepicker ng-pristine ng-untouched ng-valid ng-empty" style="width:80px" placeholder="Kết thúc" ng-model="bookingDate.endTimeOfDayNew">
                                                            <button class="btn btn-default btn-sm" ng-click="addTimeFrame(dateIndex)">Thêm khung giờ</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                
                                <!-- =========================== MONDAY END ========================= -->
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<div id="modalDeleteRepeatBookingConfirmation" class="modal modal-styled fade ng-scope" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Xác nhận hủy đặt sân</h4>
            </div>
            <div class="modal-body">
                <div class="form-group row">
                    <label class="control-label col-sm-12"><input ng-model="onDeleteBookingRecord.isCancelRepeatDate" type="radio" value="1" class="ng-pristine ng-untouched ng-valid ng-empty" name="3308"> Hủy lịch đặt ngày <b class="ng-binding"></b></label>
                    <label class="control-label col-sm-12"><input ng-model="onDeleteBookingRecord.isCancelRepeatDate" type="radio" value="0" class="ng-pristine ng-untouched ng-valid ng-empty" name="3309"> Hủy toàn bộ lịch cố định</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Thoát
                </button>
                <!-- ngIf: onDeleteBookingRecord.bookingId>0 -->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" class="ng-scope">
    $(document).ready(function () {
        $('.jqueryDatePickerEnabled2').datetimepicker2({
            timepicker: false,
            format: 'Y-m-d'
        });
    });
</script>

</div>



