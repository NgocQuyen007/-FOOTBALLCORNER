<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>

<div ng-view="" class="ng-scope" style="">
<div class="breadcrum ng-scope">
    <div class="container">
        <div class="breadcrum-line">
            <a href="${contextPath}/">Trang chủ</a>
            <a href="${contextPath}/stadium/management">Danh sách sân</a>
            <a ng-show="!isCreate" href="${contextPath}/stadium/management#/stadium-info/127" class="ng-binding">Nam Hoa Vang</a>
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
                            <li>
                                <a href="${contextPath}/stadium/management#/booking" aria-expanded="true">
                                    <i class="fa fa-list" aria-hidden="true"></i>
                                    Yêu cầu đặt sân <b class="badge badge-primary ng-binding" style="background-color:red">2</b>
                                </a>
                            </li>
                            <li class="active">
                                <a href="${contextPath}/stadium/management/stadium-info/${stadium.getId()}"  aria-expanded="true">
                                    <i class="glyphicon glyphicon-info-sign"></i>
                                    &nbsp;&nbsp;Thông tin cơ bản
                                </a>
                            </li>

                            <li>
                                <a href="${contextPath}/stadium/management/bookingManager/${stadium.getId()}" aria-expanded="true">
                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                    &nbsp;&nbsp;Đặt sân
                                </a>
                            </li>
                        </ul>
                        <div id="myTab1Content" class="tab-content">
                            <div class="tab-pane fade active in" id="detail">
<form action="${contextPath}/stadium/management/update-info" method="post" name="frmStadiumInfo" enctype="multipart/form-data">
    
    <input type = "hidden" value="${stadium.getId()}" name="id" >
    
    <div class="col-md-12">
    
        <div class="form-group row">
            <label class="col-md-3 control-label"><strong>Thông tin cơ bản</strong></label>
        </div>
        <div class="form-group row">
            <label class="col-md-3 col-form-label">Tên sân</label>
            <div class="col-md-9">
                <input type="text" name="name" value="${stadium.getName()}"  
                oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" placeholder="Nhập tên sân" required data-msg-require="Bạn phải nhập tên sân" 
                class="form-control" style="font-weight: bold;">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 col-form-label">Giới thiệu ngắn</label>
            <div class="col-md-9">
                <textarea name="description" id="summernote" class="form-control ng-pristine ng-untouched ng-valid ng-empty" rows="5">
                	${stadium.getDescription()} 
                </textarea>
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
                        	<c:choose>
                        		<c:when test="${district.getZipcode() == stadium.getZipCode()}">
                        			<option selected="selected" value="${district.zipcode}">${district.name}</option>
                        		</c:when>
                        		<c:otherwise>
                        			<option value="${district.zipcode}">${district.name}</option>
                        		</c:otherwise>
                        	</c:choose>
                        	
                        </c:forEach>
                   </select>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Số nhà / ngõ / tên đường</label>
            <div class="col-md-5">
                <input name="detail" required class="form-control" value="${stadium.getDetail()}"
                	oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" 
                	placeholder="Địa chỉ sân" data-msg-require="Bạn phải nhập địa chỉ sân. Ví dụ: Số 88 Nguyễn Lương Bằng" >
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Bản đồ</label>
            <div class="col-md-5">
                <label class="control-label">
                	Vị trí trên bản đồ 
                	<img class="google-map-icon" height="20" onclick="initMap()"  src='<c:url value="/resources/common/img/map.jpg"/>'>
                </label>
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
                <input name="phoneNumber" class="form-control"  required placeholder="Điện thoại liên hệ đặt sân" 
                data-msg-require="Bạn phải nhập số điện thoại" value="${stadium.getPhoneNumber()}"
                oninvalid="sport.account.validateControl(this);" oninput="sport.account.validateControl(this);" >
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Địa chỉ email</label>
            <div class="col-md-5">
                <input name="pemail" class="form-control"  placeholder="Địa chỉ Email" value="${stadium.getEmail()}">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Facebook</label>
            <div class="col-md-5">
                <input name="facebook" class="form-control" placeholder="Địa chỉ Facebook" value="${stadium.getFacebook()}">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-md-3 control-label">Website</label>
            <div class="col-md-5">
                <input name="website" placeholder="Địa chỉ website" class="form-control" value="${stadium.getWebsite()}">
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
            <div class="col-md-2">
                <input type='file' onchange="readURL(this);" name="cover_avatar"> <br>
            </div>
            <div class="col-md-3">
	            <c:if test="${not empty stadium.getAvatar()}">
	           		<img id="fileUpload" height="220" width="480" src='<c:url value="/resources/files/${stadium.getAvatar()}"/>' />
	           	</c:if>
	           	<c:if test="${empty stadium.getAvatar()}">
	           		<img id="fileUpload" src='<c:url value="/resources/common/img/stadium-default.png" />'>
	           	</c:if>
            </div>
            
        </div>
        
        <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#fileUpload')
                        .attr('src', e.target.result)
                        .width(400)
                        .height(200);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
        </script>
        
        <div class="form-group row">
            <label class="col-md-3 col-form-label">Slideshow</label>
            <div class="col-md-5">
                <div id="fileuploader">
	                <div class="ajax-upload-dragdrop" style="vertical-align: top; width: 400px;">
		                <div class="ajax-file-upload" style="position: relative; overflow: hidden; cursor: default;">
			                Upload
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
			
			<!-- Lưu thay đổi >> -->
			<!-- Sân 5 -->
			<div class="snp-settings ng-scope" id="stadium-type-item-5" >
			    <div class="sn-settings-top row">
			        <div class="col-md-12 ng-scope" >
			            <div class="sn-settings-bar">
			                <div class="pull-left sn-settings-name">
			                    <span style="float: left;margin-top: 3px" class="ng-binding ng-scope">
			                        <i class="fa fa-check-square" aria-hidden="true"></i>
			                        Loại sân: 5 người (<span id="soLuongSan-5" class="color-red">4</span> sân)
			                        
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
							<tr class="ng-scope">
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start_5" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<c:choose>
					                        		<c:when test="${map.value == 5}">
					                        			<option selected="selected" value="${map.value}">${map.key}</option>
					                        		</c:when>
					                        		<c:otherwise>
					                        			<option  value="${map.value}">${map.key}</option>
					                        		</c:otherwise>
					                        	</c:choose>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end_5" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<c:choose>
					                        		<c:when test="${map.value == 22}">
					                        			<option selected="selected" value="${map.value}">${map.key}</option>
					                        		</c:when>
					                        		<c:otherwise>
					                        			<option  value="${map.value}">${map.key}</option>
					                        		</c:otherwise>
					                        	</c:choose>
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
										      <option value="7-7">T7</option>
										      <option value="8-8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td>
			                        <input onkeydown="return isNumberKey(event)" type="text" name="price_5" pattern="[0-9]{2,5}" title="Vui lòng nhập định dạng số" class="form-control" value="180"/>
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
			
			<div class="snp-settings ng-scope" id="stadium-type-item-7">
			    <div class="sn-settings-top row">
			        <div class="col-md-12 ng-scope" >
			            <div class="sn-settings-bar">
			                <div class="pull-left sn-settings-name">
			                    <span style="float: left;margin-top: 3px" class="ng-binding ng-scope">
			                        <i class="fa fa-check-square" aria-hidden="true"></i>
			                        Loại sân: 7 người (<span id="soLuongSan-7" class='color-red'>2</span> sân) 
			                        
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
			            	<tr class="ng-scope" >
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start_7" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<c:choose>
					                        		<c:when test="${map.value == 5}">
					                        			<option selected="selected" value="${map.value}">${map.key}</option>
					                        		</c:when>
					                        		<c:otherwise>
					                        			<option  value="${map.value}">${map.key}</option>
					                        		</c:otherwise>
					                        	</c:choose>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end_7" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<c:choose>
					                        		<c:when test="${map.value == 16}">
					                        			<option selected="selected" value="${map.value}">${map.key}</option>
					                        		</c:when>
					                        		<c:otherwise>
					                        			<option  value="${map.value}">${map.key}</option>
					                        		</c:otherwise>
					                        	</c:choose>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select name="fromDaytoDay_7"title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option selected="selected" value="2-6">T2-T6</option>
										      <option value="7-8">T7-CN</option>
										      <option value="7-7">T7</option>
										      <option value="8-8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <input onkeydown="return isNumberKey(event)" type="text" name="price_7" pattern="[0-9]{2,5}" title="Vui lòng nhập định dạng số" class="form-control" value="220"/>
			                    </td>
			                    <td class="sn-price-delete-td">
			                        <a class="btn btn-default btn-sm" title="Xóa giá" onclick="removeStadiumNumberPrice(this)">
			                            <i class="fa fa-remove" aria-hidden="true"></i>
			                        </a>
			                    </td>
			                </tr>
			                <tr class="ng-scope" >
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start_7" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<c:choose>
					                        		<c:when test="${map.value == 17}">
					                        			<option selected="selected" value="${map.value}">${map.key}</option>
					                        		</c:when>
					                        		<c:otherwise>
					                        			<option  value="${map.value}">${map.key}</option>
					                        		</c:otherwise>
					                        	</c:choose>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end_7" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<c:choose>
					                        		<c:when test="${map.value == 22}">
					                        			<option selected="selected" value="${map.value}">${map.key}</option>
					                        		</c:when>
					                        		<c:otherwise>
					                        			<option  value="${map.value}">${map.key}</option>
					                        		</c:otherwise>
					                        	</c:choose>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select name="fromDaytoDay_7"title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option value="2-6">T2-T6</option>
										      <option selected="selected" value="7-8">T7-CN</option>
										      <option value="7-7">T7</option>
										      <option value="8-8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <input onkeydown="return isNumberKey(event)" type="text" name="price_7" pattern="[0-9]{2,5}" title="Vui lòng nhập định dạng số" class="form-control" value="240"/>
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
										      <option value="7-7">T7</option>
										      <option value="8-8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td>
			                        <input onkeydown="return isNumberKey(event)" type="text" name="price_5" pattern="[0-9]{2,5}" title="Vui lòng nhập định dạng số" class="form-control"/>
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
			               
			            </tbody>
			        </table>
			        
			        <table style="display:none">
			        	<tbody style="display:none" id="san-7-them-gia-san-item">
			               <tr class="ng-scope" >
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start_7" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end_7" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select name="fromDaytoDay_7"title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option value="2-6">T2-T6</option>
										      <option value="7-8">T7-CN</option>
										      <option value="7-7">T7</option>
										      <option value="8-8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <input onkeydown="return isNumberKey(event)" type="text" name="price_7" pattern="[0-9]{2,5}" title="Vui lòng nhập định dạng số" class="form-control"/>
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
			               
			            </tbody>
			        </table>
			        
			        <table  style="display:none">
			        	<tbody style="display:none" id="san-11-them-gia-san-item">
			               <tr class="ng-scope" >
			                    <td class="sn-price-time-td">
			                        <div class="form-inline">
			                            <select name="cost_hour_start_11" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
					                    
					                    <select name="cost_hour_end_11" class="form-control input-sm ng-valid ng-empty ng-touched ng-dirty ng-valid-parse"> 
					                        <c:forEach var="map" items="${PITCH_BEGIN_END_HOUR_MAP}">
					                        	<option  value="${map.value}">${map.key}</option>
					                        </c:forEach>
					                    </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-day-picker">
			                        <div class="ng-scope">
										   <select name="fromDaytoDay_11" title="--Chọn ngày--" style="width:100%" class="form-control">
										      <option value="2-8">T2-CN</option>
										      <option value="2-6">T2-T6</option>
										      <option value="7-8">T7-CN</option>
										      <option value="7-7">T7</option>
										      <option value="8-8">CN</option>
										   </select>
			                        </div>
			                    </td>
			                    <td class="sn-price-price-td">
			                        <input onkeydown="return isNumberKey(event)" type="text" name="price_11" pattern="[0-9]{2,5}" title="Vui lòng nhập định dạng số" class="form-control"/>
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
			        <label style="display:none; font-size: 14px" class="color-red" id="qty-inform">Nhập số lượng sân bóng ! &nbsp;&nbsp;</label>
			        
			        <select class="form-control input-sm ng-pristine ng-valid ng-not-empty ng-touched" id="pitchType">
			            <option value="5">5 người</option>
			            <option value="7">7 người</option>
			            <option selected="selected" value="11">11 người</option>
			        </select>
					
 					<input type="text" class="form-control input-sm quantity" 
 						style="width:100px" id="quantityId" placeholder="Số lượng">
 						
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
              <a class="btn btn-default"  href="${contextPath}/stadium/management">Quay lại</a>&nbsp;
              <button type="submit" id="btnCreateStadium" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý..." class="btn btn-primary btn-primary-extra ng-scope" >
                    <i class="fa fa-save"></i>
                    Lưu thay đổi
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
				//current.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
				//$("#pitchType").append('<option value="5">5 người</option>');
				break;
			case 7:
				//current.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
				//$("#pitchType").append('<option value="7">7 người</option>');
				break;
			case 11:
				//current.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
				//$("#pitchType").append('<option value="11">11 người</option>');
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
			
			if ($('#quantityId').val() != '') {
				$("#qty-inform").hide();
				switch(loaiSan) {
					case '5':
						$("#soLuongSan-5").text(soLuongSan);
						$("#stadium-type-5-quantities").attr('value', soLuongSan);
						var soLuongSan5 = $('#stadium-type-item-5').html();
						$('#stadium-type-list').append(soLuongSan5);
						$("#pitchType option[value='5']").remove();
						break;
					case '7':
						$("#soLuongSan-7").text(soLuongSan);
						$("#stadium-type-7-quantities").attr('value', soLuongSan);
						var soLuongSan7 = $('#stadium-type-item-7').html();
						$('#stadium-type-list').append(soLuongSan7);
						$("#pitchType option[value='7']").remove();
						break;
					case '11':
						$("#soLuongSan-11").text(soLuongSan);
						$("#stadium-type-11-quantities").attr('value', soLuongSan);
						var soLuongSan11 = $('#stadium-type-item-11').html();
						$('#stadium-type-list').append(soLuongSan11);
						$("#pitchType option[value='11']").remove();
						break;	
				}	
			} else {
				$("#qty-inform").show();
			}
			
		});
		
	});
	
	
</script>
