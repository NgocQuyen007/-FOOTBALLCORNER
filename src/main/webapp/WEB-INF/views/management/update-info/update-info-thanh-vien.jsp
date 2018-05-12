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
                        <li id="team-users" class="active"><a href="https://www.timdoinhanh.com/team/management?id=9293#users">Thành viên</a></li>
                        <li id="team-fundmanagement"><a href="https://www.timdoinhanh.com/team/management?id=9293#fundmanagement">Quản lý quỹ</a></li>
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
                    <div class="tab-pane fade in active col-md-12 layout-main-content">
                        <div class="portlet-header custom-tab-header" style="padding-bottom:12px;">
                            <div class="content-left">
                                <p class="title-box ng-binding">
                                    <i class="fa fa-soccer-ball-o" aria-hidden="true"></i> 1 thành viên
                                    <a href="javascript:;" ng-click="showAddUser();" style="margin-left:2px;float:right;"><i class="fa fa-long-arrow-right" aria-hidden="true"></i> Thêm thành viên</a>
                                </p>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <ul class="list-item-san" id="team-user-list">
                                <!-- ngRepeat: user in userList --><li class="item-card item-team-user ng-scope" ng-repeat="user in userList" style="">
                                <div class="row">
                                    <div class="col-md-4 mobile-bottom-10">
                                        <a href="https://www.timdoinhanh.com/user/profile/1428" target="_blank"><img class="img-responsive" align="thumbnail" src="img/default-user.png"></a>
                                    </div>
                                    <div class="col-md-8 right-item-san">
                                        <h2><a href="https://www.timdoinhanh.com/user/profile/1428" target="_blank" class="ng-binding">Quyen Phan</a></h2>
                                        <p class="ng-binding"><i class="fa fa-map-o" aria-hidden="true"></i> Đội Trưởng</p>
                                        <!-- ngIf: user.userMobile!='' --><p class="phone-numb-ext ng-binding ng-scope" ng-if="user.userMobile!=&#39;&#39;"><i class="fa fa-phone-square" aria-hidden="true"></i> 0164 767 2501</p><!-- end ngIf: user.userMobile!='' -->
                                        <!-- ngIf: user.userEmail!='' --><p class="user-email ng-binding ng-scope" ng-if="user.userEmail!=&#39;&#39;"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i> phanngocquyen250995@gmail.com</p><!-- end ngIf: user.userEmail!='' -->
                                        
                                        <a href="javascript:;" ng-show="onshowRemoveUser(user);" class="btn-chi-tiet ng-hide" ng-click="onConfirmRemoveUser(user);" style="margin-left:2px;"><i class="fa fa-long-arrow-right" aria-hidden="true"></i> Xóa khỏi đội</a>
                                    </div>
                                </div>
                            </li><!-- end ngRepeat: user in userList -->
                        </ul>
                    </div>
                </div> <!-- /.tab-pane -->
            </div>
            <div id="modalTeamAddUser" class="modal modal-styled fade ng-scope" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 class="modal-title">Thêm thành viên</h3>
                        </div> <!-- /.modal-header -->
                        <div class="modal-body">
                            <form class="form-horizontal ng-pristine ng-valid">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <select-autocomplete-multi id="sltUserNamePhoneMail" remote-url="/api/users/searchUserForTeam?teamId=9293" multiple="false" on-selected-change="onSearchUserForTeamSelectedChange" item-id="sltUserNamePhoneMail" item-placeholder="Tên, Số điện thoại hoặc Email ..." class="ng-isolate-scope"><select style="width: 100%;" id="ee253280-fdfe-4b90-8686-264d5af4d838" idd2="sltUserNamePhoneMail" idd="sltUserNamePhoneMail" class="select-autocomplete-directive select-autocomplete-multi form-control input-sm select2-hidden-accessible" tabindex="-1" aria-hidden="true"></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-ee253280-fdfe-4b90-8686-264d5af4d838-container"><span class="select2-selection__rendered" id="select2-ee253280-fdfe-4b90-8686-264d5af4d838-container"><span class="select2-selection__placeholder">Tên, Số điện thoại hoặc Email ...</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span></select-autocomplete-multi></div>
                                    </div>
                                    <div class="form-group" id="invite-username-extra-group" style="display:none">
                                        <div class="col-md-12">
                                            <label>Tên thành viên<span class="required">(*)</span></label>
                                            <input type="text" class="form-control" id="invite-username-extra" placeholder="Nhập tên thành viên...">
                                            <span class="field-validation-error" style="display:none">Tên thành viên bắt buộc</span>
                                        </div>
                                    </div>
                                </form>
                            </div> <!-- /.modal-body -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                <button id="btnAddUsers" ng-click="onAddUser($event);" class="btn btn-danger" type="button">Thêm</button>
                            </div> <!-- /.modal-footer -->
                        </div> <!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div>

                <div id="modalTeamRemoveUser" class="modal modal-styled fade ng-scope" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 class="modal-title">Xóa thành viên</h3>
                            </div> <!-- /.modal-header -->
                            <div class="modal-body">
                                <form class="form-horizontal ng-pristine ng-valid">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <p>Bạn chắc chắn muốn xóa thành viên.?</p>
                                        </div>
                                    </div>
                                </form>
                            </div> <!-- /.modal-body -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                <button id="btnAddUsers" ng-click="onRemoveUser();" class="btn btn-danger" data-dismiss="modal" type="button">Xóa</button>
                            </div> <!-- /.modal-footer -->
                        </div> <!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div>
            </div> <!-- /.tab-content -->
        </div> <!-- /.col -->
</div>
</div>
</div>
</div>

