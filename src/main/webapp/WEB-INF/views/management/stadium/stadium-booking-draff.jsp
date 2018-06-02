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
                        <a href="${contextPath}/stadium/management/stadium-info/${stadium.getId()}" aria-expanded="false" >
                            <i class="glyphicon glyphicon-info-sign"></i>
                            &nbsp;&nbsp;Thông tin cơ bản
                        </a>
                    </li>

                    <li  class="active">
                        <a href="${contextPath}/stadium/management/bookingManager/${stadium.getId()}" aria-expanded="true">
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
                                    <div class="input-group date frm-date-time">
                                        <input type="text" class="form-control jqueryDatePickerEnabled2">
                                        <label class="input-group-addon btn" for="bookingDatePicker">
                                            <span class="glyphicon glyphicon-calendar">
                                            </span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <button ng-click="loadTodayBookingDates($event)" class="btn btn-info mobile-w-100p m-mtop-10">Hôm nay</button>
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
                                            Thứ Hai ngày 21/05/2018
                                        </a>
                                    </h4>
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead>
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <th width="235px" class="ng-binding ng-scope">Sân 5 số 1</th>
                                                    <th width="235px" class="ng-binding ng-scope">Sân 5 số 2</th>
                                                    <th width="235px" class="ng-binding ng-scope">Sân 5 số 3</th>
                                                    <th width="235px" class="ng-binding ng-scope">Sân 5 số 4</th>
                                                    <th width="235px" class="ng-binding ng-scope">Sân 7 số 1</th>
                                                </tr>
                                            </thead>
                                            <tbody >
                                                <tr>
                                                    <td class="time-frame-td">
                                                    	<span class="time-frame-text ng-binding">16:00 - 17:30</span>
                                                    </td>
                                                    <td>
                                                        <div class="stadium-number-name mobile-only">
                                                        	<strong class="ng-binding">Sân 5 số 1</strong>
                                                        </div>
                                                        
                                                        <div class="booking-info-available ng-scope" onclick="$('.stadium-booking-form').removeClass('ng-hide')">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div>
                                                        
                                                        <form action="javascript:void(0);" class="stadium-booking-form ng-hide">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
                                                                placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
                                                                placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" 
                                                                placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button onclick="$('.stadium-booking-form').addClass('ng-hide')" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                    
                                                    <td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 2</strong></div>
                                                        
                                                        <div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 3</strong></div>
                                                        
                                                        <div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                    <td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 4</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                    <td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 7 số 1</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">17:30 - 19:00</span></td>
                                                    <!-- ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 1</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                    <td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 2</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
													<td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 3</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                    <td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 4</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                    <td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 7 số 1</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">19:00 - 20:30</span></td>
                                                    <td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 1</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div>
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 2</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 3</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 4</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 7 số 1</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr>
                                                <tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">20:30 - 22:00</span></td>
                                                    <!-- ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 1</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 2</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 3</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 4</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                    <td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 7 số 1</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing --><div class="booking-info-available ng-scope" ng-if="bookingRecord.bookingId==0 &amp;&amp; !bookingRecord.isEditing" ng-click="bookingRecord.isEditing=true;">
                                                            <a class="pointer text-underline"><i>Còn trống</i></a>
                                                        </div><!-- end ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr class="additional-row">
                                                    <td colspan="6">
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



