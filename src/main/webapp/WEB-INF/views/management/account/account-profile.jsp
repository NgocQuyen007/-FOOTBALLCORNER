<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>


<div class="tabs-chi-tiet-doi">
    <div class="container">
        
        <div class="title-doi"></div>
        
        <div class="wrap-ul-doi">
            <ul class="list-link-doi tabs">
                <li class="active" target-id="#profile" onclick="$('#profile').show();$('#changepass').hide();"><a href="javascript:void(0);">Thông tin cá nhân</a></li>
                <li target-id="#changepass" onclick="$('#profile').hide();$('#changepass').show();" ><a href="javascript:void(0);">Thay đổi mật khẩu</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="content-wrap">
    <!-- Nav Tabs -->

    <!-- Tab Content -->
    <div class="container">

        <!-- PROFILE -->
        <div id="profile" class="" style="display: block;">
            <div class="row">

                <div class="col-md-3">
                    <div class="sidebar sidebar-tien-ich">
				<ul class="list-left-links">
				    <li><a class="red">Trận đấu của tôi</a></li>
				    <li><a>Đặt sân</a></li>
				    <li>
				        <a >Quản lý đội bóng</a>
				        <!-- ngIf: myTeams.length>0 -->
				    </li>
				    <li><a >Quản lý sân</a></li>
				    <li><a href="${contextPath}/user/profile">Tài khoản</a></li>
				</ul>
                    </div>
                </div>
                <div class="col-md-9">

                    <ul class="list-item-san">
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="img-profile" title="Tải lên một hình ảnh đại diện">
                                        <img id="profile-avatar" class="media-object" width="100%" src='<c:url value="/resources/common/img/default-user.png" />' alt="avatar">
                                    </div>
                                    
                                    <span style="display:none">
                                        <input id="btnprofileUpload" onchange="return sport.account.readURL(this);" name="profileUpload" type="file">
                                    </span>

                                </div>
                                <div class="col-md-9 right-item-san profile-view" style="display: block;">
	                                <div class="form-group col-md-11">
									    <p><strong>Họ và Tên:</strong> Phan Ngọc Quyền</p>
									    <p><strong>Email:</strong> phanngocquyen250995@gmail.com</p>
									    <p><strong>Điện thoại:</strong>  098 581 3271</p>
									</div>
									<div class="form-group col-md-11">
									    <a href="javascript:void(0)" onclick="$('#profile').hide();$('profile-main').show();" id="btnProfileEdit" class="btn mb20 btn-small btn-primary">Chỉnh sửa</a>
									</div>
								</div>
								
                                <div class="profile-edit col-md-9 right-item-san" style="display: none;">
                                
	                                <form id="frmEditProfile" method="post">
	                				
		                				<div class="row"></div>
		                				
						                <div class="row form-group">
						                    <div class="col-sm-3 col-xs-6">
						                        <label class="control-label ">Họ</label>
						                    </div>
						                    <div class="col-sm-6 col-xs-6">
						                        <input data-val="true" data-val-number="The field Id must be a number." data-val-required="The Id field is required." id="Id" name="Id" type="hidden" value="1769">
						                        <input id="UserAvatarPath" name="UserAvatarPath" type="hidden" value='<c:url value="/resources/common/img/default-user.png" />'>
						                        <input id="UserAvatarName" name="UserAvatarName" type="hidden" value="">
						                        <span class="field-validation-valid" data-valmsg-for="UserFirstName" data-valmsg-replace="true"></span>
						                        <input class="form-control" data-val="true" data-val-required="Họ không được để trống" id="UserFirstName" name="UserFirstName" type="text" value="one">
						                    </div>
						                </div>
						                <div class="row form-group">
						                    <div class="col-sm-3 col-xs-6">
						                        <label class="control-label ">Tên</label>
						                    </div>
						                    <div class="col-sm-6 col-xs-6">
						                        <span class="field-validation-valid" data-valmsg-for="UserLastName" data-valmsg-replace="true"></span>
						                        <input class="form-control" data-val="true" data-val-required="Tên không được để trống" id="UserLastName" name="UserLastName" type="text" value="test">
						                    </div>
						                </div>
						                <div class="row form-group">
						                    <div class="col-sm-3 col-xs-6">
						                        <label class="control-label ">Email</label>
						                    </div>
						                    <div class="col-sm-6 col-xs-6">
						                        <span class="field-validation-valid" data-valmsg-for="UserEmail" data-valmsg-replace="true"></span>
						                        <input class="form-control" id="UserEmail" name="UserEmail" type="text" value="">
						                    </div>
						                </div>
						                <div class="row form-group">
						                    <div class="col-sm-3 col-xs-6">
						                        <label class="control-label">Điện thoại</label>
						                    </div>
						                    <div class="col-sm-6 col-xs-6">
						                        <span class="field-validation-valid" data-valmsg-for="UserMobile" data-valmsg-replace="true"></span>
						                        <input class="form-control" id="UserMobile" name="UserMobile" type="text" value="1a1241123">
						                    </div>
						                </div>
						                
										<div class="row form-group">
										    <a href="javascript:void(0)" id="btnProfileSave" class="btn mb20 btn-small btn-primary">Lưu thay đổi</a>
										    <a href="javascript:void(0)" id="btnProfileCancel" class="btn mb20 btn-small btn-default">Quay lại</a>
										</div>
									</form>
								</div>
                            </div>
                        </li>

                    </ul>
                </div>

            </div>
        </div>

        <!-- Jobs -->
        <div id="changepass" style="display: none;">
            <form id="frmChangePassword" method="post" class="ng-pristine ng-valid" novalidate="novalidate">
    <div class="row">
        <div class="col-md-3">
            <div class="sidebar sidebar-tien-ich">
<ul class="list-left-links">
    <li><a  class="red">Trận đấu của tôi</a></li>
    <li><a >Đặt sân</a></li>
    <li>
        <a >Quản lý đội bóng</a>
        
    </li>
    <li><a >Quản lý sân</a></li>
    <li><a href="${contextPath}/user/profile">Tài khoản</a></li>
</ul>
            </div>
        </div>
        <div class="col-md-9">
            <div class="profile-main">              
                <div class="profile-in">
                    <div class="media-left">
                        
                    </div>
                    <div class="media-body">
                        <div class="sidebar">
                            <div class="sidebar-information">
                                <div class="single-category">
                                    <div class="row">
                                    </div>
											<input value="True" data-val="true" data-val-required="The HasPassword field is required." id="HasPassword" name="HasPassword" type="hidden">                                        <div class="row form-group">
                                            <label class="control-label col-sm-3 col-xs-6">Mật khẩu hiện tại</label>
                                            
                                            <div class="col-sm-6 col-xs-6">
                                                <span class="field-validation-valid" data-valmsg-for="UserPassword" data-valmsg-replace="true"></span>
                                                <input value="" class="form-control" data-val="true" data-val-required="Mật khẩu không được để trống" id="UserPassword" name="UserPassword" type="password">
                                            </div>
                                        </div>
                                    <div class="row form-group">
                                        
                                            <label class="control-label col-sm-3 col-xs-6">Mật khẩu mới</label>
                                        
                                        <div class="col-sm-6 col-xs-6">
                                            <span class="field-validation-valid" data-valmsg-for="NewUserPassword" data-valmsg-replace="true"></span>
                                            <input class="form-control" data-val="true" data-val-required="Mật khẩu mới được để trống" id="NewUserPassword" name="NewUserPassword" type="password">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                      
                                            <label class="control-label col-sm-3 col-xs-6">Xác nhận lại mật khẩu mới</label>
                                      
                                        <div class="col-sm-6 col-xs-6">
                                            <span class="field-validation-valid" data-valmsg-for="ConfirmNewUserPassword" data-valmsg-replace="true"></span>
                                            <input class="form-control" data-val="true" data-val-equalto="Mật khẩu nhập lại không trùng với mật khẩu mới" data-val-equalto-other="*.NewUserPassword" data-val-required="Mật khẩu nhập lại không được để trống" id="ConfirmNewUserPassword" name="ConfirmNewUserPassword" type="password">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <a href="javascript:void(0)" id="btnChangePass" class="btn mb20 btn-small btn-primary">Lưu thay đổi</a>
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
</form>
</div>
</div>
</div>
