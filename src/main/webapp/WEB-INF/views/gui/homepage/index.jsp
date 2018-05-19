<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp" %>

<!--  header -->
<div class="top-hero-box">
    <div class="container">
        <div class="row">

            <div class="col-md-7">
                <div class="fp-banner-text">
                    <h1 class="title">
                        Quản lý sân, tìm đối giao lưu
                        <br>
                        đặt sân trực tuyến 
                    </h1>
                    <p class="description">
                        <i class="fa fa-quote-left"></i>
                        Tập hợp hàng ngàn câu lạc bộ thể thao tại Hà Nội, Hồ Chí Minh và các Tỉnh / Thành phố khác.
                        Tại đây, bạn dễ dàng tìm được các đối chơi cùng trình độ cũng như tìm sân chơi chất lượng cao với khung thời gian, giá cả hợp lý nhất.
                    </p>
                    <ul id="feature-list">
                        <li class="free-text">
                            <em class="glyphicon glyphicon-ok-sign"></em>
                            Hoàn toàn <strong>miễn phí</strong>!
                        </li>
                        <li>
                            <em class="glyphicon glyphicon-ok-sign"></em>
                            <strong>Tìm đối</strong> giao lưu, kết bạn dễ dàng.
                        </li>
                        <li>
                            <em class="glyphicon glyphicon-ok-sign"></em>
                            <strong>Quản lý sân</strong>, lịch biểu hiệu quả, tiết kiệm tối đa thời gian
                        </li>
                        <li>
                            <em class="glyphicon glyphicon-ok-sign"></em>
                            Giảm thiểu tối đa tình trạng <strong>trống sân, cháy đối</strong>!
                        </li>
                        <li class="view-more">
                            <a class="btn btn-primary" title="Toàn bộ tính năng của TìmĐốiNhanh.com" href="${contextPath}/tien-ich.html">
                                <em class="glyphicon glyphicon-hand-right"></em>
                                XEM CHI TIẾT
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="fp-quick-buttons">
                    <div class="fp-btn-group">
                        <a href="${contextPath}/tim-doi-da-bong-tai-ha-noi" title="Tìm đối đá bóng tại Hà Nội" class="btn btn-info" id="fp-btn-match-hanoi">
                            <span class="count" id="matchHNCount">76</span> Đối thủ tại Hòa Vang
                        </a>
                        <a href="${contextPath}/tim-doi-da-bong-tai-ho-chi-minh" title="Tìm đối đá bóng tại Hồ Chí Minh" class="btn btn-info" id="fp-btn-match-hcm">
                            <span class="count" id="matchHCMCount">19</span> Đối tại Liên Chiểu
                        </a>
                        <a href="${contextPath}/tim-doi-da-bong-tai-da-nang" title="Tìm đối đá bóng tại Đà Nẵng" class="btn btn-info btn-sm" id="fp-btn-match-danang">
                            <span class="count" id="fp-btn-match-danang-count"></span> Đối tại Đà Nẵng
                        </a>
                        <a href="${contextPath}/doi-bong" title="Danh sách đội bóng tại Hà Nội, Hồ Chí Minh, Đà Nẵng..." class="btn btn-info" id="fp-btn-match-team">
                            <span class="count" id="teamAllCount">38</span> Đội bóng

                        </a>
                    </div>
                    <div class="fp-btn-group">
                        <a href="${contextPath}/san-bong-tai-lien-chieu" title="Sân bóng tại Liên Chiểu" class="btn btn-info" id="fp-btn-stadium-hanoi">
                            <span class="count" id="stadiumHNCount">18</span>
                            Sân bóng tại Liên Chiểu
                        </a>
                        <a href="${contextPath}/san-bong-tai-hai-chau" title="Sân bóng tại Hải Châu" class="btn btn-info" id="fp-btn-stadium-hcm">
                            <span class="count" id="stadiumHCMCount">62</span>
                            Sân bóng tại Hải Châu
                        </a>
                        <a href="${contextPath}/san-bong-tai-hoa-vang" title="Sân bóng tại Hòa Vang" class="btn btn-info btn-sm" id="fp-btn-stadium-danang">
                            <span class="count" id="stadiumDNCount">12</span>
                            Sân bóng tại Hòa Vang
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-5">
                <div id="account-creation-form">
                    <h3>Tạo tài khoản mới</h3>
                    <form id="frmRegister" method="post" class="form account-form ng-pristine ng-valid">
                        <div class="form-group">
                            <div class="alert alert-danger fade in hidden msg-wraper" role="alert">
                                <span class="messge"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <input name="FirstName" class="form-control" type="text" placeholder="Họ" required="" id="FirstName" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Họ tên bạn là gì?">
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <input name="LastName" class="form-control" type="text" placeholder="Tên" required="" id="LastName" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Họ tên bạn là gì?">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input name="UserName" class="form-control" type="text" placeholder="Số di động hoặc email" required="" id="UserNamea" oninvalid="sport.account.validUserName(this);" oninput="sport.account.validUserName(this);" data-msg-require="Vui lòng nhập số điện thoại hoặc địa chỉ email!" data-msg-username-invalid="Vui lòng nhập 1 số điện thoại hoặc địa chỉ email hợp lệ!">
                        </div>
                        <div class="input-group form-group-password">
                            <input name="Password" class="form-control" type="Password" placeholder="Mật khẩu mới" required="" id="Passwords" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Vui lòng điền mật khẩu của bạn?" aria-autocomplete="list">
                            <span class="input-group-btn">
                <button class="btn btn-default btn-showhide-password" type="button"><i class="glyphicon glyphicon-eye-open"></i></button>
            </span>
                        </div>
                        <div class="btn-form-reg">
                            <div class="row">
                                <div class="col-xs-12 col-md-6 col-md-6">
                                    <button class="btn btn-primary btn-block btn-lg" id="btnRegister" type="submit">Đăng ký</button>
                                </div>
                                <div class="col-xs-12 col-md-6 col-md-6">
                                    <div class="form-group social-login-group">
                                        <div class="div-logisn">Hoặc đăng nhập với:</div>

                                        <div class="login-social">
                                            <a class="logon-facebook" href="javascript:void(0)"><i class="fa fa-facebook-square"></i></a>
                                            <a class="login-google" href="javascript:void(0)"><i class="fa fa-google-plus-square"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-control-note text-justify">
                                Bằng cách nhấn vào nút "Đăng ký", Bạn đồng ý với
                                <a href="${contextPath}/dieu-khoan-su-dung.html" target="_blank">điều khoản sử dụng</a> và
                                <a href="${contextPath}/chinh-sach-bao-mat.html" target="_blank">chính sách bảo mật</a> của chúng tôi.
                            </div>
                        </div>
                    </form>
                </div> <!-- /.account-form -->

            </div>

        </div> <!--End container-->
    </div> <!--End fp-banner-->
</div>


<!-- footer -->

