<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
	 <meta charset="utf-8" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<footer class="footer">
    <div class="container">
        <div class="col-xs-12 col-sm-2 col-md-3 col-1-footer">
            <a href="https://www.timdoinhanh.com/#" class="footer-logo"><img class="img-responsive" src='<c:url value="/resources/common/img/logo-gray.png"/>' align="logo tim doi nhanh"/></a>
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
                    <h5>TìmĐốiNhanh.COM</h5>
                </li>

                <li>
                    <a href="mailto:timdoinhanh.com@gmail.com">
                        <span>
                            <i class="fa fa-envelope-o"></i>
                            timdoinhanh.com@gmail.com
                        </span>
                    </a>
                </li>
                <li>
                </li>
                <li>
                    <a href="https://www.facebook.com/timdoinhanh" target="_blank">
                        <span>
                            <i class="fa fa-facebook-f"></i>
                            Facebook
                        </span>
                    </a>
                </li>
                <li>
                    <a href="https://www.facebook.com/timdoinhanh" target="_blank">
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
                    <a href="https://www.timdoinhanh.com/gioi-thieu.html">
                        <span>
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                            Giới thiệu
                        </span>
                    </a>
                </li>
                <li>
                    <a href="https://www.timdoinhanh.com/tien-ich.html">
                        <span>
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                            Tiện ích
                        </span>
                    </a>
                </li>
                <li>
                    <a href="https://www.timdoinhanh.com/dieu-khoan-su-dung.html">
                        <span>
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                            Điều khoản sử dụng
                        </span>
                    </a>
                </li>
                <li>
                    <a href="https://www.timdoinhanh.com/chinh-sach-bao-mat.html">
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
                    <a href="https://www.timdoinhanh.com/">
                        <img src='<c:url value="/resources/common/img/app-store.png"/>' class="app-store">
                    </a>
                    <a href="https://www.timdoinhanh.com/">
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
        <p>Timdoinhanh © 2016. All rights reserved</p>
    </div>
</div>


<!-- after footer -->
<a href="https://www.timdoinhanh.com/#top" class="back-to-top" style="display: none;"><i class="fa fa-angle-up" aria-hidden="true"></i></a>
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



<!--login-->

<div id="loginModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Đăng nhập</h4>
            </div>
            <div class="modal-body">

                <form id="frmSignIn" class="modal-forms ng-pristine ng-valid">
                    <div class="login-error">


                    </div>
                    <input name="UserName" type="text" placeholder="Số điện thoại hoặc email" required="" id="UserName" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Tài khoản đăng nhập không được để trống">
                    <input type="password" name="Password" placeholder="Mật khẩu" required="" id="Password" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Mật khẩu không được để trống">

                    <input type="hidden" id="facebookId" value="930986897045312">
                    <input type="hidden" id="googleClientId" value="894662634145-oge0jk4ofsq4afq81niurkh4potclkl9.apps.googleusercontent.com">
                    <input type="hidden" id="returnUrl" name="returnUrl" value="">
                    <button id="btnSignIn" type="submit">Đăng nhập</button>
                </form>
                <div class="a-btn-modal">
                    <div class="social-login-group">
                        <p>Hoặc đăng nhập với</p>
                        <a class="logon-facebook" href="https://www.timdoinhanh.com/#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>
                        <a class="login-google" href="https://www.timdoinhanh.com/#"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a>

                    </div>
                    <p class="footer-group" style="margin-top:15px;">
                        <a href="https://www.timdoinhanh.com/user/forgotpassword" class="forgot-pass">Quên mật khẩu</a>
                        <a href="javascript:location.href=&#39;/&#39;" class="register-link pull-right">Tạo tài khoản mới</a>
                    </p>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!--#login-->


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
                                <a data-dismiss="modal" href="javascript:;" onclick="global.showModalLoginPopup();" class="btn btn-success">Đăng nhập</a>
                                <a href="https://www.timdoinhanh.com/#" onclick="location.href =''" class="btn btn-danger">Đăng kí</a>
                            </div>
                        </div>
                    </div> <!-- /.portlet-body -->
                </form>
            </div> <!-- /.modal-body -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
            </div> <!-- /.modal-footer -->
        </div> 
    </div>
</div>

<!--Libraries-->
<script src='<c:url value="/resources/common/js/libs.js"/>'></script>
<script src='<c:url value="/resources/common/js/custom.js"/>'></script>
<script src='<c:url value="/resources/common/js/papp.js"/>'></script>

</body>
</html>
