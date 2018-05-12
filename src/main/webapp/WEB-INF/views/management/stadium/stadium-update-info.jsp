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
            <a ng-show="!isCreate" href="https://www.timdoinhanh.com/stadium/management#/stadium-info/1273" class="ng-binding">Nam Hoa Vang</a>
            <a ng-show="isCreate" class="ng-hide">Thêm mới</a>
        </div>
    </div>
</div>
<div class="content-wrap stadium-managment-page ng-scope">
    <!-- ngIf: loadingOverlay -->
    <div class="container">
        <div class="content-cts">
            <div class="item-card">
                <div class="row">
                    <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">

                        <ul id="myTab" class="nav nav-tabs" role="tablist">
                            <li ng-controller="StadiumBookingNotificationCtrl" class="ng-scope">
                                <a href="https://www.timdoinhanh.com/stadium/management#/booking" data-toggle="tab" aria-expanded="true">
                                    <i class="fa fa-list" aria-hidden="true"></i>
                                    Yêu cầu đặt sân <b class="badge badge-primary ng-binding" style="background-color:red">2</b>
                                </a>
                            </li>
                            <li class="active">
                                <a href="https://www.timdoinhanh.com/stadium/virtual.html#detail" data-toggle="tab" aria-expanded="true" class="ng-binding">
                                    <i class="glyphicon glyphicon-info-sign"></i>
                                    &nbsp;&nbsp;Thông tin cơ bản
                                </a>
                            </li>

                            <!-- ngIf: hasStadiumNumber --><li ng-if="hasStadiumNumber" class="ng-scope">
                                <a href="https://www.timdoinhanh.com/stadium/management#/bookingManager/1273" data-toggle="tab" aria-expanded="false">
                                    <i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;&nbsp;Đặt sân
                                </a>
                            </li><!-- end ngIf: hasStadiumNumber -->
                        </ul>
                        <div id="myTab1Content" class="tab-content">
                            <div class="tab-pane fade active in" id="detail">
                                <form name="frmStadiumInfo" class="ng-pristine ng-valid ng-valid-required ng-valid-min" style="">
    <div class="col-md-12">
        <div class="form-group row">
            <label class="col-md-3 control-label"><strong>Thông tin cơ bản</strong></label>
        </div>
        <div class="form-group row">
            <label class="col-md-3 col-form-label">Tên sân</label>
            <div class="col-md-9">
                <input type="text" ng-model="form.Name" id="name" name="stadiumName" style="font-weight: bold;" placeholder="Nhập tên sân" required="" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Bạn phải nhập tên sân" class="form-control ng-pristine ng-untouched ng-not-empty ng-valid ng-valid-required">

            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 col-form-label">Giới thiệu ngắn</label>
            <div class="col-md-9">
                <textarea id="summernote-basic-demo" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="form.Summary" rows="5" style=""></textarea>
            </div>

        </div>

        <div class="form-group row" style="display:none">
            <label class="col-md-3 col-form-label">Loại</label>
            <div class="col-md-5">
                <select id="ddlType" ng-model="form.selectedType" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-options="item.name for item in typeList track by item.id" style=""><option label="Bóng đá" value="1" selected="selected">Bóng đá</option><option label="Tennis" value="2">Tennis</option><option label="Bóng chuyền" value="3">Bóng chuyền</option><option label="Bóng bàn" value="4">Bóng bàn</option><option label="Cầu Lông" value="5">Cầu Lông</option><option label="Bơi lội" value="6">Bơi lội</option></select>
            </div>

        </div>

        <!-- ngIf: form.selectedType.id==1 --><div class="form-group row ng-scope" ng-if="form.selectedType.id==1" style="">
            <label class="col-md-3 col-form-label">Mặt sân</label>
            <div class="col-md-5">
                <select id="ddlStadiumType" ng-model="form.selectedStadiumType" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" ng-options="item as item.Text for item in stadiumTypes track by item.Value"><option label="Sân cỏ nhân tạo" value="1" selected="selected">Sân cỏ nhân tạo</option><option label="Sân cỏ tự nhiên" value="2">Sân cỏ tự nhiên</option><option label="Sân cát" value="3">Sân cát</option></select>
            </div>
        </div><!-- end ngIf: form.selectedType.id==1 -->


        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label"><strong>Địa chỉ</strong></label>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Tỉnh / Thành phố</label>
            <div class="col-md-5">
                <select id="ddlProvinces" ng-model="form.selectedProvince" ng-change="form.selectedCounty = form.selectedProvince.Children[0];" class="form-control select2-enabled ng-pristine ng-untouched ng-valid select2-hidden-accessible ng-not-empty" ng-options="item as item.Name for item in provinces track by item.Id" tabindex="-1" aria-hidden="true" style=""><option label="Cần Thơ" value="1">Cần Thơ</option><option label="Đà Nẵng" value="2" selected="selected">Đà Nẵng</option><option label="Hà Nội" value="3">Hà Nội</option><option label="Hải Phòng" value="4">Hải Phòng</option><option label="Hồ Chí Minh" value="5">Hồ Chí Minh</option><option label="An Giang" value="6">An Giang</option><option label="Bà Rịa - Vũng Tàu" value="7">Bà Rịa - Vũng Tàu</option><option label="Bắc Giang" value="8">Bắc Giang</option><option label="Bắc Kạn" value="9">Bắc Kạn</option><option label="Bạc Liêu" value="10">Bạc Liêu</option><option label="Bắc Ninh" value="11">Bắc Ninh</option><option label="Bến Tre" value="12">Bến Tre</option><option label="Bình Định" value="13">Bình Định</option><option label="Bình Dương" value="14">Bình Dương</option><option label="Bình Phước" value="15">Bình Phước</option><option label="Bình Thuận" value="16">Bình Thuận</option><option label="Cà Mau" value="17">Cà Mau</option><option label="Cao Bằng" value="18">Cao Bằng</option><option label="Đắk Lắk" value="19">Đắk Lắk</option><option label="Đắk Nông" value="20">Đắk Nông</option><option label="Điện Biên" value="21">Điện Biên</option><option label="Đồng Nai" value="22">Đồng Nai</option><option label="Đồng Tháp" value="23">Đồng Tháp</option><option label="Gia Lai" value="24">Gia Lai</option><option label="Hà Giang" value="25">Hà Giang</option><option label="Hà Nam" value="26">Hà Nam</option><option label="Hà Tĩnh" value="27">Hà Tĩnh</option><option label="Hải Dương" value="28">Hải Dương</option><option label="Hậu Giang" value="29">Hậu Giang</option><option label="Hoà Bình" value="30">Hoà Bình</option><option label="Hưng Yên" value="31">Hưng Yên</option><option label="Khánh Hòa" value="32">Khánh Hòa</option><option label="Kiên Giang" value="33">Kiên Giang</option><option label="Kon Tum" value="34">Kon Tum</option><option label="Lai Châu" value="35">Lai Châu</option><option label="Lâm Đồng" value="36">Lâm Đồng</option><option label="Lạng Sơn" value="37">Lạng Sơn</option><option label="Lào Cai" value="38">Lào Cai</option><option label="Long An" value="39">Long An</option><option label="Nam Định" value="40">Nam Định</option><option label="Nghệ An" value="41">Nghệ An</option><option label="Ninh Bình" value="42">Ninh Bình</option><option label="Ninh Thuận" value="43">Ninh Thuận</option><option label="Phú Thọ" value="44">Phú Thọ</option><option label="Phú Yên" value="45">Phú Yên</option><option label="Quảng Bình" value="46">Quảng Bình</option><option label="Quảng Nam" value="47">Quảng Nam</option><option label="Quảng Ngãi" value="48">Quảng Ngãi</option><option label="Quảng Ninh" value="49">Quảng Ninh</option><option label="Quảng Trị" value="50">Quảng Trị</option><option label="Sóc Trăng" value="51">Sóc Trăng</option><option label="Sơn La" value="52">Sơn La</option><option label="Tây Ninh" value="53">Tây Ninh</option><option label="Thái Bình" value="54">Thái Bình</option><option label="Thái Nguyên" value="55">Thái Nguyên</option><option label="Thanh Hóa" value="56">Thanh Hóa</option><option label="Thừa Thiên Huế" value="57">Thừa Thiên Huế</option><option label="Tiền Giang" value="58">Tiền Giang</option><option label="Trà Vinh" value="59">Trà Vinh</option><option label="Tuyên Quang" value="60">Tuyên Quang</option><option label="Vĩnh Long" value="61">Vĩnh Long</option><option label="Vĩnh Phúc" value="62">Vĩnh Phúc</option><option label="Yên Bái" value="63">Yên Bái</option></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 460px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-ddlProvinces-container"><span class="select2-selection__rendered" id="select2-ddlProvinces-container" title="Đà Nẵng">Đà Nẵng</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-3 control-label">Quận / huyện</label>
            <div class="col-md-5">
                <select required="" id="ddlCounties" ng-model="form.selectedCounty" class="form-control select2-enabled ng-pristine ng-untouched select2-hidden-accessible ng-not-empty ng-valid ng-valid-required" ng-options="item as item.Name for item in form.selectedProvince.Children track by item.Id" tabindex="-1" aria-hidden="true" style=""><option label="Quận Liên Chiểu" value="474" selected="selected">Quận Liên Chiểu</option><option label="Quận Thanh Khê" value="475">Quận Thanh Khê</option><option label="Quận Hải Châu" value="476">Quận Hải Châu</option><option label="Quận Sơn Trà" value="477">Quận Sơn Trà</option><option label="Quận Ngũ Hành Sơn" value="478">Quận Ngũ Hành Sơn</option><option label="Quận Cẩm Lệ" value="479">Quận Cẩm Lệ</option><option label="Huyện Hòa Vang" value="480">Huyện Hòa Vang</option><option label="Huyện Hoàng Sa" value="481">Huyện Hoàng Sa</option></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 460px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-ddlCounties-container"><span class="select2-selection__rendered" id="select2-ddlCounties-container" title="Quận Liên Chiểu">Quận Liên Chiểu</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Số nhà / ngõ / tên đường</label>
            <div class="col-md-5">
                <input required="" oninvalid="sport.account.validateControl(this);" placeholder="Địa chỉ sân" oninput="sport.account.validateControl(this);" data-msg-require="Ví dụ: Số 88 Lê Văn Lương" ng-model="form.Address" class="form-control ng-pristine ng-untouched ng-not-empty ng-valid ng-valid-required" style="">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Bản đồ</label>
            <div class="col-md-5">
                <label class="control-label">Vị trí trên bản đồ <img class="google-map-icon" height="20" ng-click="initMap()" ng-src="/Assets/img/map.jpg" src="img/map.jpg"></label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-3 control-label">Latitude</label>
            <div class="col-md-5">
                <input ng-model="form.Latitude" id="latitude" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Longitude</label>
            <div class="col-md-5">
                <input ng-model="form.Longitude" id="longitude" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
            </div>
        </div>


        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label"><strong>Thông tin liên hệ</strong></label>
        </div>
        <div class="form-group row">
            <label class="col-md-3 control-label">Điện thoại</label>
            <div class="col-md-5">
                <input required="" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" placeholder="Điện thoại liên hệ đặt sân" data-msg-require="Bạn phải nhập Điện thoại liên hệ đặt sân" ng-model="form.MobileNumbers" class="form-control ng-pristine ng-untouched ng-not-empty ng-valid ng-valid-required" style="">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Địa chỉ email</label>
            <div class="col-md-5">
                <input ng-model="form.EmailAddress" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" style="">
                       
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Facebook</label>
            <div class="col-md-5">
                <input ng-model="form.Facebook" placeholder="Địa chỉ facebook" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" style="">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Website</label>
            <div class="col-md-5">
                <input ng-model="form.Website" placeholder="Địa chỉ website" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" style="">
            </div>
        </div>

        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label"><strong>Hình ảnh sân</strong></label>
        </div>
        <div class="form-group row">
            <label class="col-md-3 control-label">Ảnh đại diện</label>
            <div class="col-md-5">
                <!-- ngIf: form.PicturePath --><img class="thumbnail-logo width-100p ng-scope" ng-src="https://res.givator.com/pictures/11017/500/2018_04/original/be-the-good.jpg" ng-if="form.PicturePath" src="img/be-the-good.jpg" style=""><!-- end ngIf: form.PicturePath -->
                <input id="previewImagePath" type="file" file-model="imageLogo">
                <input ng-model="form.PicturePath" value="https://res.givator.com/pictures/11017/500/2018_04/original/be-the-good.jpg" type="hidden" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" id="inpLogoFilePath" placeholder="" style="">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-3 col-form-label">Slideshow</label>
            <div class="col-md-5">
                <div id="fileuploader"><div class="ajax-upload-dragdrop" style="vertical-align: top; width: 400px;"><div class="ajax-file-upload" style="position: relative; overflow: hidden; cursor: default;">Upload<form method="POST" action="https://www.timdoinhanh.com/ajax/stadium/uploadprofile" '="" enctype="multipart/form-data" style="margin: 0px; padding: 0px;"><input type="file" id="ajax-upload-id-1525529379165" name="profileUpload[]" accept="*" multiple="" style="position: absolute; cursor: pointer; top: 0px; width: 100%; height: 100%; left: 0px; z-index: 100; opacity: 0;"></form></div><span><b>Drag &amp; Drop Files</b></span></div><div></div></div><div class="ajax-file-upload-container"></div>

                <div class="highslide-gallery gallery"><a class="mediaItem"><img class="thumb" src="img/be-the-good.jpg" title=""><img src="img/icon-delete.jpg" onclick="deleteImage(this)" class="icon-delete"><input type="hidden" name="FilePath" value="https://res.givator.com/pictures/11017/500/2018_04/original/be-the-good.jpg"><input type="hidden" name="Id" value="591"></a><a class="mediaItem"><img class="thumb" src="img/be-the-good.jpg" title=""><img src="img/icon-delete.jpg" onclick="deleteImage(this)" class="icon-delete"><input type="hidden" name="FilePath" value="https://res.givator.com/pictures/11017/500/2018_04/original/be-the-good.jpg"><input type="hidden" name="Id" value="592"></a></div>
            </div>
        </div>

        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Giới thiệu</label>
            <div class="col-md-9">
                <textarea></textarea>
            </div>
        </div>

        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>

        <div class="form-group row">
            <div class="col-md-12">
<h4>
    Giá thuê sân / 1 trận
</h4>

<!-- ngRepeat: stadiumNumberRow in stadiumNumberRows track by $index --><div class="snp-settings ng-scope" ng-repeat="stadiumNumberRow in stadiumNumberRows track by $index" ng-init="snIndex = $index" style="">
    <div class="sn-settings-top row">
        <!-- ngIf: selectedType.id!=1 -->
        <!-- ngIf: selectedType.id==1 --><div class="col-md-12 ng-scope" ng-if="selectedType.id==1">
            <div class="sn-settings-bar">
                <div class="pull-left sn-settings-name">
                    <!-- ngIf: selectedType.id==1 --><span ng-if="selectedType.id==1" style="float: left;margin-top: 3px" class="ng-binding ng-scope">
                        <i class="fa fa-check-square" aria-hidden="true"></i>
                        Loại sân: 5 người (4 sân) 
                    </span><!-- end ngIf: selectedType.id==1 -->
                    <div class="btn-group pull-right mobile-float-none" style="margin-left: 10px">
                        <button type="button" class="btn btn-default btn-sm dropdown-toggle text-center" data-toggle="dropdown">
                            <i class="fa fa-cog mr-0" aria-hidden="true"></i>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a ng-click="addStadiumNumberPrice($index)" class="pointer"><i class="fa fa-database" aria-hidden="true"></i> &nbsp;Thêm giá</a>
                            </li>
                            <li>
                                <a ng-click="changeStadiumNumberQuantity(stadiumNumberRow)" class="pointer"><i class="fa fa-pencil" aria-hidden="true"></i> &nbsp;Thay đổi số lượng</a>
                            </li>
                            <li>
                                <a ng-click="removeStadiumNumberRow(stadiumNumberRow, $index)" class="pointer"><i class="fa fa-remove" aria-hidden="true"></i> &nbsp;Xóa</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!-- end ngIf: selectedType.id==1 -->

    </div>
    <div class="stadium-number-prices">
        <table class="table table-bordered text-left table-responsive stadium-number-price-table">
            <thead>
                <tr>
                    <th>
                        Khung giờ
                    </th>
                    <th>
                        Ngày trong tuần
                    </th>
                    <th>
                        Giá
                    </th>
                    <th>Xóa</th>
                </tr>
            </thead>
            <tbody>
                <!-- ngRepeat: stadiumNumberPrice in stadiumNumberRow.stadiumNumberPrices track by $index --><tr ng-repeat="stadiumNumberPrice in stadiumNumberRow.stadiumNumberPrices track by $index" ng-init="priceIndex = $index" class="ng-scope">
                    <td class="sn-price-time-td">
                        <div class="form-inline">
                            <input type="text" class="form-control input-sm textbox-timepicker ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="stadiumNumberPrice.startTime">
                            <input type="text" class="form-control input-sm textbox-timepicker ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="stadiumNumberPrice.endTime">
                            <a class="btn btn-default btn-sm mobile-only btn-delete-price" title="Xóa giá" ng-click="removeStadiumNumberPrice(snIndex, priceIndex)">
                                <i class="fa fa-remove" aria-hidden="true"></i>
                            </a>
                        </div>
                    </td>
                    <td class="sn-price-day-picker">
                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><div ng-if="stadiumNumberPrice.isEditMode || true" class="ng-scope">
                            <div class="btn-group bootstrap-select show-tick ng-pristine ng-untouched ng-valid ng-not-empty"><button type="button" class="btn dropdown-toggle btn-default" data-toggle="dropdown" role="button" title="T2-T6"><span class="filter-option pull-left">T2-T6</span>&nbsp;<span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><ul class="dropdown-menu inner" role="listbox" aria-expanded="false"><li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="true"><span class="text">T2-T6</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="1"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">T7CN</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">T7</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="3"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">CN</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="4"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">HOLIDAY</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div><select multiple="" class="selectpicker ng-pristine ng-untouched ng-valid ng-not-empty" style="width:100%" data-ng-model="stadiumNumberPrice.selectedTimeGroups" title="--Chọn ngày--" data-ng-options="timeGroup.Text for timeGroup in stadiumNumberPrice.timeGroups track by timeGroup.Value" tabindex="-98"><option label="T2-T6" value="T2-T6">T2-T6</option><option label="T7CN" value="T7CN">T7CN</option><option label="T7" value="T7">T7</option><option label="CN" value="CN">CN</option><option label="HOLIDAY" value="HOLIDAY">HOLIDAY</option></select></div>
                        </div><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
                    </td>
                    <td class="sn-price-price-td">
                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><input onkeydown="return isNumberKey(event)" type="text" ng-if="stadiumNumberPrice.isEditMode || true" ng-model="stadiumNumberPrice.price" min="0" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-scope ng-not-empty ng-valid-min" ui-number-mask="0"><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
                    </td>
                    <td class="sn-price-delete-td">
                        <a class="btn btn-default btn-sm" title="Xóa giá" ng-click="removeStadiumNumberPrice(snIndex, priceIndex)">
                            <i class="fa fa-remove" aria-hidden="true"></i>
                        </a>
                    </td>
                </tr><!-- end ngRepeat: stadiumNumberPrice in stadiumNumberRow.stadiumNumberPrices track by $index --><tr ng-repeat="stadiumNumberPrice in stadiumNumberRow.stadiumNumberPrices track by $index" ng-init="priceIndex = $index" class="ng-scope">
                    <td class="sn-price-time-td">
                        <div class="form-inline">
                            <input type="text" class="form-control input-sm textbox-timepicker ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="stadiumNumberPrice.startTime">
                            <input type="text" class="form-control input-sm textbox-timepicker ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="stadiumNumberPrice.endTime">
                            <a class="btn btn-default btn-sm mobile-only btn-delete-price" title="Xóa giá" ng-click="removeStadiumNumberPrice(snIndex, priceIndex)">
                                <i class="fa fa-remove" aria-hidden="true"></i>
                            </a>
                        </div>
                    </td>
                    <td class="sn-price-day-picker">
                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><div ng-if="stadiumNumberPrice.isEditMode || true" class="ng-scope">
                            <div class="btn-group bootstrap-select show-tick ng-pristine ng-untouched ng-valid ng-not-empty"><button type="button" class="btn dropdown-toggle btn-default" data-toggle="dropdown" role="button" title="T7CN"><span class="filter-option pull-left">T7CN</span>&nbsp;<span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><ul class="dropdown-menu inner" role="listbox" aria-expanded="false"><li data-original-index="0"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">T2-T6</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="1" class="selected"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="true"><span class="text">T7CN</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">T7</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="3"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">CN</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="4"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">HOLIDAY</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div><select multiple="" class="selectpicker ng-pristine ng-untouched ng-valid ng-not-empty" style="width:100%" data-ng-model="stadiumNumberPrice.selectedTimeGroups" title="--Chọn ngày--" data-ng-options="timeGroup.Text for timeGroup in stadiumNumberPrice.timeGroups track by timeGroup.Value" tabindex="-98"><option label="T2-T6" value="T2-T6">T2-T6</option><option label="T7CN" value="T7CN">T7CN</option><option label="T7" value="T7">T7</option><option label="CN" value="CN">CN</option><option label="HOLIDAY" value="HOLIDAY">HOLIDAY</option></select></div>
                        </div><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
                    </td>
                    <td class="sn-price-price-td">
                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><input onkeydown="return isNumberKey(event)" type="text" ng-if="stadiumNumberPrice.isEditMode || true" ng-model="stadiumNumberPrice.price" min="0" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-scope ng-not-empty ng-valid-min" ui-number-mask="0"><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
                    </td>
                    <td class="sn-price-delete-td">
                        <a class="btn btn-default btn-sm" title="Xóa giá" ng-click="removeStadiumNumberPrice(snIndex, priceIndex)">
                            <i class="fa fa-remove" aria-hidden="true"></i>
                        </a>
                    </td>
                </tr><!-- end ngRepeat: stadiumNumberPrice in stadiumNumberRow.stadiumNumberPrices track by $index -->
            </tbody>
        </table>
    </div>
</div><!-- end ngRepeat: stadiumNumberRow in stadiumNumberRows track by $index --><div class="snp-settings ng-scope" ng-repeat="stadiumNumberRow in stadiumNumberRows track by $index" ng-init="snIndex = $index">
    <div class="sn-settings-top row">
        <!-- ngIf: selectedType.id!=1 -->
        <!-- ngIf: selectedType.id==1 --><div class="col-md-12 ng-scope" ng-if="selectedType.id==1">
            <div class="sn-settings-bar">
                <div class="pull-left sn-settings-name">
                    <!-- ngIf: selectedType.id==1 --><span ng-if="selectedType.id==1" style="float: left;margin-top: 3px" class="ng-binding ng-scope">
                        <i class="fa fa-check-square" aria-hidden="true"></i>
                        Loại sân: 7 người (1 sân) 
                    </span><!-- end ngIf: selectedType.id==1 -->
                    <div class="btn-group pull-right mobile-float-none" style="margin-left: 10px">
                        <button type="button" class="btn btn-default btn-sm dropdown-toggle text-center" data-toggle="dropdown">
                            <i class="fa fa-cog mr-0" aria-hidden="true"></i>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a ng-click="addStadiumNumberPrice($index)" class="pointer"><i class="fa fa-database" aria-hidden="true"></i> &nbsp;Thêm giá</a>
                            </li>
                            <li>
                                <a ng-click="changeStadiumNumberQuantity(stadiumNumberRow)" class="pointer"><i class="fa fa-pencil" aria-hidden="true"></i> &nbsp;Thay đổi số lượng</a>
                            </li>
                            <li>
                                <a ng-click="removeStadiumNumberRow(stadiumNumberRow, $index)" class="pointer"><i class="fa fa-remove" aria-hidden="true"></i> &nbsp;Xóa</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!-- end ngIf: selectedType.id==1 -->

    </div>
    <div class="stadium-number-prices">
        <table class="table table-bordered text-left table-responsive stadium-number-price-table">
            <thead>
                <tr>
                    <th>
                        Khung giờ
                    </th>
                    <th>
                        Ngày trong tuần
                    </th>
                    <th>
                        Giá
                    </th>
                    <th>Xóa</th>
                </tr>
            </thead>
            <tbody>
                <!-- ngRepeat: stadiumNumberPrice in stadiumNumberRow.stadiumNumberPrices track by $index --><tr ng-repeat="stadiumNumberPrice in stadiumNumberRow.stadiumNumberPrices track by $index" ng-init="priceIndex = $index" class="ng-scope">
                    <td class="sn-price-time-td">
                        <div class="form-inline">
                            <input type="text" class="form-control input-sm textbox-timepicker ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="stadiumNumberPrice.startTime">
                            <input type="text" class="form-control input-sm textbox-timepicker ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="stadiumNumberPrice.endTime">
                            <a class="btn btn-default btn-sm mobile-only btn-delete-price" title="Xóa giá" ng-click="removeStadiumNumberPrice(snIndex, priceIndex)">
                                <i class="fa fa-remove" aria-hidden="true"></i>
                            </a>
                        </div>
                    </td>
                    <td class="sn-price-day-picker">
                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><div ng-if="stadiumNumberPrice.isEditMode || true" class="ng-scope">
                            <div class="btn-group bootstrap-select show-tick ng-pristine ng-untouched ng-valid ng-not-empty"><button type="button" class="btn dropdown-toggle btn-default" data-toggle="dropdown" role="button" title="T2-T6"><span class="filter-option pull-left">T2-T6</span>&nbsp;<span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><ul class="dropdown-menu inner" role="listbox" aria-expanded="false"><li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="true"><span class="text">T2-T6</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="1"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">T7CN</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">T7</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="3"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">CN</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="4"><a tabindex="0" class="" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">HOLIDAY</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div><select multiple="" class="selectpicker ng-pristine ng-untouched ng-valid ng-not-empty" style="width:100%" data-ng-model="stadiumNumberPrice.selectedTimeGroups" title="--Chọn ngày--" data-ng-options="timeGroup.Text for timeGroup in stadiumNumberPrice.timeGroups track by timeGroup.Value" tabindex="-98"><option label="T2-T6" value="T2-T6">T2-T6</option><option label="T7CN" value="T7CN">T7CN</option><option label="T7" value="T7">T7</option><option label="CN" value="CN">CN</option><option label="HOLIDAY" value="HOLIDAY">HOLIDAY</option></select></div>
                        </div><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
                    </td>
                    <td class="sn-price-price-td">
                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><input onkeydown="return isNumberKey(event)" type="text" ng-if="stadiumNumberPrice.isEditMode || true" ng-model="stadiumNumberPrice.price" min="0" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-scope ng-not-empty ng-valid-min" ui-number-mask="0"><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
                    </td>
                    <td class="sn-price-delete-td">
                        <a class="btn btn-default btn-sm" title="Xóa giá" ng-click="removeStadiumNumberPrice(snIndex, priceIndex)">
                            <i class="fa fa-remove" aria-hidden="true"></i>
                        </a>
                    </td>
                </tr><!-- end ngRepeat: stadiumNumberPrice in stadiumNumberRow.stadiumNumberPrices track by $index -->
            </tbody>
        </table>
    </div>
</div><!-- end ngRepeat: stadiumNumberRow in stadiumNumberRows track by $index -->


<!-- ngIf: (selectedType.id==1 && additionalSN.availableSizes.length>0) || stadiumNumberRows.length==0 --><div class="form-inline ng-scope" ng-if="(selectedType.id==1 &amp;&amp; additionalSN.availableSizes.length&gt;0) || stadiumNumberRows.length==0">
    <div class="form-group pull-right sn-addition-row" ng-show="allowToAddMoreStadiumNumber || true" style="margin-top:15px;">
        <select ng-model="additionalSN.selectedSize" ng-show="selectedType.id==1" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-not-empty" ng-options="item.name for item in additionalSN.availableSizes track by item.id" style=""><option label="9 người" value="9" selected="selected">9 người</option><option label="11 người" value="11">11 người</option></select>

        <input onkeydown="return isNumberKey(event)" type="text" ng-model="additionalSN.quantity" min="0" max="100" class="form-control input-sm quantity ng-pristine ng-untouched ng-valid ng-empty" placeholder="Số lượng" style="width:100px">

        <button ng-click="addStadiumNumberRow()" style="width:90px" class="btn btn-tertiary btn-sm addStadiumNumberRow" title="Thêm">
            Thêm &gt;&gt;
        </button>
    </div>
</div><!-- end ngIf: (selectedType.id==1 && additionalSN.availableSizes.length>0) || stadiumNumberRows.length==0 -->


<style type="text/css">
    .sn-price-day-picker > div {
        width: 100% !important;
    }

    tfoot.sn-addition-row > tr > td {
        border: none !important;
    }

    #stadium-management-price-table .textbox-timepicker {
        width: 80px !important;
    }

    .xdsoft_datetimepicker .xdsoft_timepicker, .form-control.quantity {
        width: 75px;
    }

        .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box > div > div {
            font-size: 14px;
        }

        .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_prev {
            background-position: -33px 0;
        }
</style>
            </div>
        </div>

        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>


        <div class="form-group row" style="margin-top:30px">
            <div class="col-md-3">
            </div>
            <div class="col-md-9 text-right">
                <!-- ngIf: showUpdateResults && showSuccessMessage -->
                <!-- ngIf: showUpdateResults && showErrorMessage -->

                <a class="btn btn-default" ng-href="/stadium/management" href="https://www.timdoinhanh.com/stadium/management">Quay lại</a>
                &nbsp;
                <!-- ngIf: isCreate -->

                <!-- ngIf: !isCreate --><button type="submit" id="btnUpdateStadium" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý..." class="btn btn-primary btn-primary-extra ng-scope" ng-if="!isCreate" ng-click="frmStadiumInfo.$valid &amp;&amp; saveChange($event)">
                    <i class="fa fa-save"></i>
                    Lưu thay đổi
                </button><!-- end ngIf: !isCreate -->

            </div> <!-- /.col -->

        </div> <!-- /.form-group -->
    </div>

</form>

<div id="mapModal" class="modal modal-styled fade">
    <div class="modal-dialog modal-lg">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 class="modal-title">Chọn vị trí bản đồ</h3>
            </div>
            <div class="modal-body">
                <div class="col-sm-12">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label">Tỉnh/Thành</label>
                        <div class="col-md-4">
                            <select id="ddlMapSelectedProvince" ng-model="map.selectedProvince" ng-change="map.selectedCounty = map.selectedProvince.Children[0];" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" style="width: 100%;" ng-options="item as item.Name for item in provinces track by item.Id"><option label="Cần Thơ" value="1">Cần Thơ</option><option label="Đà Nẵng" value="2" selected="selected">Đà Nẵng</option><option label="Hà Nội" value="3">Hà Nội</option><option label="Hải Phòng" value="4">Hải Phòng</option><option label="Hồ Chí Minh" value="5">Hồ Chí Minh</option><option label="An Giang" value="6">An Giang</option><option label="Bà Rịa - Vũng Tàu" value="7">Bà Rịa - Vũng Tàu</option><option label="Bắc Giang" value="8">Bắc Giang</option><option label="Bắc Kạn" value="9">Bắc Kạn</option><option label="Bạc Liêu" value="10">Bạc Liêu</option><option label="Bắc Ninh" value="11">Bắc Ninh</option><option label="Bến Tre" value="12">Bến Tre</option><option label="Bình Định" value="13">Bình Định</option><option label="Bình Dương" value="14">Bình Dương</option><option label="Bình Phước" value="15">Bình Phước</option><option label="Bình Thuận" value="16">Bình Thuận</option><option label="Cà Mau" value="17">Cà Mau</option><option label="Cao Bằng" value="18">Cao Bằng</option><option label="Đắk Lắk" value="19">Đắk Lắk</option><option label="Đắk Nông" value="20">Đắk Nông</option><option label="Điện Biên" value="21">Điện Biên</option><option label="Đồng Nai" value="22">Đồng Nai</option><option label="Đồng Tháp" value="23">Đồng Tháp</option><option label="Gia Lai" value="24">Gia Lai</option><option label="Hà Giang" value="25">Hà Giang</option><option label="Hà Nam" value="26">Hà Nam</option><option label="Hà Tĩnh" value="27">Hà Tĩnh</option><option label="Hải Dương" value="28">Hải Dương</option><option label="Hậu Giang" value="29">Hậu Giang</option><option label="Hoà Bình" value="30">Hoà Bình</option><option label="Hưng Yên" value="31">Hưng Yên</option><option label="Khánh Hòa" value="32">Khánh Hòa</option><option label="Kiên Giang" value="33">Kiên Giang</option><option label="Kon Tum" value="34">Kon Tum</option><option label="Lai Châu" value="35">Lai Châu</option><option label="Lâm Đồng" value="36">Lâm Đồng</option><option label="Lạng Sơn" value="37">Lạng Sơn</option><option label="Lào Cai" value="38">Lào Cai</option><option label="Long An" value="39">Long An</option><option label="Nam Định" value="40">Nam Định</option><option label="Nghệ An" value="41">Nghệ An</option><option label="Ninh Bình" value="42">Ninh Bình</option><option label="Ninh Thuận" value="43">Ninh Thuận</option><option label="Phú Thọ" value="44">Phú Thọ</option><option label="Phú Yên" value="45">Phú Yên</option><option label="Quảng Bình" value="46">Quảng Bình</option><option label="Quảng Nam" value="47">Quảng Nam</option><option label="Quảng Ngãi" value="48">Quảng Ngãi</option><option label="Quảng Ninh" value="49">Quảng Ninh</option><option label="Quảng Trị" value="50">Quảng Trị</option><option label="Sóc Trăng" value="51">Sóc Trăng</option><option label="Sơn La" value="52">Sơn La</option><option label="Tây Ninh" value="53">Tây Ninh</option><option label="Thái Bình" value="54">Thái Bình</option><option label="Thái Nguyên" value="55">Thái Nguyên</option><option label="Thanh Hóa" value="56">Thanh Hóa</option><option label="Thừa Thiên Huế" value="57">Thừa Thiên Huế</option><option label="Tiền Giang" value="58">Tiền Giang</option><option label="Trà Vinh" value="59">Trà Vinh</option><option label="Tuyên Quang" value="60">Tuyên Quang</option><option label="Vĩnh Long" value="61">Vĩnh Long</option><option label="Vĩnh Phúc" value="62">Vĩnh Phúc</option><option label="Yên Bái" value="63">Yên Bái</option></select>

                        </div>
                        <label class="col-md-2 control-label">Quận/huyện</label>
                        <div class="col-md-4">
                            <select id="ddlMapSelectedCounty" ng-model="map.selectedCounty" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" style="width: 100%;" ng-options="item as item.Name for item in map.selectedProvince.Children track by item.Id"><option label="Quận Liên Chiểu" value="474" selected="selected">Quận Liên Chiểu</option><option label="Quận Thanh Khê" value="475">Quận Thanh Khê</option><option label="Quận Hải Châu" value="476">Quận Hải Châu</option><option label="Quận Sơn Trà" value="477">Quận Sơn Trà</option><option label="Quận Ngũ Hành Sơn" value="478">Quận Ngũ Hành Sơn</option><option label="Quận Cẩm Lệ" value="479">Quận Cẩm Lệ</option><option label="Huyện Hòa Vang" value="480">Huyện Hòa Vang</option><option label="Huyện Hoàng Sa" value="481">Huyện Hoàng Sa</option></select>

                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label">Địa chỉ</label>
                        <div class="col-md-8">
                            <input id="txtMapAddress" ng-model="map.Address" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                        </div>
                        <div class="col-md-2">
                            <button type="button" ng-click="searchMap()" class="form-control btn-tertiary"><i class="ui-icon-search"></i>Tìm kiếm</button>
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <div id="google-map" style="height: 350px"></div>
                    </div>
                </div>
            </div> <!-- /.modal-body -->
            <div class="modal-footer">
                <span style="margin-left:30px;" class="pull-left"><b>Lat:</b><span class="lat">21.026939</span></span>
                <span style="margin-left:15px;" class="pull-left"><b>Long:</b><span class="long">105.833358</span></span>
                <button type="button" ng-click="selectMap()" class="btn btn-primary">Chọn</button>
                <button type="button" class="btn btn-default close" data-dismiss="modal">Thoát</button>
            </div> <!-- /.modal-footer -->
        </div> <!-- /.modal-content -->
    </div><!-- /.modal-dialog -->

</div>

<style>
    table.text-center tr th, table.text-center tr td {
        text-align: center;
        vertical-align: middle;
    }

    /*table.stadium-number > tbody > tr > td {
        padding: 3px !important;
    }*/
    table.stadium-number {
        margin-bottom: 0px !important;
    }

    .thumb {
        height: 75px;
        border: 1px solid #000;
        margin: 10px 5px 0 0;
        width: 104px;
    }

    .ajax-file-upload-container {
        display: none !important;
    }

    .gallery a {
        position: relative;
    }

    .icon-delete {
        height: 17px;
        position: absolute;
        top: 36px;
        left: 80px;
        cursor: pointer;
        z-index: 9999;
        display: none;
    }

    .gallery a:hover .icon-delete {
        display: block;
    }
</style>
                            </div> <!-- /.tab-pane -->
                            
                            <div class="tab-pane fade" id="stadiumCalendar">
                                
                            </div> <!-- /.tab-pane -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
