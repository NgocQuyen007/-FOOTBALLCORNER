<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>


<link href="css/summernote.css" rel="stylesheet">

<!-- ngView: --><div ng-view="" class="ng-scope">
<div class="breadcrum ng-scope">
    <div class="container">
        <div class="breadcrum-line"><a href="https://www.timdoinhanh.com/">Trang chủ</a><a href="https://www.timdoinhanh.com/stadium/management">Danh sách sân</a></div>
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

                    <li class="active">
                        <a href="https://www.timdoinhanh.com/stadium/management#/stadium" data-toggle="tab" aria-expanded="false">
                            <i class="fa fa-list" aria-hidden="true"></i>
                            Danh sách sân
                        </a>
                    </li>
                </ul>
                <div id="myTab1Content" class="tab-content">
                    <div class="tab-pane fade" id="booking">

                    </div> <!-- /.tab-pane -->

                    <div class="tab-pane fade active in" id="#/stadium">
                        <div id="listStadium" style="min-height:250px; position:relative">
                            <!-- ngIf: overlayLoading -->
                            <div class="pull-right" style="margin-bottom:30px;">
                                <div class="dropdown">
                                    <button class="btn btn-primary btn-primary-extra dropdown-toggle" type="button" data-toggle="dropdown">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i> &nbsp;&nbsp;Tạo sân mới
                                        &nbsp;
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="https://www.timdoinhanh.com/stadium/management#/addNew/1">Bóng đá</a>
                                        </li>
                                        <li>
                                            <a href="https://www.timdoinhanh.com/stadium/management#/addNew/2">Tennis</a>
                                        </li>
                                        <li>
                                            <a href="https://www.timdoinhanh.com/stadium/management#/addNew/3">Bóng chuyền</a>
                                        </li>
                                        <li>
                                            <a href="https://www.timdoinhanh.com/stadium/management#/addNew/4">Bóng bàn</a>
                                        </li>
                                        <li>
                                            <a href="https://www.timdoinhanh.com/stadium/management#/addNew/5">Cầu Lông</a>
                                        </li>
                                        <li>
                                            <a href="https://www.timdoinhanh.com/stadium/management#/addNew/6">Bơi lội</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- ngIf: stadiums.length>=1 --><table class="table table-striped table-responsive table-stadium-list ng-scope" ng-if="stadiums.length&gt;=1" style="">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th width="80">Loại</th>
                                        <th>Thông tin sân</th>
                                        <th>Ảnh đại diện</th>
                                        <th align="right" style="text-align:right">Tác vụ</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <!-- ngRepeat: stadium in stadiums --><tr ng-repeat="stadium in stadiums" class="ng-scope">
                                        <td class="ng-binding">1</td>
                                        <td>
                                            <!-- ngIf: stadium.TypeId==1 --><span ng-if="stadium.TypeId==1" class="ng-scope">Bóng đá</span><!-- end ngIf: stadium.TypeId==1 -->
                                            <!-- ngIf: stadium.TypeId==2 -->
                                            <!-- ngIf: stadium.TypeId==3 -->
                                            <!-- ngIf: stadium.TypeId==4 -->
                                            <!-- ngIf: stadium.TypeId==5 -->
                                            <!-- ngIf: stadium.TypeId==6 -->
                                        </td>
                                        <td>
                                            <a ng-href="#/stadium-info/1273" href="https://www.timdoinhanh.com/stadium/management#/stadium-info/1273"><strong class="ng-binding">Nam Hoa Vang</strong></a>
                                            <div class="ng-binding">
                                                <i class="fa fa-map-o"></i> 704 Hoa Vang (Quận Liên Chiểu Đà Nẵng)
                                            </div>
                                            <!-- ngIf: stadium.MobileNumbers!='' && stadium.MobileNumbers!=null --><div ng-if="stadium.MobileNumbers!=&#39;&#39; &amp;&amp; stadium.MobileNumbers!=null" class="ng-scope">
                                                <i class="fa fa-phone-square"></i> <a href="tel:01727272727" class="ng-binding"> 01727272727</a>
                                            </div><!-- end ngIf: stadium.MobileNumbers!='' && stadium.MobileNumbers!=null -->
                                            <!-- ngIf: stadium.Facebook!='' && stadium.Facebook!=null --><div ng-if="stadium.Facebook!=&#39;&#39; &amp;&amp; stadium.Facebook!=null" class="ng-scope">
                                                <i class="fa fa-facebook-square" aria-hidden="true"></i> <a href="https://www.timdoinhanh.com/stadium/nothing" target="_blank" class="ng-binding"> nothing</a>
                                            </div><!-- end ngIf: stadium.Facebook!='' && stadium.Facebook!=null -->
                                            <!-- ngIf: stadium.Website!='' && stadium.Website!=null --><div ng-if="stadium.Website!=&#39;&#39; &amp;&amp; stadium.Website!=null" class="ng-scope">
                                                <i class="fa fa-home" aria-hidden="true"></i> <a href="https://www.timdoinhanh.com/stadium/nothing" target="_blank" class="ng-binding"> nothing</a>
                                            </div><!-- end ngIf: stadium.Website!='' && stadium.Website!=null -->
                                            <!-- ngIf: stadium.EmailAddress!='' && stadium.EmailAddress!=null --><div ng-if="stadium.EmailAddress!=&#39;&#39; &amp;&amp; stadium.EmailAddress!=null" class="ng-scope">
                                                <i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:uhuhuhhu@gmail.com" target="_top" class="ng-binding"> uhuhuhhu@gmail.com</a>
                                            </div><!-- end ngIf: stadium.EmailAddress!='' && stadium.EmailAddress!=null -->

                                        </td>
                                        <td>
                                            <img height="120" ng-src="https://res.givator.com/pictures/11017/500/2018_04/original/be-the-good.jpg" src='<c:url value="https://res.givator.com/pictures/11017/500/2018_04/original/be-the-good.jpg" />'>
                                        </td>

                                        <td align="right" style="text-align:right">
                                            <div class="form-group">
                                                <a href="https://www.timdoinhanh.com/stadium/management#/bookingManager/1273" class="btn btn-info btn-sm" style="width:130px">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i> Đặt sân
                                                </a>
                                            </div>
                                            <div class="form-group">
                                                <a class="btn btn-default btn-sm" ng-href="#/stadium-info/1273" title="Chỉnh sửa" style="width:130px" href="https://www.timdoinhanh.com/stadium/management#/stadium-info/1273">
                                                    <i class="glyphicon glyphicon-pencil"></i> Sửa thông tin
                                                </a>
                                            </div>
                                            <div class="form-group">
                                                <!-- ngIf: stadium.Status == 1 --><a class="btn btn-danger btn-sm ng-scope" confirmation-needed="Bạn có chắc chắn muốn ngưng hoạt động Nam Hoa Vang?" ng-if="stadium.Status == 1" ng-click="changeStatus(stadium.Id,2,$event)" title="Ngưng hoạt động">
                                                    <i class="glyphicon glyphicon-ban-circle"></i> Dừng
                                                </a><!-- end ngIf: stadium.Status == 1 -->
                                                <!-- ngIf: stadium.Status == 2 -->

                                                <a class="btn btn-danger btn-sm" confirmation-needed="Bạn có chắc chắn muốn xóa Nam Hoa Vang?" ng-click="changeStatus(stadium.Id,3,$event)" title="Xóa">
                                                    <i class="glyphicon glyphicon-remove-circle"></i> Xóa
                                                </a>
                                            </div>
                                        </td>

                                    </tr><!-- end ngRepeat: stadium in stadiums --><tr ng-repeat="stadium in stadiums" class="ng-scope">
                                        <td class="ng-binding">2</td>
                                        <td>
                                            <!-- ngIf: stadium.TypeId==1 --><span ng-if="stadium.TypeId==1" class="ng-scope">Bóng đá</span><!-- end ngIf: stadium.TypeId==1 -->
                                            <!-- ngIf: stadium.TypeId==2 -->
                                            <!-- ngIf: stadium.TypeId==3 -->
                                            <!-- ngIf: stadium.TypeId==4 -->
                                            <!-- ngIf: stadium.TypeId==5 -->
                                            <!-- ngIf: stadium.TypeId==6 -->
                                        </td>
                                        <td>
                                            <a ng-href="#/stadium-info/1271" href="https://www.timdoinhanh.com/stadium/management#/stadium-info/1271"><strong class="ng-binding">13 T4 DUT</strong></a>
                                            <div class="ng-binding">
                                                <i class="fa fa-map-o"></i> 74 Nam Cao Da Nag (Quận Liên Chiểu Đà Nẵng)
                                            </div>
                                            <!-- ngIf: stadium.MobileNumbers!='' && stadium.MobileNumbers!=null --><div ng-if="stadium.MobileNumbers!=&#39;&#39; &amp;&amp; stadium.MobileNumbers!=null" class="ng-scope">
                                                <i class="fa fa-phone-square"></i> <a href="tel:0164 767 2019" class="ng-binding"> 0164 767 2019</a>
                                            </div><!-- end ngIf: stadium.MobileNumbers!='' && stadium.MobileNumbers!=null -->
                                            <!-- ngIf: stadium.Facebook!='' && stadium.Facebook!=null -->
                                            <!-- ngIf: stadium.Website!='' && stadium.Website!=null -->
                                            <!-- ngIf: stadium.EmailAddress!='' && stadium.EmailAddress!=null -->

                                        </td>
                                        <td>
                                            <img height="120" ng-src="">
                                        </td>

                                        <td align="right" style="text-align:right">
                                            <div class="form-group">
                                                <a href="https://www.timdoinhanh.com/stadium/management#/bookingManager/1271" class="btn btn-info btn-sm" style="width:130px">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i> Đặt sân
                                                </a>
                                            </div>
                                            <div class="form-group">
                                                <a class="btn btn-default btn-sm" ng-href="#/stadium-info/1271" title="Chỉnh sửa" style="width:130px" href="https://www.timdoinhanh.com/stadium/management#/stadium-info/1271">
                                                    <i class="glyphicon glyphicon-pencil"></i> Sửa thông tin
                                                </a>
                                            </div>
                                            <div class="form-group">
                                                <!-- ngIf: stadium.Status == 1 --><a class="btn btn-danger btn-sm ng-scope" confirmation-needed="Bạn có chắc chắn muốn ngưng hoạt động 13 T4 DUT?" ng-if="stadium.Status == 1" ng-click="changeStatus(stadium.Id,2,$event)" title="Ngưng hoạt động">
                                                    <i class="glyphicon glyphicon-ban-circle"></i> Dừng
                                                </a><!-- end ngIf: stadium.Status == 1 -->
                                                <!-- ngIf: stadium.Status == 2 -->

                                                <a class="btn btn-danger btn-sm" confirmation-needed="Bạn có chắc chắn muốn xóa 13 T4 DUT?" ng-click="changeStatus(stadium.Id,3,$event)" title="Xóa">
                                                    <i class="glyphicon glyphicon-remove-circle"></i> Xóa
                                                </a>
                                            </div>
                                        </td>

                                    </tr><!-- end ngRepeat: stadium in stadiums -->
                                </tbody>
                            </table><!-- end ngIf: stadiums.length>=1 -->
                            <!-- ngIf: stadiums.length==0 -->
                        </div>
                    </div> <!-- /.tab-pane -->
                </div>
            </div>

        </div>
    </div>
</div>

</div>
