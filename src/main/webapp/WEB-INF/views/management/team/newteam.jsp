<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="top-banner-box top-banner-box-doi">
   <div class="container">
      <p class="page-title">Thêm mới Team</p>
   </div>
</div>
<div class="content-wrap is-admin-page">
   <div class="container">
      <div class="row">
         <div class="col-md-3">
            <div class="sidebar sidebar-tien-ich">
               <ul class="list-left-links">
                  <li>
                     <a href="/match/inviting" class="red">Trận đấu của tôi</a>
                  </li>
                  <li>
                     <a href="/stadium/bookinghistory">Đặt sân</a>
                  </li>
                  <li>
                     <a href="">Quản lý đội bóng</a>
                     <ul class="sub-links">
                        <li>
                           <a href="">
                              Ten team
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <a href="/stadium/management">Quản lý sân</a>
                  </li>
                  <li>
                     <a href="/user/profile">Tài khoản</a>
                  </li>
               </ul>
            </div>
         </div>
         <div class="col-md-9 sidebar team-management-page">
            <div class="layout-main">
               <div id="settings-content" class="tab-content stacked-content"></div>
               <!-- /.tab-content -->
            </div>
            <!-- /.col -->
            <div class="row">
               <div class="tab-pane fade in active col-md-12 layout-main-content">
                  <div class="portlet-header custom-tab-header" style="padding-bottom:12px;">
                     <div class="content-left">
                        <p class="title-box">
                           <i class="fa fa-soccer-ball-o" aria-hidden="true"></i> 6 thành viên
                           <a href="javascript:;" style="margin-left:2px;float:right;">
                              <i class="fa fa-long-arrow-right" aria-hidden="true"></i> Thêm thành viên
                           </a>
                        </p>
                     </div>
                  </div>
                  <div class="portlet-body">
                     <ul class="list-item-san" id="team-user-list">
                        <li class="item-card item-team-user">
                           <div class="row">
                              <div class="col-md-4 mobile-bottom-10">
                                 <a href="/user/profile/" target="_blank">
                                    <img class="img-responsive" align="thumbnail">
                                 </a>
                              </div>
                              <div class="col-md-8 right-item-san">
                                 <h2>
                                    <a href="/user/profile/" target="_blank">PHan Ngoc Quyen</a>
                                 </h2>
                                 <p>
                                    <i class="fa fa-map-o" aria-hidden="true"></i> roleName
                                 </p>
                                 <p class="phone-numb-ext" >
                                    <i class="fa fa-phone-square" aria-hidden="true"></i> 01234567895
                                 </p>
                                 <p class="user-email" >
                                    <i class="glyphicon glyphicon-envelope" aria-hidden="true"></i> quyenchode@gmail.com
                                 </p>
                                 <a href="javascript:;" class="btn-chi-tiet" style="margin-left:2px;">
                                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i> Xóa khỏi đội
                                 </a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
               </div>
               <!-- /.tab-pane -->
            </div>
            <div id="modalTeamAddUser" class="modal modal-styled fade" style="">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 class="modal-title">Thêm thành viên</h3>
                     </div>
                     <!-- /.modal-header -->
                     <div class="modal-body">
                        <form class="form-horizontal">
                           <div class="form-group">
                              <div class="col-md-12">
                                 <select id="sltUserNamePhoneMail" />
                              </div>
                           </div>
                           <div class="form-group" id="invite-username-extra-group" style="">
                              <div class="col-md-12">
                                 <label>Tên thành viên
                                    <span class="required">(*)</span>
                                 </label>
                                 <input type="text" class="form-control" id="invite-username-extra" placeholder="Nhập tên thành viên..." />
                                 <span class="field-validation-error" style="">Tên thành viên bắt buộc</span>
                              </div>
                           </div>
                        </form>
                     </div>
                     <!-- /.modal-body -->
                     <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                        <button id="btnAddUsers" class="btn btn-danger" type="button">Thêm</button>
                     </div>
                     <!-- /.modal-footer -->
                  </div>
                  <!-- /.modal-content -->
               </div>
               <!-- /.modal-dialog -->
            </div>
            <div id="modalTeamRemoveUser" class="modal modal-styled fade" style="display: none;">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 class="modal-title">Xóa thành viên</h3>
                     </div>
                     <!-- /.modal-header -->
                     <div class="modal-body">
                        <form class="form-horizontal">
                           <div class="form-group">
                              <div class="col-md-12">
                                 <p>Bạn chắc chắn muốn xóa thành viên.?</p>
                              </div>
                           </div>
                        </form>
                     </div>
                     <!-- /.modal-body -->
                     <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                        <button id="btnAddUsers" class="btn btn-danger" data-dismiss="modal" type="button">Xóa</button>
                     </div>
                     <!-- /.modal-footer -->
                  </div>
                  <!-- /.modal-content -->
               </div>
               <!-- /.modal-dialog -->
            </div>
            <div class="tab-pane fade in active col-md-12 layout-main-content" >
               <div class="heading-block">
                  <p class="title-box">
                     <i class="fa fa-soccer-ball-o" aria-hidden="true"></i> Sự kiện
                  </p>
               </div>
               <!-- /.heading-block -->
               <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
               <br>
               <br>
               <form action="https://jumpstartthemes.com/demo/v/3.0.0/templates/admin-1/page-settings.html" class="form form-horizontal">
                  <div class="form-group">
                     <label class="col-md-3 control-label">Toggle Notifications</label>
                     <div class="col-md-7">
                        <div class="checkbox">
                           <label>
                              <input value="" type="checkbox" checked>
                              Send me security emails
                           </label>
                        </div>
                        <!-- /.checkbox -->
                        <div class="checkbox">
                           <label>
                              <input value="" type="checkbox" checked>
                              Send system emails
                           </label>
                        </div>
                        <!-- /.checkbox -->
                        <div class="checkbox">
                           <label>
                              <input value="" type="checkbox">
                              Lorem ipsum dolor sit amet
                           </label>
                        </div>
                        <!-- /.checkbox -->
                        <div class="checkbox">
                           <label>
                              <input value="" type="checkbox">
                              Laborum, quam iure quibusdam
                           </label>
                        </div>
                        <!-- /.checkbox -->
                     </div>
                     <!-- /.col -->
                  </div>
                  <!-- /.form-group -->
                  <div class="form-group">
                     <label class="col-md-3 control-label">Email for Notifications</label>
                     <div class="col-md-7">
                        <select name="email_notifications" class="form-control">
                           <option value="1">john@mvpready.com</option>
                           <option value="2">mary@mvpready.com</option>
                           <option value="3">chris@mvpready.com</option>
                        </select>
                     </div>
                     <!-- /.col -->
                  </div>
                  <!-- /.form-group -->
                  <div class="form-group">
                     <div class="col-md-7 col-md-push-3">
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        &nbsp;
                        <button type="reset" class="btn btn-default">Cancel</button>
                     </div>
                     <!-- /.col -->
                  </div>
                  <!-- /.form-group -->
               </form>
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane fade in active col-md-12 layout-main-content">
               <div class="heading-block">
                  <p class="title-box">
                     <i class="fa fa-soccer-ball-o" aria-hidden="true"></i> Thư viện ảnh
                  </p>
               </div>
               <!-- /.heading-block -->
               <div class="row">
                  <div class="col-md-3 col-sm-6">
                     <div class="thumbnail">
                        <div class="thumbnail-view">
                           <img src="<c:url value="/resources/assets/img/imgs.jpg"/>" style="width: 100%" alt="Gallery Image">
                        </div>
                     </div>
                     <!-- /.thumbnail -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-3 col-sm-6">
                     <div class="thumbnail">
                        <div class="thumbnail-view">
                           <img src='<c:url value="/resources/assets/img/imgs.jpg"/>' style="width: 100%" alt="Gallery Image">
                        </div>
                     </div>
                     <!-- /.thumbnail -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-3 col-sm-6">
                     <div class="thumbnail">
                        <div class="thumbnail-view">
                           <img src="<c:url value="/resources/assets/img/imgs.jpg"/>" style="width: 100%" alt="Gallery Image">
                        </div>
                     </div>
                     <!-- /.thumbnail -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-3 col-sm-6">
                     <div class="thumbnail">
                        <div class="thumbnail-view">
                           <img src="<c:url value="/resources/assets/img/imgs.jpg"/>" style="width: 100%" alt="Gallery Image">
                        </div>
                     </div>
                     <!-- /.thumbnail -->
                  </div>
                  <!-- /.col -->
               </div>
            </div>
            <div class="alert alert-warning">
               <strong>Chú ý!</strong>
               <br />
               Bạn nên cập nhật số điện thoại vào tài khoản để đối tác có thể liên hệ trực tiếp.
               <br />
               Cập nhật số điện thoại 
               <a href="/user/profile" target="_blank">tại đây</a>
            </div>
            <div class="page-team-setting layout-main-content">
               <div class="heading-block">
                  <p class="title-box">
                     <i class="fa fa-map-marker" aria-hidden="true"></i> Thêm đội bóng mới
                  </p>
                  <p class="title-box">
                     <i class="fa fa-map-marker" aria-hidden="true"></i> Cập nhật thông tin đội bóng
                  </p>
               </div>
               <!-- /.heading-block -->
               <form class="form-horizontal" role="form">
                  <div class="form-group alert alert-warning">
                     <label class="control-label col-sm-3">
                        <strong>Địa chỉ truy cập:</strong>
                     </label>
                     <div class="col-sm-9">
                        <a target="_blank" href="https://www.timdoinhanh.com/linkDoiBong">https://www.timdoinhanh.com/</a>
                        <input type="text" class="input-transparent" />
                        <button type="button" data-loading-text="
                        <i class='fa fa-spinner fa-spin '></i> Đang xử lý..." class="btn btn-primary inlineBlock btn-sm">Kiểm tra
                     </button>
                     <p style="font-style:italic; color:blue">
                        <i class="fa fa-check"></i> Địa chỉ khả dụng
                     </p>
                     <p style="font-style:italic; color:red">
                        <i class="fa fa-ban"></i> Địa chỉ KHÔNG khả dụng
                     </p>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">Tên đội:</label>
                  <div class="col-sm-9">
                     <input type="text" class="form-control" id="inpName" placeholder="Nhập tên đội bóng của bạn">
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">Tỉnh/Thành phố:</label>
                  <div class="col-sm-9">
                     <select  id="sltProvince" class="form-control select2-enabled"></select>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">Trình độ:</label>
                  <div class="col-sm-9">
                     <select id="sltLevel" class="form-control select2-style-enabled" style="width:100%;">
                        <option value="22">ddd</option>
                     </select>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">Logo:</label>
                  <div class="col-sm-9" style="padding-top:5px;">
                     <img class="thumbnail-logo"  />
                     <input id="fileLogoFilePath" type="file" file-model="imageLogo" />
                     <input value="" type="hidden" class="form-control" id="inpLogoFilePath" placeholder="">
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">Ảnh đội:</label>
                  <div class="col-sm-9" style="padding-top:5px;">
                     <img class="thumbnail-banner" />
                     <input id="fileBannerFilePath" type="file" file-model="imageBanner" />
                     <input value="" type="hidden" class="form-control" id="inpBannerFilePath" placeholder="">
                  </div>
               </div>
               <div class="form-group age-range">
                  <label class="control-label col-sm-3">Độ tuổi:</label>
                  <div class="col-md-9 row">
                     <div class="col-sm-4 inlineBlock">
                        <input type="text" class="form-control" id="inpYoungestAge" placeholder="Ít tuổi nhất">
                     </div>
                     <div class="col-sm-4 inlineBlock mobile-pull-right">
                        <input type="text" class="form-control" id="inpOldestAge" placeholder="Lớn tuổi nhất">
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">Giới thiệu:</label>
                  <div class="col-sm-9">
                     <textarea cols="5" id="inpAbout" class="form-control" placeholder="Giới thiệu"></textarea>
                  </div>
               </div>
               <div class="form-group row">
                  <div class="clear-bordered"></div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">Sân nhà:</label>
                  <div class="col-sm-9">
                     <select-Autocomplete-Multi id="stadiumId" remote-url='/api/stadiums/autocomplete' multiple="false"/>
                  </div>
               </div>
               <div class="form-group" id="stadiumNumberContainer" style="; margin-top:-15px">
                  <label class="control-label col-sm-3">Sân con:</label>
                  <div class="col-sm-4">
                     <select id="sltStadiumNumber" class="form-control select2-style-enabled" style="width:100%"></select>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3 mobile-hidden">Thời gian:</label>
                  <div class="col-sm-3 mobile-bottom-10">
                     <label>Ngày trong tuần</label>
                     <select class="form-control" id="teamHomeDayOfWeek">
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
                     <input type="text" class="form-control textbox-timepicker"  placeholder="Bắt đầu"/>
                  </div>
                  <div class="col-sm-3 inlineBlock mobile-pull-right">
                     <label>Kết thúc</label>
                     <input type="text" class="form-control textbox-timepicker"  placeholder="Kết thúc" />
                  </div>
               </div>
               <div class="form-group text-right">
                  <div class="col-sm-offset-2 col-sm-10">
                     <button type="button" class="btn btn-primary btn-primary-extra">
                        <i class="fa fa-save"></i>Cập nhật
                     </button>
                  </div>
               </div>
            </form>
         </div>
         <div class="row">
            <div class="col-md-12" style=";">
               <div class="row">
                  <div class="col-md-8">
                     <h3>Headline</h3>
                     <div class="tfm-dt-filter">
                        <div class="form-inline">
                           <select  class="form-control"></select>
                           <select class="form-control"></select>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-4 tfm-amount-summary">
                     <div class="form-group tfm-amount-deposit">
                        <label>Tổng thu: </label>
                        <label class="tfm-amount">1</label>
                     </div>
                     <div class="form-group tfm-amount-expense">
                        <label>Tổng chi: </label>
                        <label class="tfm-amount">2</label>
                     </div>
                     <div class="form-group tfm-amount-remain-prev">
                        <label>Số dư tháng trước: </label>
                        <label class="tfm-amount">1</label>
                     </div>
                     <div class="form-group tfm-amount-remain-final">
                        <label>Số dư hiện tại: </label>
                        <label class="tfm-amount">2</label>
                     </div>
                  </div>
               </div>
               <div class="right-item-san right-item-doi right-item-doi-ct">
                  <div class="bs-example bs-example-tabs" data-example-id=togglable-tabs>
                     <ul class="nav nav-tabs" id="tfm-tabs" role=tablist>
                        <li role="presentation" class="active">
                           <a id="fm-dongquy-tab" role="tab" data-toggle="tab" aria-controls="tfm-dongquy" aria-expanded="true">Cập nhật quỹ</a>
                        </li>
                        <li role="presentation">
                           <a id="fm-chiquy-tab" role="tab" data-toggle="tab" aria-controls="tfm-dongquy" aria-expanded="true">Quản lý chi</a>
                        </li>
                     </ul>
                     <div class="tab-content" id="teamfund-management">
                        <div class="tab-pane" role="tabpanel" id="fm-dongquy" aria-labelledby="fm-dongquy-tab" >
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
                                 <tr>
                                    <td>1</td>
                                    <td>fullname</td>
                                    <td>
                                       <input type="text" class="form-control" />
                                    </td>
                                    <td>
                                       <span>time</span>
                                       <i>Chưa đóng</i>
                                    </td>
                                    <td class="text-right team-fund-edit-col">
                                       <button class="btn btn-primary btn-primary-extra btn-sm btn-remove-deposit">
                                          <i class="fa fa-check"></i>Đã đóng
                                       </button>
                                       <button class="btn btn-primary btn-primary-extra btn-sm btn-add-deposit">
                                          <i class="fa fa fa-gavel"></i>Đóng              
                                       </button>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="fm-chiquy" aria-labelledby="fm-chiquy-tab" >
                           <div class="container tfm-expense-form">
                              <form id="tfm-expense-form" class="form-horizontal">
                                 <div class="form-group form-inline">
                                    <label class="col-md-2">Ngày:</label>
                                    <div class="col-md-3 pad-left-0 form-group-responsive">
                                       <div class="input-group date frm-date-time" id="modalPickerDropStartTime">
                                          <input id="newFundExpenseDateTime" type="text" class="form-control">
                                          <label class="input-group-addon btn" for="newFundExpenseDateTime">
                                             <span class="glyphicon glyphicon-calendar"></span>
                                          </label>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-md-2">Số tiền:</label>
                                    <div class="col-md-3 pad-left-0 form-group-responsive">
                                       <input type="text" class="form-control amount" ui-number-mask="0" />
                                    </div>
                                 </div>
                                 <div class="form-group form-inline form-group-responsive">
                                    <label class="col-md-2">Lý do:</label>
                                    <input type="text" class="form-control notes" />
                                 </div>
                                 <div class="form-group form-group-responsive form-buttons">
                                    <label class="col-md-2">&nbsp;</label>
                                    <button class="btn btn-primary btn-primary-extra btn-sm btn-add-expense">Thêm >></button>
                                 </div>
                              </form>
                           </div>
                           <table class="table table-striped table-expenses table-responsive">
                              <thead>
                                 <tr>
                                    <th>#</th>
                                    <th>Ngày</th>
                                    <th>Tổng tiền</th>
                                    <th>Nội dung</th>
                                    <th class="text-right">Tác vụ</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr >
                                    <td>1</td>
                                    <td>
                                       <input type="text" class="form-control" />
                                    </td>
                                    <td>
                                       <input type="text" class="form-control" />
                                    </td>
                                    <td>
                                       <input type="text" class="form-control" />
                                    </td>
                                    <td class="text-right team-fund-edit-col">
                                       <button class="btn btn-primary btn-sm">
                                          <i class="fa fa-edit"></i>
                                       </button>
                                       <button class="btn btn-danger btn-sm">
                                          <i class="fa fa-trash-o" aria-hidden="true"></i>
                                       </button>
                                       <button class="btn btn-primary btn-primary-extra btn-sm">Lưu</button>
                                       <button class="btn btn-danger btn-primary-extra btn-sm">Hủy</button>
                                    </td>
                                 </tr>
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
<?php include ('inc/footer.php'); ?>