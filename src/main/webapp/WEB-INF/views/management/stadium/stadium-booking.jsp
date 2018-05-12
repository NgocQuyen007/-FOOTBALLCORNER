<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>


<script src="js/summernote.min.js"></script>
<link href="css/summernote.css" rel="stylesheet">

<!-- ngView: --><div ng-view="" class="ng-scope" style="">
<div class="breadcrum ng-scope">
    <div class="container">
        <div class="breadcrum-line">
            <a href="https://www.timdoinhanh.com/">Trang chủ</a>
            <a href="https://www.timdoinhanh.com/stadium/management">Danh sách sân</a>
            <a ng-show="stadiumId &gt; 0" href="https://www.timdoinhanh.com/stadium/management#/stadium-info/1273" class="ng-binding">Nam Hoa Vang</a>
            <a ng-show="stadiumId &gt; 0" href="https://www.timdoinhanh.com/stadium/management#/bookingManager/1273" class="">Đặt sân</a>
        </div>
    </div>
</div>
<div class="content-wrap ng-scope">
    <div class="container">
        <div class="item-card">
            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li ng-controller="StadiumBookingNotificationCtrl" class="ng-scope">
                        <a href="https://www.timdoinhanh.com/stadium/management#/booking" data-toggle="tab" aria-expanded="true">
                            <i class="fa fa-list" aria-hidden="true"></i>
                            Yêu cầu đặt sân <b class="badge badge-primary ng-binding" style="background-color:red">2</b>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.timdoinhanh.com/stadium/management#/stadium-info/1273" data-toggle="tab" aria-expanded="true">
                            <i class="glyphicon glyphicon-info-sign"></i>
                            Thông tin cơ bản
                        </a>
                    </li>

                    <li class="active">
                        <a href="https://www.timdoinhanh.com/stadium/management#/bookingManager/1273" data-toggle="tab" aria-expanded="false">
                            <i class="fa fa-calendar" aria-hidden="true"></i>
                            Đặt sân
                        </a>
                    </li>
                </ul>
                <div id="myTab1Content" class="tab-content stadium-booking-manager">
                    <div class="tab-pane fade active in" id="#/calendar">
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <form class="form-inline ng-pristine ng-valid">
                                    <div class="input-group date frm-date-time">
                                        <input type="text" class="form-control jqueryDatePickerEnabled2 ng-pristine ng-untouched ng-valid ng-not-empty" id="bookingDatePicker" ng-model="startDate" ng-change="loadBookingDates()">
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
                            <!-- ngIf: isInProgress -->
                            <!-- ngIf: !isInProgress --><div class="col-sm-12 ng-scope" id="stadiumBookingTable" ng-if="!isInProgress">
                                <!-- ngRepeat: bookingDate in bookingDates track by $index --><div class="stadiumBookingTableContainer ng-scope" ng-repeat="bookingDate in bookingDates track by $index" ng-init="dateIndex = $index">
                                    <h4>
                                        <a class="pointer ng-binding" ng-click="bookingDate.isVisible = !bookingDate.isVisible">
                                            <!-- ngIf: !bookingDate.isVisible -->
                                            <!-- ngIf: bookingDate.isVisible --><i class="fa fa-minus-square ng-scope" aria-hidden="true" ng-if="bookingDate.isVisible"></i><!-- end ngIf: bookingDate.isVisible -->
                                            Thứ Bảy ngày 05/05/2018
                                        </a>
                                    </h4>
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead ng-show="bookingDate.isVisible" class="">
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <!-- ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 2</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 3</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 4</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 7 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers -->
                                                </tr>
                                            </thead>
                                            <tbody ng-show="bookingDate.isVisible" class="">
                                                <!-- ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">16:00 - 17:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">19:00 - 20:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index -->
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
                                </div><!-- end ngRepeat: bookingDate in bookingDates track by $index --><div class="stadiumBookingTableContainer ng-scope" ng-repeat="bookingDate in bookingDates track by $index" ng-init="dateIndex = $index">
                                    <h4>
                                        <a class="pointer ng-binding" ng-click="bookingDate.isVisible = !bookingDate.isVisible">
                                            <!-- ngIf: !bookingDate.isVisible --><i class="fa fa-plus-square ng-scope" aria-hidden="true" ng-if="!bookingDate.isVisible"></i><!-- end ngIf: !bookingDate.isVisible -->
                                            <!-- ngIf: bookingDate.isVisible -->
                                            Chủ Nhật ngày 06/05/2018
                                        </a>
                                    </h4>
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead ng-show="bookingDate.isVisible" class="ng-hide">
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <!-- ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 2</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 3</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 4</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 7 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers -->
                                                </tr>
                                            </thead>
                                            <tbody ng-show="bookingDate.isVisible" class="ng-hide">
                                                <!-- ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">10:00 - 11:30</span></td>
                                                    <!-- ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index --><td ng-repeat="bookingRecord in timeFrame.bookingRecords track by $index" ng-init="bookingRecordIndex = $index" class="ng-scope">
                                                        <div class="stadium-number-name mobile-only"><strong class="ng-binding">Sân 5 số 1</strong></div>
                                                        <!-- ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing --><div class="booking-info-cv ng-scope" ng-if="bookingRecord.bookingId&gt;0 &amp;&amp; !bookingRecord.isEditing">
                                                            <div class="pull-left mobile-float-none">
                                                                <div class="user-name ng-binding">A Team</div>
                                                                <div class="user-mobile ng-binding"></div>
                                                                <div class="description"><i class="ng-binding">Xin chào mình muốn đặt sân - QP</i></div>
                                                                <!-- ngIf: bookingRecord.isRepeat -->
                                                            </div>
                                                            <div class="btn-group booking-info-buttons pull-right mobile-float-none">
                                                                <button type="button" class="btn btn-default btn-sm dropdown-toggle text-center" data-toggle="dropdown">
                                                                    <i class="fa fa-cog mr-0" aria-hidden="true"></i>
                                                                </button>
                                                                <ul class="dropdown-menu" role="menu">
                                                                    <li><a ng-click="bookingRecord.isEditing=true;" class="pointer">Sửa</a></li>
                                                                    <li><a ng-click="onDeleteBooking(dateIndex, timeFrameIndex, bookingRecordIndex)" class="pointer">Huỷ</a></li>
                                                                </ul>
                                                            </div>

                                                        </div><!-- end ngIf: bookingRecord.bookingId>0 && !bookingRecord.isEditing -->
                                                        <!-- ngIf: bookingRecord.bookingId==0 && !bookingRecord.isEditing -->
                                                        <form class="stadium-booking-form ng-pristine ng-valid ng-hide" ng-show="bookingRecord.isEditing">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-not-empty" placeholder="Tên Người đặt / Đội bóng" ng-model="bookingRecord.userName">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty" placeholder="Điện thoại liên hệ" ng-model="bookingRecord.userMobile">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-not-empty" placeholder="Ghi chú" ng-model="bookingRecord.description">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">16:00 - 17:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">19:00 - 20:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index -->
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
                                </div><!-- end ngRepeat: bookingDate in bookingDates track by $index --><div class="stadiumBookingTableContainer ng-scope" ng-repeat="bookingDate in bookingDates track by $index" ng-init="dateIndex = $index">
                                    <h4>
                                        <a class="pointer ng-binding" ng-click="bookingDate.isVisible = !bookingDate.isVisible">
                                            <!-- ngIf: !bookingDate.isVisible --><i class="fa fa-plus-square ng-scope" aria-hidden="true" ng-if="!bookingDate.isVisible"></i><!-- end ngIf: !bookingDate.isVisible -->
                                            <!-- ngIf: bookingDate.isVisible -->
                                            Thứ Hai ngày 07/05/2018
                                        </a>
                                    </h4>
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead ng-show="bookingDate.isVisible" class="ng-hide">
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <!-- ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 2</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 3</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 4</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 7 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers -->
                                                </tr>
                                            </thead>
                                            <tbody ng-show="bookingDate.isVisible" class="ng-hide">
                                                <!-- ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">16:00 - 17:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">19:00 - 20:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index -->
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
                                </div><!-- end ngRepeat: bookingDate in bookingDates track by $index --><div class="stadiumBookingTableContainer ng-scope" ng-repeat="bookingDate in bookingDates track by $index" ng-init="dateIndex = $index">
                                    <h4>
                                        <a class="pointer ng-binding" ng-click="bookingDate.isVisible = !bookingDate.isVisible">
                                            <!-- ngIf: !bookingDate.isVisible --><i class="fa fa-plus-square ng-scope" aria-hidden="true" ng-if="!bookingDate.isVisible"></i><!-- end ngIf: !bookingDate.isVisible -->
                                            <!-- ngIf: bookingDate.isVisible -->
                                            Thứ Ba ngày 08/05/2018
                                        </a>
                                    </h4>
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead ng-show="bookingDate.isVisible" class="ng-hide">
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <!-- ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 2</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 3</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 4</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 7 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers -->
                                                </tr>
                                            </thead>
                                            <tbody ng-show="bookingDate.isVisible" class="ng-hide">
                                                <!-- ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">16:00 - 17:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">19:00 - 20:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index -->
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
                                </div><!-- end ngRepeat: bookingDate in bookingDates track by $index --><div class="stadiumBookingTableContainer ng-scope" ng-repeat="bookingDate in bookingDates track by $index" ng-init="dateIndex = $index">
                                    <h4>
                                        <a class="pointer ng-binding" ng-click="bookingDate.isVisible = !bookingDate.isVisible">
                                            <!-- ngIf: !bookingDate.isVisible --><i class="fa fa-plus-square ng-scope" aria-hidden="true" ng-if="!bookingDate.isVisible"></i><!-- end ngIf: !bookingDate.isVisible -->
                                            <!-- ngIf: bookingDate.isVisible -->
                                            Thứ Tư ngày 09/05/2018
                                        </a>
                                    </h4>
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead ng-show="bookingDate.isVisible" class="ng-hide">
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <!-- ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 2</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 3</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 4</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 7 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers -->
                                                </tr>
                                            </thead>
                                            <tbody ng-show="bookingDate.isVisible" class="ng-hide">
                                                <!-- ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">16:00 - 17:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">19:00 - 20:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index -->
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
                                </div><!-- end ngRepeat: bookingDate in bookingDates track by $index --><div class="stadiumBookingTableContainer ng-scope" ng-repeat="bookingDate in bookingDates track by $index" ng-init="dateIndex = $index">
                                    <h4>
                                        <a class="pointer ng-binding" ng-click="bookingDate.isVisible = !bookingDate.isVisible">
                                            <!-- ngIf: !bookingDate.isVisible --><i class="fa fa-plus-square ng-scope" aria-hidden="true" ng-if="!bookingDate.isVisible"></i><!-- end ngIf: !bookingDate.isVisible -->
                                            <!-- ngIf: bookingDate.isVisible -->
                                            Thứ Năm ngày 10/05/2018
                                        </a>
                                    </h4>
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead ng-show="bookingDate.isVisible" class="ng-hide">
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <!-- ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 2</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 3</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 4</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 7 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers -->
                                                </tr>
                                            </thead>
                                            <tbody ng-show="bookingDate.isVisible" class="ng-hide">
                                                <!-- ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">16:00 - 17:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">19:00 - 20:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index -->
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
                                </div><!-- end ngRepeat: bookingDate in bookingDates track by $index --><div class="stadiumBookingTableContainer ng-scope" ng-repeat="bookingDate in bookingDates track by $index" ng-init="dateIndex = $index">
                                    <h4>
                                        <a class="pointer ng-binding" ng-click="bookingDate.isVisible = !bookingDate.isVisible">
                                            <!-- ngIf: !bookingDate.isVisible --><i class="fa fa-plus-square ng-scope" aria-hidden="true" ng-if="!bookingDate.isVisible"></i><!-- end ngIf: !bookingDate.isVisible -->
                                            <!-- ngIf: bookingDate.isVisible -->
                                            Thứ Sáu ngày 11/05/2018
                                        </a>
                                    </h4>
                                    <div class="scroll-bar-x">
                                        <table class="table table-bordered table-responsive stadium-booking-table">
                                            <thead ng-show="bookingDate.isVisible" class="ng-hide">
                                                <tr>
                                                    <th style="width:125px">Khung giờ</th>
                                                    <!-- ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 2</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 3</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 5 số 4</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers --><th ng-repeat="stadiumNumber in stadiumNumbers" width="235px" class="ng-binding ng-scope">Sân 7 số 1</th><!-- end ngRepeat: stadiumNumber in stadiumNumbers -->
                                                </tr>
                                            </thead>
                                            <tbody ng-show="bookingDate.isVisible" class="ng-hide">
                                                <!-- ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">16:00 - 17:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
                                                    <td class="time-frame-td"><span class="time-frame-text ng-binding">19:00 - 20:30</span></td>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index --><tr ng-repeat="timeFrame in bookingDate.timeFrames track by $index" ng-init="timeFrameIndex = $index" class="ng-scope">
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
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
                                                            <div class="form-group">
                                                                <label>
                                                                    <input type="checkbox" ng-model="bookingRecord.isRepeat" class="ng-pristine ng-untouched ng-valid ng-empty">
                                                                    Cố định tháng
                                                                </label>
                                                            </div>
                                                            <div class="form-group text-right">
                                                                <button ng-click="saveBooking($event, dateIndex, timeFrameIndex, bookingRecordIndex)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-success btn-sm">
                                                                    Lưu
                                                                </button>
                                                                <button ng-click="bookingRecord.isEditing=false;" class="btn btn-default btn-sm">Huỷ</button>
                                                            </div>
                                                        </form>
                                                    </td><!-- end ngRepeat: bookingRecord in timeFrame.bookingRecords track by $index -->
                                                </tr><!-- end ngRepeat: timeFrame in bookingDate.timeFrames track by $index -->
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
                                </div><!-- end ngRepeat: bookingDate in bookingDates track by $index -->
                            </div><!-- end ngIf: !isInProgress -->
                        </div>
                    </div> <!-- /.tab-pane -->
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
</script></div>



