<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>



<div>
<div class="breadcrum ng-scope">
    <div class="container">
        <div class="breadcrum-line">
            <a href="${contextPath}/">Trang chủ</a>
            <a href="${contextPath}/stadium/management">Danh sách sân</a>
            <a href="${contextPath}/stadium/management#/stadium-info/" class="ng-binding ng-hide"></a>
            <a class="">Thêm mới</a>
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
                                <a href="${contextPath}/stadium/management#/booking" data-toggle="tab" aria-expanded="true">
                                    <i class="fa fa-list" aria-hidden="true"></i>
                                    Yêu cầu đặt sân <b class="badge badge-primary ng-binding" style="background-color:red">2</b>
                                </a>
                            </li>
                            <li class="active">
                                <a href="${contextPath}/stadium/virtual.html#detail" data-toggle="tab" aria-expanded="true" class="ng-binding">
                                    <i class="glyphicon glyphicon-info-sign"></i>
                                    &nbsp;&nbsp;Thêm sân bóng mới
                                </a>
                            </li>

                            <!-- ngIf: hasStadiumNumber -->
                        </ul>
                        <div id="myTab1Content" class="tab-content">
                            <div class="tab-pane fade active in" id="detail">
                            
                            
<form action="${contextPath}/stadium/management/addNew" method="post" name="frmStadiumInfo" class="ng-invalid ng-invalid-required ng-dirty ng-valid-parse ng-valid-min" style="">
    <div class="col-md-12">
    
        <div class="form-group row">
            <label class="col-md-3 control-label"><strong>Thông tin cơ bản</strong></label>
        </div>
        <div class="form-group row">
            <label class="col-md-3 col-form-label">Tên sân</label>
            <div class="col-md-9">
                <input type="text" name="name" style="font-weight: bold;" placeholder="Nhập tên sân" required="" oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" data-msg-require="Bạn phải nhập tên sân" class="form-control ng-pristine ng-empty ng-invalid ng-invalid-required ng-touched">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 col-form-label">Giới thiệu ngắn</label>
            <div class="col-md-9">
                <textarea name="description" id="summernote" class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="form.Summary" rows="5"></textarea>
            </div>
        </div>
        
        <script>
	      $('#summernote').summernote({
	        placeholder: 'Giới thiệu về sân bóng ... ',
	        tabsize: 2,
	        height: 100
	      });
	    </script>
        
        
        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label"><strong>Địa chỉ</strong></label>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Quận / Huyện</label>
            <div class="col-md-5">
               	<select name="dzipcode" class="form-control input-sm select2-style-enabled ng-pristine ng-untouched ng-valid ng-not-empty" style="width: 100%;">
                       <c:forEach var="district" items="${allofdistrict}">
                        <option value="${district.zipcode}">${district.name}</option>
                       </c:forEach>
                   </select>
            </div>
        </div>
        

        <div class="form-group row">
            <label class="col-md-3 control-label">Số nhà / ngõ / tên đường</label>
            <div class="col-md-5">
                <input name="detail" required oninvalid="sport.account.validateControl(this);" placeholder="Địa chỉ sân" oninput="sport.account.validateControl(this);" data-msg-require="Ví dụ: Số 88 Lê Văn Lương" class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Bản đồ</label>
            <div class="col-md-5">
                <label class="control-label">Vị trí trên bản đồ <img class="google-map-icon" height="20" ng-click="initMap()"  src='<c:url value="/resources/common/img/map.jpg"/>'></label>
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
                <input name="phoneNumber" required oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" placeholder="Điện thoại liên hệ đặt sân" data-msg-require="Bạn phải nhập Điện thoại liên hệ đặt sân"  class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Địa chỉ email</label>
            <div class="col-md-5">
                <input name="pemail" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                       
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Facebook</label>
            <div class="col-md-5">
                <input name="facebook" placeholder="Địa chỉ facebook" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Website</label>
            <div class="col-md-5">
                <input name="website" placeholder="Địa chỉ website" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
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
                <input id="previewImagePath" type="file">
                <input name="coverAvatar" value="" type="hidden" class="form-control ng-pristine ng-untouched ng-valid ng-empty" id="inpLogoFilePath" placeholder="">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-3 col-form-label">Slideshow</label>
            <div class="col-md-5">
                <div id="fileuploader">
	                <div class="ajax-upload-dragdrop" style="vertical-align: top; width: 400px;">
		                <div class="ajax-file-upload" style="position: relative; overflow: hidden; cursor: default;">
			                Upload
			                <form method="POST" action="${contextPath}/ajax/stadium/uploadprofile" enctype="multipart/form-data" style="margin: 0px; padding: 0px;">
			                	<input type="file" id="ajax-upload-id-1525529284270" name="profileUpload[]" accept="*" multiple="" style="position: absolute; cursor: pointer; top: 0px; width: 100%; height: 100%; left: 0px; z-index: 100; opacity: 0;">
			                </form>
		                </div>
		                <span> <b>Drag &amp; Drop Files</b> </span>
	                </div>
                </div>
                <div class="ajax-file-upload-container"></div>
				
                <div class="highslide-gallery gallery">
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>

        <div class="form-group row">
            <div class="clear-bordered"></div>
        </div>


		<div class="form-group row">
		
		<div class="col-md-12" id="stadium-type-list">
			<h4>
			    Giá thuê sân / 1 trận
			</h4>
			
			<!-- Thêm >> -->
			
		</div>
		
		
		<!-- js add pitch type none begin-->
		<div class="col-md-12">
			<!-- Sân 5 -->
			<div class="snp-settings ng-scope" id="stadium-type-item-5" style="display:none">
			    <div class="sn-settings-top row">
			        <div class="col-md-12 ng-scope" >
			            <div class="sn-settings-bar">
			                <div class="pull-left sn-settings-name">
			                    <span style="float: left;margin-top: 3px" class="ng-binding ng-scope">
			                        <i class="fa fa-check-square" aria-hidden="true"></i>
			                        Loại sân: 5 người (<span id="soLuongSan-5" class="color-red"></span> sân)
			                        
			                        <input type="hidden" value="5" name="statidum_type_5" />
			                        <input type="hidden" name="statidum_type_5_quanties" id="stadium-type-5-quantities" />
			                        
			                    </span>
			                    <div class="btn-group pull-right mobile-float-none" style="margin-left: 10px">
			                        <button type="button" class="btn btn-default btn-sm dropdown-toggle text-center" data-toggle="dropdown" aria-expanded="false">
			                            <i class="fa fa-cog mr-0" aria-hidden="true"></i>
			                        </button>
			                        <ul class="dropdown-menu" role="menu">
			                            <li>
			                                <a onclick="addStadiumNumberPrice(5)" class="pointer">
				                                <i class="fa fa-database" aria-hidden="true"></i> 
				                                &nbsp;Thêm giá	
			                                </a>
			                            </li>
			                            <li>
			                                <a ng-click="changeStadiumNumberQuantity(stadiumNumberRow)" class="pointer">
				                                <i class="fa fa-pencil" aria-hidden="true"></i> 
				                                &nbsp;Thay đổi số lượng
			                                </a>
			                            </li>
			                            <li>
			                                <a onclick="removeStadiumNumberRow(5,this)" class="pointer">
				                                <i class="fa fa-remove" aria-hidden="true"></i> 
				                                &nbsp;Xóa
			                                </a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			            </div>
			        </div>
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
			                        Giá <span class="color-red"> [ Đơn vị: 000 ] </span>
			                    </th>
			                    <th>Xóa</th>
			                </tr>
			            </thead>
			            
			            <tbody id="san-5-them-gia-san-items">
			               
			               
			               
			            </tbody>
			        </table>
			        
			        
			        <table style="display:none">
			            <tbody style="display:none" id="san-5-them-gia-san-item">
			               <tr class="ng-scope">
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start_5" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end_5" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select name="fromDaytoDay_5" title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option value="2-6">T2-T6</option>
										      <option value="7-8">T7-CN</option>
										      <option value="7">T7</option>
										      <option value="8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <input name="price_5" type="text" class="form-control">
			                    </td>
			                    <td class="sn-price-delete-td">
			                        <a class="btn btn-default btn-sm" title="Xóa giá" onclick="removeStadiumNumberPrice(this)">
			                            <i class="fa fa-remove" aria-hidden="true"></i>
			                        </a>
			                    </td>
			                </tr>
			            </tbody>
			            </table>
			    </div>
			</div>
			<!-- Sân 5 -->
			
			
			<!-- Sân 7 -->
			
			<div class="snp-settings ng-scope" id="stadium-type-item-7" style="display:none">
			    <div class="sn-settings-top row">
			        <div class="col-md-12 ng-scope" >
			            <div class="sn-settings-bar">
			                <div class="pull-left sn-settings-name">
			                    <span style="float: left;margin-top: 3px" class="ng-binding ng-scope">
			                        <i class="fa fa-check-square" aria-hidden="true"></i>
			                        Loại sân: 7 người (<span id="soLuongSan-7" class='color-red'></span> sân) 
			                        
			                        <input type="hidden" value="7" name="statidum_type_7" />
			                        <input type="hidden" name="statidum_type_7_quanties" id="stadium-type-7-quantities" />
			                        
			                    </span><!-- end ngIf: selectedType.id==1 -->
			                    <div class="btn-group pull-right mobile-float-none" style="margin-left: 10px">
			                        <button type="button" class="btn btn-default btn-sm dropdown-toggle text-center" data-toggle="dropdown" aria-expanded="false">
			                            <i class="fa fa-cog mr-0" aria-hidden="true"></i>
			                        </button>
			                        <ul class="dropdown-menu" role="menu">
			                            <li>
			                                <a onclick="addStadiumNumberPrice(7)" class="pointer">
				                                <i class="fa fa-database" aria-hidden="true"></i> 
				                                &nbsp;Thêm giá	
			                                </a>
			                            </li>
			                            <li>
			                                <a ng-click="changeStadiumNumberQuantity(stadiumNumberRow)" class="pointer">
				                                <i class="fa fa-pencil" aria-hidden="true"></i> 
				                                &nbsp;Thay đổi số lượng
			                                </a>
			                            </li>
			                            <li>
			                                <a onclick="removeStadiumNumberRow(7, this)" class="pointer">
				                                <i class="fa fa-remove" aria-hidden="true"></i> 
				                                &nbsp;Xóa
			                                </a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			            </div>
			        </div>
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
			                        Giá <span class="color-red"> [ Đơn vị: 000 ] </span>
			                    </th>
			                    <th>Xóa</th>
			                </tr>
			            </thead>
			            
			            <tbody id="san-7-them-gia-san-items">
			               <tr class="ng-scope">
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option value="2-6">T2-T6</option>
										      <option value="7-8">T7-CN</option>
										      <option value="7">T7</option>
										      <option value="8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <input onkeydown="return isNumberKey(event)" type="text" ng-if="stadiumNumberPrice.isEditMode || true" ng-model="stadiumNumberPrice.price" min="0" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-scope ng-not-empty ng-valid-min" ui-number-mask="0"><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
			                    </td>
			                    <td class="sn-price-delete-td">
			                        <a class="btn btn-default btn-sm" title="Xóa giá" onclick="removeStadiumNumberPrice(this)">
			                            <i class="fa fa-remove" aria-hidden="true"></i>
			                        </a>
			                    </td>
			                </tr>
			            </tbody>
			            
			        </table>
			        
			        <table style="display:none">
			        	<tbody style="display:none" id="san-7-them-gia-san-item">
			               <tr class="ng-scope" >
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option value="2-6">T2-T6</option>
										      <option value="7-8">T7-CN</option>
										      <option value="7">T7</option>
										      <option value="8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><input onkeydown="return isNumberKey(event)" type="text" ng-if="stadiumNumberPrice.isEditMode || true" ng-model="stadiumNumberPrice.price" min="0" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-scope ng-not-empty ng-valid-min" ui-number-mask="0"><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
			                    </td>
			                    <td class="sn-price-delete-td">
			                        <a class="btn btn-default btn-sm" title="Xóa giá" onclick="removeStadiumNumberPrice(this)">
			                            <i class="fa fa-remove" aria-hidden="true"></i>
			                        </a>
			                    </td>
			                </tr>
			                
			            </tbody>
			        </table>
			    </div>
			</div>
			
			<!-- Sân 7 -->
			
			<!-- Sân 11 -->
			
			<div class="snp-settings ng-scope" id="stadium-type-item-11" style="display:none">
			    <div class="sn-settings-top row">
			        <div class="col-md-12 ng-scope" >
			            <div class="sn-settings-bar">
			                <div class="pull-left sn-settings-name">
			                    <span style="float: left;margin-top: 3px" class="ng-binding ng-scope">
			                        <i class="fa fa-check-square" aria-hidden="true"></i>
			                        Loại sân: 11 người (<span id="soLuongSan-11" class='color-red'></span> sân) 
			                        
			                        <input type="hidden" value="11" name="statidum_type_11" />
			                        <input type="hidden" name="statidum_type_11_quanties" id="stadium-type-11-quantities" />
			                        
			                    </span>
			                    
			                    <div class="btn-group pull-right mobile-float-none" style="margin-left: 10px">
			                        <button type="button" class="btn btn-default btn-sm dropdown-toggle text-center" data-toggle="dropdown" aria-expanded="false">
			                            <i class="fa fa-cog mr-0" aria-hidden="true"></i>
			                        </button>
			                        <ul class="dropdown-menu" role="menu">
			                            <li>
			                                <a onclick="addStadiumNumberPrice(11)" class="pointer">
				                                <i class="fa fa-database" aria-hidden="true"></i> 
				                                &nbsp;Thêm giá	
			                                </a>
			                            </li>
			                            <li>
			                                <a onclick="changeStadiumNumberQuantity(stadiumNumberRow)" class="pointer">
				                                <i class="fa fa-pencil" aria-hidden="true"></i> 
				                                &nbsp;Thay đổi số lượng
			                                </a>
			                            </li>
			                            <li>
			                                <a onclick="removeStadiumNumberRow(11, this)" class="pointer">
				                                <i class="fa fa-remove" aria-hidden="true"></i> 
				                                &nbsp;Xóa
			                                </a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			            </div>
			        </div>
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
			                        Giá <span class="color-red"> [ Đơn vị: 000 ] </span>
			                    </th>
			                    <th>Xóa</th>
			                </tr>
			            </thead>
			            
			            <tbody id="san-11-them-gia-san-items">
			               <tr class="ng-scope">
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option value="2-6">T2-T6</option>
										      <option value="7-8">T7-CN</option>
										      <option value="7">T7</option>
										      <option value="8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><input onkeydown="return isNumberKey(event)" type="text" ng-if="stadiumNumberPrice.isEditMode || true" ng-model="stadiumNumberPrice.price" min="0" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-scope ng-not-empty ng-valid-min" ui-number-mask="0"><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
			                    </td>
			                    <td class="sn-price-delete-td">
			                        <a class="btn btn-default btn-sm" title="Xóa giá" onclick="removeStadiumNumberPrice(this)">
			                            <i class="fa fa-remove" aria-hidden="true"></i>
			                        </a>
			                    </td>
			                </tr>
			            </tbody>
			            
			        </table>
			        
			        <table  style="display:none">
			        	<tbody style="display:none" id="san-11-them-gia-san-item">
			               <tr class="ng-scope" >
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option value="2-6">T2-T6</option>
										      <option value="7-8">T7-CN</option>
										      <option value="7">T7</option>
										      <option value="8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <!-- ngIf: stadiumNumberPrice.isEditMode || true --><input onkeydown="return isNumberKey(event)" type="text" ng-if="stadiumNumberPrice.isEditMode || true" ng-model="stadiumNumberPrice.price" min="0" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-scope ng-not-empty ng-valid-min" ui-number-mask="0"><!-- end ngIf: stadiumNumberPrice.isEditMode || true -->
			                    </td>
			                    <td class="sn-price-delete-td">
			                        <a class="btn btn-default btn-sm" title="Xóa giá" onclick="removeStadiumNumberPrice(this)">
			                            <i class="fa fa-remove" aria-hidden="true"></i>
			                        </a>
			                    </td>
			                </tr>
			                
			            </tbody>
			        
			        </table>
			        
			    </div>
			</div>
			<!-- Sân 11 -->
			
			
			<div class="form-inline" >
			    <div class="form-group pull-right sn-addition-row"  style="margin-top:15px;">
			        <select class="form-control input-sm ng-pristine ng-valid ng-not-empty ng-touched" id="pitchType">
			            <option>Loại sân</option>
			            <option value="5">5 người</option>
			            <option value="7">7 người</option>
			            <option value="11">11 người</option>
			        </select>
			
			        <input onkeydown="return isNumberKey(event)" type="text"  min="0" max="100" class="form-control input-sm quantity" placeholder="Số lượng" style="width:100px" />
			
					<!-- Thêm loại sân -->
			        <button type="button" id="btn-addStadiumNumberRow" style="width:90px"
			                class="btn btn-tertiary btn-sm " title="Thêm">
			            Thêm >>
			        </button>
			    </div>
			</div>
		</div>
		<!-- js add pitch type none end -->
		
		
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

                <a class="btn btn-default"  href="${contextPath}/stadium/management">Quay lại</a>
                &nbsp;
              <button type="submit" id="btnCreateStadium" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý..." class="btn btn-primary btn-primary-extra ng-scope" >
                    <i class="fa fa-save"></i>
                    Tạo mới
                </button>
            </div> 
        </div> 
    </div>

</form>

</div>                         
<div class="tab-pane fade" id="stadiumCalendar">                             
</div> 
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<script type="text/javascript">
	
	function removeStadiumNumberPrice(current) {
		current.parentElement.parentElement.remove();
	}
	
	
	function removeStadiumNumberRow(loaiSan, current) {
		switch(loaiSan) {
			case 5:
				// current.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
				break;
			case 7:
				// current.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
				break;
			case 11:
				// current.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
				break;
		}	
	}
	
	// Them gia cho moi loai san
	function addStadiumNumberPrice(loaiSan) {
		switch(loaiSan) {
			case 5:
				var giaSan5 = $("#san-5-them-gia-san-item").html();
				$('#san-5-them-gia-san-items').append(giaSan5);
				break;
			case 7:
				var giaSan7 = $("#san-7-them-gia-san-item").html();
				$('#san-7-them-gia-san-items').append(giaSan7);
				break;
			case 11:
				var giaSan11 = $("#san-11-them-gia-san-item").html();
				$('#san-11-them-gia-san-items').append(giaSan11);
				break;
		}
		
	}

	// Them loai san
	$(document).ready(function(){
		$('#btn-addStadiumNumberRow').click(function(){
			var loaiSan = $("#pitchType").val();
			var soLuongSan = $(".quantity").val();
			
			switch(loaiSan) {
				case '5':
					$("#soLuongSan-5").text(soLuongSan);
					$("#stadium-type-5-quantities").attr('value', soLuongSan);
					
					var soLuongSan5 = $('#stadium-type-item-5').html();
					$('#stadium-type-list').append(soLuongSan5);
					break;
				case '7':
					$("#soLuongSan-7").text(soLuongSan);
					$("#stadium-type-7-quantities").attr('value', soLuongSan);
					
					var soLuongSan7 = $('#stadium-type-item-7').html();
					$('#stadium-type-list').append(soLuongSan7);
					break;
				case '11':
					$("#soLuongSan-11").text(soLuongSan);
					$("#stadium-type-11-quantities").attr('value', soLuongSan);
					
					var soLuongSan11 = $('#stadium-type-item-11').html();
					$('#stadium-type-list').append(soLuongSan11);
					break;	
			}
		});
		
	});
	
	
</script>
