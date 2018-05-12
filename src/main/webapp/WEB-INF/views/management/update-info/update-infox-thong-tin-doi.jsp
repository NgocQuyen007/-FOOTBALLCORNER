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
                <div class="img-doio"><img class="img-responsive" align="thumb" src="img/sis_1.jpg"></div>
                <div class="title-doi">
                    <h1>fc2013_t4 <span class="gender"><i class="fa fa-mars" aria-hidden="true"></i></span></h1>
                    <p>Phan Trường (đội trưởng)<span class="online"></span></p>
                </div>
                <div class="wrap-ul-doi">
                    <ul class="list-link-doi">
                        <li id="team-settings" class="active"><a href="https://www.timdoinhanh.com/team/management?id=9293#setting">Thông tin đội</a></li>
                        <li id="team-users"><a href="https://www.timdoinhanh.com/team/management?id=9293#users">Thành viên</a></li>
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
                <!-- ngView: --><div id="settings-content" class="tab-content stacked-content ng-scope" ng-view="">
                <div class="page-team-setting layout-main-content ng-scope">
                    <div class="heading-block">
                        <!-- ngIf: teamId == 0 -->
                        <!-- ngIf: teamId > 0 --><p ng-if="teamId &gt; 0" class="title-box ng-scope"><i class="fa fa-map-marker" aria-hidden="true"></i> Cập nhật thông tin đội bóng</p><!-- end ngIf: teamId > 0 -->
                    </div> <!-- /.heading-block -->
                    <form class="form-horizontal ng-valid ng-dirty ng-valid-parse" role="form" style="">
                        <div class="form-group alert alert-warning">
                            <label class="control-label col-sm-3"><strong>Địa chỉ truy cập:</strong></label>
                            <div class="col-sm-9">
                                <a target="_blank" href="https://www.timdoinhanh.com/fc2013_t4">https://www.timdoinhanh.com/</a><input type="text" ng-model="team.logicalName" class="input-transparent ng-pristine ng-untouched ng-valid ng-not-empty" style="">
                                <button type="button" ng-click="checkTeamLogicalName($event)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý..." class="btn btn-primary inlineBlock btn-sm">Kiểm tra</button>
                                <p ng-show="checkLogicalName==1" style="font-style:italic; color:blue" class="ng-hide">
                                    <i class="fa fa-check"></i> Địa chỉ khả dụng
                                </p>
                                <p ng-show="checkLogicalName==2" style="font-style:italic; color:red" class="ng-hide">
                                    <i class="fa fa-ban"></i> Địa chỉ KHÔNG khả dụng
                                </p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">Tên đội:</label>
                            <div class="col-sm-9">
                                <input ng-model="team.name" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" id="inpName" placeholder="Nhập tên đội bóng của bạn" style="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Tỉnh/Thành phố:</label>
                            <div class="col-sm-9">
                                <select ng-model="teamProvinceId" ng-change="onChangeProvince();" id="sltProvince" class="form-control select2-enabled ng-pristine ng-untouched ng-valid ng-not-empty select2-hidden-accessible" ng-options="province.id as province.name for province in listProvinces track by province.id" tabindex="-1" aria-hidden="true"><option label="Cần Thơ" value="1">Cần Thơ</option><option label="Đà Nẵng" value="2">Đà Nẵng</option><option label="Hà Nội" value="3">Hà Nội</option><option label="Hải Phòng" value="4">Hải Phòng</option><option label="Hồ Chí Minh" value="5">Hồ Chí Minh</option><option label="An Giang" value="6">An Giang</option><option label="Bà Rịa - Vũng Tàu" value="7">Bà Rịa - Vũng Tàu</option><option label="Bắc Giang" value="8">Bắc Giang</option><option label="Bắc Kạn" value="9">Bắc Kạn</option><option label="Bạc Liêu" value="10">Bạc Liêu</option><option label="Bắc Ninh" value="11">Bắc Ninh</option><option label="Bến Tre" value="12">Bến Tre</option><option label="Bình Định" value="13">Bình Định</option><option label="Bình Dương" value="14">Bình Dương</option><option label="Bình Phước" value="15">Bình Phước</option><option label="Bình Thuận" value="16">Bình Thuận</option><option label="Cà Mau" value="17">Cà Mau</option><option label="Cao Bằng" value="18">Cao Bằng</option><option label="Đắk Lắk" value="19">Đắk Lắk</option><option label="Đắk Nông" value="20">Đắk Nông</option><option label="Điện Biên" value="21">Điện Biên</option><option label="Đồng Nai" value="22">Đồng Nai</option><option label="Đồng Tháp" value="23">Đồng Tháp</option><option label="Gia Lai" value="24">Gia Lai</option><option label="Hà Giang" value="25">Hà Giang</option><option label="Hà Nam" value="26">Hà Nam</option><option label="Hà Tĩnh" value="27">Hà Tĩnh</option><option label="Hải Dương" value="28">Hải Dương</option><option label="Hậu Giang" value="29">Hậu Giang</option><option label="Hoà Bình" value="30">Hoà Bình</option><option label="Hưng Yên" value="31">Hưng Yên</option><option label="Khánh Hòa" value="32">Khánh Hòa</option><option label="Kiên Giang" value="33">Kiên Giang</option><option label="Kon Tum" value="34">Kon Tum</option><option label="Lai Châu" value="35">Lai Châu</option><option label="Lâm Đồng" value="36">Lâm Đồng</option><option label="Lạng Sơn" value="37">Lạng Sơn</option><option label="Lào Cai" value="38">Lào Cai</option><option label="Long An" value="39">Long An</option><option label="Nam Định" value="40">Nam Định</option><option label="Nghệ An" value="41">Nghệ An</option><option label="Ninh Bình" value="42">Ninh Bình</option><option label="Ninh Thuận" value="43">Ninh Thuận</option><option label="Phú Thọ" value="44">Phú Thọ</option><option label="Phú Yên" value="45">Phú Yên</option><option label="Quảng Bình" value="46">Quảng Bình</option><option label="Quảng Nam" value="47">Quảng Nam</option><option label="Quảng Ngãi" value="48">Quảng Ngãi</option><option label="Quảng Ninh" value="49">Quảng Ninh</option><option label="Quảng Trị" value="50">Quảng Trị</option><option label="Sóc Trăng" value="51">Sóc Trăng</option><option label="Sơn La" value="52">Sơn La</option><option label="Tây Ninh" value="53">Tây Ninh</option><option label="Thái Bình" value="54">Thái Bình</option><option label="Thái Nguyên" value="55">Thái Nguyên</option><option label="Thanh Hóa" value="56">Thanh Hóa</option><option label="Thừa Thiên Huế" value="57">Thừa Thiên Huế</option><option label="Tiền Giang" value="58">Tiền Giang</option><option label="Trà Vinh" value="59">Trà Vinh</option><option label="Tuyên Quang" value="60">Tuyên Quang</option><option label="Vĩnh Long" value="61">Vĩnh Long</option><option label="Vĩnh Phúc" value="62">Vĩnh Phúc</option><option label="Yên Bái" value="63">Yên Bái</option></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 645px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-sltProvince-container"><span class="select2-selection__rendered" id="select2-sltProvince-container" title="Đà Nẵng">Đà Nẵng</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Trình độ:</label>
                            <div class="col-sm-9">
                                <select ng-model="team.levelId" id="sltLevel" class="form-control select2-style-enabled ng-untouched ng-valid select2-hidden-accessible ng-dirty ng-not-empty ng-valid-parse" style="width: 100%;" tabindex="-1" aria-hidden="true">
                                    <!-- ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="1" class="ng-binding ng-scope" style="">Mới chơi</option><!-- end ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="2" class="ng-binding ng-scope">Trung bình</option><!-- end ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="3" class="ng-binding ng-scope">Trung bình khá</option><!-- end ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="4" class="ng-binding ng-scope">Phủi</option><!-- end ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="5" class="ng-binding ng-scope">Trung bình yếu</option><!-- end ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="6" class="ng-binding ng-scope">Mềm</option><!-- end ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="7" class="ng-binding ng-scope">Rất mềm</option><!-- end ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="8" class="ng-binding ng-scope">Khá</option><!-- end ngRepeat: x in listLevels --><option ng-repeat="x in listLevels" value="9" class="ng-binding ng-scope">Khá mạnh</option><!-- end ngRepeat: x in listLevels -->
                                </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-sltLevel-container"><span class="select2-selection__rendered" id="select2-sltLevel-container" title="Mới chơi">Mới chơi</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Logo:</label>
                            <div class="col-sm-9" style="padding-top:5px;">
                                <!-- ngIf: team.logoFilePath!=null && team.logoFilePath!='' --><img class="thumbnail-logo ng-scope" src="img/sis_1.jpg" style=""><!-- end ngIf: team.logoFilePath!=null && team.logoFilePath!='' -->
                                <input id="fileLogoFilePath" type="file" file-model="imageLogo">
                                <input ng-model="team.logoFilePath" value="https://res.givator.com/pictures/11017/600/2018_04/medium/sis_1.jpg" type="hidden" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" id="inpLogoFilePath" placeholder="" style="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Ảnh đội:</label>
                            <div class="col-sm-9" style="padding-top:5px;">
                                <!-- ngIf: team.bannerFilePath!=null && team.bannerFilePath!='' -->
                                <input id="fileBannerFilePath" type="file" file-model="imageBanner">
                                <input ng-model="team.bannerFilePath" value="" type="hidden" class="form-control ng-pristine ng-untouched ng-valid ng-empty" id="inpBannerFilePath" placeholder="">
                            </div>
                        </div>
                        <div class="form-group age-range">
                            <label class="control-label col-sm-3">Độ tuổi:</label>
                            <div class="col-md-9 row">
                                <div class="col-sm-4 inlineBlock">
                                    <input ng-model="team.youngestAge" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" id="inpYoungestAge" placeholder="Ít tuổi nhất">
                                </div>
                                <div class="col-sm-4 inlineBlock mobile-pull-right">
                                    <input ng-model="team.oldestAge" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" id="inpOldestAge" placeholder="Lớn tuổi nhất" style="">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">Giới thiệu:</label>
                            <div class="col-sm-9">
                                <textarea ng-model="team.about" cols="5" id="inpAbout" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="Giới thiệu"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="clear-bordered"></div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Sân nhà:</label>
                            <div class="col-sm-9">
                                <select-autocomplete-multi id="stadiumId" remote-url="/api/stadiums/autocomplete" multiple="false" filter-control-provinceid="#sltProvince" filter-control-countyid="#modalSltCounty" filter-control-teamid="#modalSltTeam" on-selected-change="TeamSettingsHelper.onSearchStadiumSelectedChange" item-id="sltStadium" item-placeholder="Nhập tên sân bóng......" class="ng-isolate-scope"><select style="width: 100%;" id="ee253280-fdfe-4b90-8686-264d5af4d838" idd2="sltStadium" idd="sltStadium" class="select-autocomplete-directive select-autocomplete-multi form-control input-sm select2-hidden-accessible" tabindex="-1" aria-hidden="true"></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-ee253280-fdfe-4b90-8686-264d5af4d838-container"><span class="select2-selection__rendered" id="select2-ee253280-fdfe-4b90-8686-264d5af4d838-container"><span class="select2-selection__placeholder">Nhập tên sân bóng......</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span></select-autocomplete-multi></div>
                            </div>
                            <div class="form-group" id="stadiumNumberContainer" style="display:none; margin-top:-15px">
                                <label class="control-label col-sm-3">Sân con:</label>
                                <div class="col-sm-4">
                                    <select id="sltStadiumNumber" class="form-control select2-style-enabled select2-hidden-accessible" style="width:100%" tabindex="-1" aria-hidden="true"></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-sltStadiumNumber-container"><span class="select2-selection__rendered" id="select2-sltStadiumNumber-container"></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3 mobile-hidden">Thời gian:</label>
                                <div class="col-sm-3 mobile-bottom-10">
                                    <label>Ngày trong tuần</label>
                                    <select class="form-control ng-untouched ng-valid ng-not-empty ng-dirty ng-valid-parse" ng-model="team.homeDayOfWeek" id="teamHomeDayOfWeek" style="">
                                        <option label="Chủ Nhật" value="0" selected="selected">Chủ Nhật</option>
                                        <option label="Thứ Hai" value="1">Thứ Hai</option>
                                        <option label="Thứ Ba" value="2">Thứ Ba</option>
                                        <option label="Thứ Tư" value="3">Thứ Tư</option>
                                        <option label="Thứ Năm" value="4">Thứ Năm</option>
                                        <option label="Thứ Sáu" value="5">Thứ Sáu</option>
                                        <option label="Thứ Bảy" value="6">Thứ Bảy</option>
                                    </select>
                                </div>
                                <div class="col-sm-3 inlineBlock">
                                    <label>Bắt đầu</label>
                                    <input type="text" class="form-control textbox-timepicker ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="team.homeStartHour" placeholder="Bắt đầu" style="">
                                </div>
                                <div class="col-sm-3 inlineBlock mobile-pull-right">
                                    <label>Kết thúc</label>
                                    <input type="text" class="form-control textbox-timepicker ng-pristine ng-untouched ng-valid ng-not-empty" ng-model="team.homeEndHour" placeholder="Kết thúc" style="">
                                </div>
                            </div>

                            <div class="form-group text-right">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-primary btn-primary-extra" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý..." ng-click="onSave($event);">
                                        <i class="fa fa-save"></i>
                                        Cập nhật
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <script type="text/javascript" class="ng-scope">
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
                    </script></div> <!-- /.tab-content -->
                </div> <!-- /.col -->
</div>
</div>
</div>
</div>
