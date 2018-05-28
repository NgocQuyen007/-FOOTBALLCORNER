<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
	 <meta charset="utf-8" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/tags/taglibs.jsp" %>

<footer class="footer">
    <div class="container">
        <div class="col-xs-12 col-sm-2 col-md-3 col-1-footer">
            <a href="${contextPath}/#" class="footer-logo"><img class="img-responsive" src='<c:url value="/resources/common/img/logo-dat-keo-nhanh-ft.png"/>' /></a>
            <div class="login-social-footer">
                <a class="" href="javascript:void(0)">
                    <i class="fa fa-facebook-square"></i>
                </a>
                <a class="" href="javascript:void(0)">
                    <i class="fa fa-google-plus-square"></i>
                </a>
            </div>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3 intro">
            <ul>
                <li>
                    <h5>ĐặtKèoNhanh.COM</h5>
                </li>

                <li>
                    <a href="mailto:timdoinhanh.com@gmail.com">
                        <span>
                            <i class="fa fa-envelope-o"></i>
                            datkeonhanh.com@gmail.com
                        </span>
                    </a>
                </li>
                <li>
                </li>
                <li>
                    <a href="https://www.facebook.com/datkeonhanh" target="_blank">
                        <span>
                            <i class="fa fa-facebook-f"></i>
                            Facebook
                        </span>
                    </a>
                </li>
                <li>
                    <a href="https://www.facebook.com/datkeonhanh" target="_blank">
                        <span>
                            <i class="fa fa-youtube-play"></i>
                            Youtube
                        </span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3 info">
            <ul>
                <li>
                    <h5>Thông tin</h5>
                </li>
                <li>
                    <a href="${contextPath}/gioi-thieu.html">
                        <span>
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                            Giới thiệu
                        </span>
                    </a>
                </li>
                <li>
                    <a href="${contextPath}/tien-ich.html">
                        <span>
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                            Tiện ích
                        </span>
                    </a>
                </li>
                <li>
                    <a href="${contextPath}/dieu-khoan-su-dung.html">
                        <span>
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                            Điều khoản sử dụng
                        </span>
                    </a>
                </li>
                <li>
                    <a href="${contextPath}/chinh-sach-bao-mat.html">
                        <span>
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                            Chính sách bảo mật
                        </span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-3 mobile-app">
            <ul>
                <li>
                    <h5>
                        Ứng dụng
                    </h5>
                </li>
                <li>
                    <a href="${contextPath}">
                        <img src='<c:url value="/resources/common/img/app-store.png"/>' class="app-store">
                    </a>
                    <a href="${contextPath}">
                        <img src='<c:url value="/resources/common/img/ch-play.png"/>' class="ch-play">
                    </a>
                </li>
                <li>
                    <p>
                        Hãy tải ngay ứng dụng TimDoiNhanh <strong>miễn phí</strong> vào điện thoại của bạn để cập nhật thông tin nhanh nhất, mọi lúc, mọi nơi.
                    </p>
                </li>
            </ul>
        </div>
    </div>
</footer>
<div class="copyright">
    <div class="container">
        <p>DatKeoNhanh © 2018. All rights reserved</p>
    </div>
</div>


<!-- after footer -->
<a href="${contextPath}/#top" class="back-to-top" style="display: none;"><i class="fa fa-angle-up" aria-hidden="true"></i></a>
<div id="divAjaxLoadingRequest" style="display:none">
</div>
<a id="layout_modal_button" class="hidden" data-toggle="modal" role="button" href="javascript:void(0);" data-target="#"></a>
<!-- modal info -->
<div id="layout_modal_info" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" style="display: none;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><i class="icon-warning"></i>Tìm đối nhanh thông báo!</h4>
            </div>

            <div class="modal-body with-padding">
                <p class="modal-content-info"></p>
            </div>

            <div class="modal-footer">
                <center><button class="btn btn-tertiary" data-dismiss="modal">Ok</button></center>
            </div>
        </div>
    </div>
</div>



<!-- =================== login modal =================== -->

<div id="loginModal" class="modal fade in" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button"  onclick="$('#loginModal').hide(); window.location.reload()" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Đăng nhập</h4>
            </div>
            <div class="modal-body">

                <form id="frmSignIn" class="modal-forms ng-pristine ng-valid">
                    <div class="login-error" style='display:none'>
	                    <div class="alert alert-danger fade in" role="alert">
			            	<a class="close">×</a>
				            <strong id="loginresponse"></strong>
				        </div>
					</div>
                    <input type="text" name="Email" placeholder="Email ... " required id="Email" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Tài khoản đăng nhập không được để trống">
                    <form:errors path="user.email" cssStyle="color:green"></form:errors>
                    
                    <input type="password" name="Password" placeholder="Mật khẩu ..." required id="Password" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Mật khẩu không được để trống">
                    <form:errors path="user.password" cssStyle="color:green"></form:errors>

                    <input type="hidden" id="facebookId" value="930986897045312">
                    <input type="hidden" id="googleClientId" value="894662634145-oge0jk4ofsq4afq81niurkh4potclkl9.apps.googleusercontent.com">
                    <input type="hidden" id="returnUrl" name="returnUrl" value="">
                    <button id="btnSignIn" type="submit">Đăng nhập</button>
                </form>
                <div class="a-btn-modal">
                    <div class="social-login-group">
                        <p>Hoặc đăng nhập với</p>
                        <a class="logon-facebook" href="${contextPath}/#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>
                        <a class="login-google" href="${contextPath}/#"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a>

                    </div>
                    <p class="footer-group" style="margin-top:15px;">
                        <a href="${contextPath}/user/forgotpassword" class="forgot-pass">Quên mật khẩu</a>
                        <a href="${contextPath}" class="register-link pull-right">Tạo tài khoản mới</a>
                    </p>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!--#login-->

<!--================= Mời đội giao lưu ======================-->
<div id="commonModal" class="modal fade" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                
                <h4 class="modal-title">
	                <i class="fa fa-beer"></i>
	                Mời đội giao lưu
                </h4>
            </div>
            <div class="modal-body">


    <form action="${contextPath}/moi-doi-giao-luu" method="post" class="form-horizontal ng-pristine ng-scope ng-invalid ng-invalid-required ngloaded" >
        <div id="makerMatchFindingRequest">
            <div class="form-group" style="margin-bottom: 0px;">
            	<label class="control-label col-sm-3">Thông tin <span class="required">*</span></label>
                <div class="col-sm-9">
                	<div style="margin-bottom:5px;">
                    	<input type="text" class="form-control input-sm width-100p ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" readonly placeholder="Họ tên - SĐT" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">
                        Sân bóng: <span class="required">*</span>
                </label>
                <div class="col-sm-9">
                    <label class="control-label pull-left" style="margin-right: 20px">
                        <input type="radio" onchange="$('#modalPName').show();" id="modalCbxHasStadium" name="CbxHasStadium" class="ng-pristine ng-untouched ng-valid ng-not-empty" value="true">
                        Đã có sân
                    </label>
                    <label class="control-label">
                        <input type="radio" onchange="$('#modalPName').hide();" id="modalCbxHasNotStadium" name="CbxHasStadium" class="ng-pristine ng-untouched ng-valid ng-not-empty" value="false" checked="checked">
                        Đi khách
                    </label>
                </div>
            </div>
            
            <div class="form-group" style="margin-bottom: 10px; display:none" id="modalPName">
            	<label class="control-label col-sm-3">Tên sân <span class="required">*</span></label>
                <div class="col-sm-9">
                	<div style="margin-bottom:5px;">
                    	<input type="text" name="pname" class="form-control input-sm width-100p ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" placeholder="Nhập tên sân bóng ..." />
                    </div>
                </div>
            </div>
			
			<div class="form-group">
                <label class="control-label col-sm-3">Quận/Huyện: <span class="required">*</span></label>
                <div class="col-sm-4">
                    <select name="dzipcode" class="form-control input-sm select2-style-enabled ng-pristine ng-untouched ng-valid ng-not-empty" style="width: 100%;">
                        <c:forEach var="district" items="${allofdistrict}">
	                        <option value="${district.zipcode}">${district.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-3">Thời gian: <span class="required">*</span></label>
                <div class="col-sm-4">
                    <select name="created_at_hour" onmousedown="if(this.options.length>6){this.size=4;}" onchange='this.size=0;' onblur="this.size=0;" class="form-control input-sm select2-style-enabled ng-pristine ng-untouched ng-valid ng-not-empty"> 
                        <c:forEach var="map" items="${PITCH_BOOKING_TIME_MAP}">
                        	<option  value="${map.key}">${map.value}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-5 form-inline">
                    <div>
                    	<input name="created_at_date" type="text" id="datepicker" class="form-control input-sm" value="05/16/2018">
                        <h1 class="form-control input-sm">
                            <i class="glyphicon glyphicon-calendar"></i>
                        </h1>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-3">Kèo: <span class="required">*</span></label>
                <div class="col-sm-4">
                    <select name="handicap_id" class="form-control input-sm select2-style-enabled ng-pristine ng-untouched ng-valid ng-not-empty" style="width: 100%;">
                        <c:forEach var="handicap" items="${handicaps}">
                        	<option value="${handicap.id}" >${handicap.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-3">Trình độ: <span class="required">*</span></label>
                <div class="col-sm-4">
                    <select name="level_id" class="form-control input-sm select2-style-enabled ng-pristine ng-untouched ng-valid ng-not-empty" style="width: 100%;">
                        <c:forEach var="level" items="${levels}">
                        	<option value="${level.id}" >${level.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-3">Lời mời <span class="required">*</span></label>
                <div class="col-sm-9">
                    <textarea name="message" required rows="3" cols="5" class="form-control input-sm width-100p ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" placeholder="Lời mời giao lưu"></textarea>
                </div>
            </div>

            <div class="modal-footer">
                <div class="alert alert-danger ng-hide">
                    <strong>Lỗi!</strong>
                    <div class="ng-binding"></div>
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                <button class="btn btn-primary btn-primary-extra" type="submit">
                    <i class="fa fa-send"></i>
                    Đăng
                </button>
                
            </div>
        </div>
    </form>
</div>
        </div>
    </div>
</div>
<!-- #Mời đội giao lưu-->


<div id="modalNotAuthorize" class="modal modal-styled fade" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 class="modal-title">Thông báo</h3>
            </div> <!-- /.modal-header -->
            <div class="modal-body">
                <form class="form-horizontal ng-pristine ng-valid">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <h3>Bạn phải đăng nhập để sử dụng tính năng</h3>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <a href="javascript:void(0);" onclick="$('#modalNotAuthorize').addClass('hidden'); $('#loginModal').show();  " class="btn btn-success">Đăng nhập</a>
                                <a href="${contextPath}/#" onclick="location.href =''" class="btn btn-danger">Đăng kí</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
            </div> 
        </div> 
    </div>
</div>

<!--Libraries-->
<script src='<c:url value="/resources/common/js/jquery-1.12.4.js"/>'></script>
<script src='<c:url value="/resources/common/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/resources/common/js/jquery-ui.js"/>'></script>


<script src='<c:url value="/resources/common/js/libs.js"/>'></script>
<script src='<c:url value="/resources/common/js/custom.js"/>'></script>
<script src='<c:url value="/resources/common/js/papp.js"/>'></script>


<script>
	$(function() {
		$("#datepicker").datepicker();
	});
	$(function() {
		$("#datepicker1").datepicker();
	});
	
	$(document).ready(function () {
        $('.textbox-timepicker').datetimepicker2({
            datepicker: false,
            format: 'H:i',
		  //value: '6:00',
		  allowTimes: ['16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '20:00', '20:30',
		  '5:00', '5:30', '6:00', '6:30', '7:00', '7:30', '8:00', '8:30',
		  '9:00', '9:30', '10:00', '10:30', '14:00', '14:30',
		  '15:00', '15:30', '21:00', '21:30', '22:00', '22:30', '23:00', '23:30']
		});
	});
	
	function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : event.keyCode
       if (charCode != 45  && charCode > 31 && (charCode < 48 || charCode > 57)){
    	   return false; 
       }
       return true;
    }
	
	
</script>
</body>
</html>

