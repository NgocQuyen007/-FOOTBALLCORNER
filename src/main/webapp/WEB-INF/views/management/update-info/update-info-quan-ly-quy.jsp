<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>

        <style>

            .img-doio img {
                height: 148px;
            }

            .team-management-page .tab-content {
                padding: 0px 0px 18px 0px !important;
            }
        </style>
        <div class="top-banner-box top-banner-box-doi is-admin-page">
            <div class="container">
                <p class="page-title"></p>
                <a href="https://www.timdoinhanh.com/team/management#/newteam" class="btn btn-default btn-moi-doi btn-doi-moi"><i class="fa fa-beer" aria-hidden="true"></i> Thêm Team</a>
            </div>
        </div>
        <div class="tabs-chi-tiet-doi is-admin-page">
            <div class="container">
                <div class="img-doio"><img class="img-responsive" ng-src="img/sis_1.jpg"></div>
                <div class="title-doi">
                    <h1>FC2013_T4 <span class="gender"><i class="fa fa-mars" aria-hidden="true"></i></span></h1>
                    <p>Phan Trường (đội trưởng)<span class="online"></span></p>
                </div>
                <div class="wrap-ul-doi">
                    <ul class="list-link-doi">
                        <li id="team-settings" class=""><a href="https://www.timdoinhanh.com/team/management?id=9293#setting">Thông tin đội</a></li>
                        <li id="team-users" class=""><a href="https://www.timdoinhanh.com/team/management?id=9293#users">Thành viên</a></li>
                        <li id="team-fundmanagement" class="active"><a href="https://www.timdoinhanh.com/team/management?id=9293#fundmanagement">Quản lý quỹ</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="content-wrap is-admin-page">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="sidebar sidebar-tien-ich">
                            <ul class="list-left-links">
                                <li><a href="https://www.timdoinhanh.com/match/inviting" class="red">Trận đấu của tôi</a></li>
                                <li><a href="https://www.timdoinhanh.com/stadium/bookinghistory">Đặt sân</a></li>
                                <li>
                                    <a href="https://www.timdoinhanh.com/team/view/9293">Quản lý đội bóng</a>
                                    <!-- ngIf: myTeams.length>0 --><ul class="sub-links ng-scope" ng-if="myTeams.length&gt;0">
                                    <!-- ngRepeat: team in myTeams --><li ng-repeat="team in myTeams" class="ng-scope">
                                    <a href="https://www.timdoinhanh.com/team/management?id=9293" class="ng-binding">
                                        fc2013_t4
                                    </a>
                                </li><!-- end ngRepeat: team in myTeams --><li ng-repeat="team in myTeams" class="ng-scope">
                                <a href="https://www.timdoinhanh.com/team/management?id=8918" class="ng-binding">
                                    FC13T4
                                </a>
                            </li><!-- end ngRepeat: team in myTeams -->
                        </ul><!-- end ngIf: myTeams.length>0 -->
                    </li>
                    <li><a href="https://www.timdoinhanh.com/stadium/management">Quản lý sân</a></li>
                    <li><a href="https://www.timdoinhanh.com/user/profile">Tài khoản</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9 sidebar team-management-page">
            <div class="layout-main">
                <!-- ngView: --><div id="settings-content" class="tab-content stacked-content ng-scope" ng-view="" style="">
                <div class="row ng-scope">
                    <!-- ngIf: loadingOverlay -->
                    <!-- ngIf: isLoading -->
                    <div class="col-md-12 form-content ngloaded" ng-class="{&#39;form-content ngloaded&#39;:!isLoading}" style="display: none;">
                        <div class="row">
                            <div class="col-md-8">
                                <h3 class="ng-binding">Cập nhật quỹ tháng 5/2018</h3>

                                <div class="tfm-dt-filter">
                                    <div class="form-inline">
                                        <select ng-model="selectedMonth" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-options="mItem as mItem.text for mItem in allMonths track by mItem.value" ng-change="onYearOrMonthChange()"><option label="Tháng 1" value="1">Tháng 1</option><option label="Tháng 2" value="2">Tháng 2</option><option label="Tháng 3" value="3">Tháng 3</option><option label="Tháng 4" value="4">Tháng 4</option><option label="Tháng 5" value="5" selected="selected">Tháng 5</option><option label="Tháng 6" value="6">Tháng 6</option><option label="Tháng 7" value="7">Tháng 7</option><option label="Tháng 8" value="8">Tháng 8</option><option label="Tháng 9" value="9">Tháng 9</option><option label="Tháng 10" value="10">Tháng 10</option><option label="Tháng 11" value="11">Tháng 11</option><option label="Tháng 12" value="12">Tháng 12</option></select>
                                        <select ng-model="year" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-change="onYearOrMonthChange()" ng-options="yearItem for yearItem in yearList"><option label="2008" value="number:2008">2008</option><option label="2009" value="number:2009">2009</option><option label="2010" value="number:2010">2010</option><option label="2011" value="number:2011">2011</option><option label="2012" value="number:2012">2012</option><option label="2013" value="number:2013">2013</option><option label="2014" value="number:2014">2014</option><option label="2015" value="number:2015">2015</option><option label="2016" value="number:2016">2016</option><option label="2017" value="number:2017">2017</option><option label="2018" value="number:2018" selected="selected">2018</option><option label="2019" value="number:2019">2019</option></select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 tfm-amount-summary">
                                <div class="form-group tfm-amount-deposit">
                                    <label>Tổng thu: </label>
                                    <label class="tfm-amount ng-binding">0</label>
                                </div>
                                <div class="form-group tfm-amount-expense">
                                    <label>Tổng chi: </label>
                                    <label class="tfm-amount ng-binding">0</label>
                                </div>
                                <div class="form-group tfm-amount-remain-prev">
                                    <label>Số dư tháng trước: </label>
                                    <label class="tfm-amount ng-binding">0</label>
                                </div>
                                <div class="form-group tfm-amount-remain-final">
                                    <label>Số dư hiện tại: </label>
                                    <label class="tfm-amount ng-binding" ng-class="{&#39;tfm-amount-negative&#39;:totalFinalRemainAmount&lt;0}">0</label>
                                </div>
                            </div>
                        </div>
                        <div class="right-item-san right-item-doi right-item-doi-ct">
                            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                                <ul class="nav nav-tabs" id="tfm-tabs" role="tablist">
                                    <li role="presentation" class="active" ng-click="loadMemberDeposits()" ng-class="{&#39;active&#39;:activeTab==&#39;tfm-deposits&#39;}">
                                        <a id="fm-dongquy-tab" role="tab" data-toggle="tab" aria-controls="tfm-dongquy" aria-expanded="true">Cập nhật quỹ</a>
                                    </li>
                                    <li role="presentation" ng-click="loadExpenses()" ng-class="{&#39;active&#39;:activeTab==&#39;tfm-expenses&#39;}">
                                        <a id="fm-chiquy-tab" role="tab" data-toggle="tab" aria-controls="tfm-dongquy" aria-expanded="true">Quản lý chi</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="teamfund-management">
                                    <!-- ngIf: activeTab=='tfm-deposits' --><div class="tab-pane ng-scope" role="tabpanel" id="fm-dongquy" aria-labelledby="fm-dongquy-tab" ng-if="activeTab==&#39;tfm-deposits&#39;">

                                    <table class="table table-striped table-deposits table-responsive">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Thành viên</th>
                                                <th>Tổng tiền</th>
                                                <th>Ngày đóng</th>
                                                <th class="text-right">Cập nhật</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- ngRepeat: item in memberDeposits --><tr ng-repeat="item in memberDeposits" class="ng-scope" style="">
                                            <td class="ng-binding">1</td>
                                            <td class="ng-binding">Quyen Phan</td>
                                            <td>
                                                <input type="text" ng-model="item.defaultAmount" ui-number-mask="0" ng-keypress="amountTextBoxEnter($event, item)" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-readonly="item.amount&gt;0">
                                            </td>
                                            <td>
                                                <!-- ngIf: item.amount>0 -->
                                                <!-- ngIf: item.amount==0 --><i ng-if="item.amount==0" class="ng-scope">Chưa đóng</i><!-- end ngIf: item.amount==0 -->
                                            </td>
                                            <td class="text-right team-fund-edit-col">
                                                <!-- ngIf: !item.isLoading && item.amount>0 -->

                                                <!-- ngIf: !item.isLoading && item.amount==0 --><button ng-if="!item.isLoading &amp;&amp; item.amount==0" ng-click="addOrUpdateDeposit(item)" class="btn btn-primary btn-primary-extra btn-sm btn-add-deposit ng-scope">
                                                <i class="fa fa fa-gavel"></i>
                                                Đóng
                                            </button><!-- end ngIf: !item.isLoading && item.amount==0 -->

                                            <!-- ngIf: item.isLoading -->
                                        </td>
                                    </tr><!-- end ngRepeat: item in memberDeposits -->
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
</div>
</div>
</div>
