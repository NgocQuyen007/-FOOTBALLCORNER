<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>

<c:if test="${param['msg'] eq 'adds'}">
	<p class="sucess-action">Thêm thành công</p>
</c:if>
<c:if test="${param['msg'] eq 'dels'}">
	<p class="sucess-action">Xóa thành công</p>
</c:if>
<c:if test="${param['msg'] eq 'delf'}">
	<p class="fail-action">Xóa thất bại. Chỉ quản trị viên mới có quyền được xóa sân bóng. </p>
</c:if>


<!-- ngView: --><div class="ng-scope">
<div class="breadcrum ng-scope">
    <div class="container">
        <div class="breadcrum-line"><a href="${contextPath}/">Trang chủ</a><a href="${contextPath}/stadium/management">Danh sách sân</a></div>
    </div>
</div>
<div class="content-wrap ng-scope">
    <div class="container">
        <div class="item-card">
            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li class="ng-scope">
                        <a href="${contextPath}/stadium/management/booking" data-toggle="tab" aria-expanded="true">
                            <i class="fa fa-list" aria-hidden="true"></i>
                            Yêu cầu đặt sân <b class="badge badge-primary ng-binding" style="background-color:red">2</b>
                        </a>
                    </li>

                    <li class="active">
                        <a href="${contextPath}/stadium/management/stadium" data-toggle="tab" aria-expanded="false">
                            <i class="fa fa-list" aria-hidden="true"></i>
                            Danh sách sân
                        </a>
                    </li>
                </ul>
                <div id="myTab1Content" class="tab-content">
                    <div class="tab-pane fade" id="booking">

                    </div>

                    <div class="tab-pane fade active in" id="#/stadium">
                        <div>
                            <div class="pull-right" style="margin-bottom:30px;">
                                <div class="dropdown">
                                    <button class="btn btn-primary btn-primary-extra dropdown-toggle" type="button" data-toggle="dropdown">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i> &nbsp;&nbsp;Tạo sân mới
                                        &nbsp;
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="${contextPath}/stadium/management/addNew">Bóng đá</a>
                                        </li>
                                        <li>
                                            <a>Tennis</a>
                                        </li>
                                        <li>
                                            <a>Bóng chuyền</a>
                                        </li>
                                        <li>
                                            <a>Bóng bàn</a>
                                        </li>
                                        <li>
                                            <a>Cầu Lông</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <table class="table table-striped table-responsive table-stadium-list ng-scope" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th width="80">Loại</th>
                                        <th>Thông tin sân</th>
                                        <th>Ảnh đại diện</th>
                                        <th align="right" style="text-align:right">Tác vụ</th>
                                    </tr>
                                </thead>
								
                                <tbody>
                                <c:if test="${stadiums.size() > 0 }">
                                
                                <fmt:parseNumber var="index" type="number" value="0" />
                                <c:forEach var="stadium" items="${stadiums}">
                                	<span style="display:none">${index = index + 1}</span>
                                	<c:set var="address" value="${stadium.getAddresses().iterator().next()}"></c:set>
                                    <tr  class="ng-scope">
                                        <td class="ng-binding">${index}</td>
                                        <td>
                                            <span class="ng-scope">Bóng đá</span>
                                        </td>
                                        <td>
                                            <a href="${contextPath}/stadium/management#/stadium-info/1273">
                                            	<strong class="ng-binding">${stadium.getName()}</strong>
                                            </a>
                                            <div class="ng-binding">
                                                <i class="fa fa-map-o"></i> ${address.getDetail()} (${address.getDistrict().getName()} Đà Nẵng)
                                            </div>
                                            
                                            <div class="ng-scope">
                                                <i class="fa fa-phone-square"></i> 
                                                <a href="tel:01727272727" class="ng-binding"> ${address.getPhoneNumber()}</a>
                                            </div>
                                            
                                            <div  class="ng-scope">
                                                <i class="fa fa-facebook-square" aria-hidden="true"></i> 
                                                <a target="_blank" class="ng-binding"> ${address.getFacebook()}</a>
                                            </div>
                                            
                                            <div class="ng-scope">
                                                <i class="fa fa-home" aria-hidden="true"></i> 
                                                <a target="_blank" class="ng-binding"> ${address.getWebsite()} </a>
                                            </div>
                                            
                                            <div  class="ng-scope">
                                                <i class="fa fa-envelope-o" aria-hidden="true"></i> 
                                                <a href="mailto:uhuhuhhu@gmail.com" target="_top" class="ng-binding"> ${address.getPemail()}</a>
                                            </div>

                                        </td>
                                        <td>
                                            <img height="120" ng-src="https://res.givator.com/pictures/11017/500/2018_04/original/be-the-good.jpg" src='<c:url value="https://res.givator.com/pictures/11017/500/2018_04/original/be-the-good.jpg" />'>
                                        </td>

                                        <td align="right" style="text-align:right">
                                            <div class="form-group">
                                                <a href="${contextPath}/stadium/management/bookingManager/${stadium.getId()}" class="btn btn-info btn-sm" style="width:130px">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i> Đặt sân
                                                </a>
                                            </div>
                                            <div class="form-group">
                                                <a href="${contextPath}/stadium/management/stadium-info/${stadium.getId()}" class="btn btn-default btn-sm" title="Chỉnh sửa" style="width:130px" >
                                                    <i class="glyphicon glyphicon-pencil"></i> Sửa thông tin
                                                </a>
                                            </div>
                                            <div class="form-group">
                                                <!-- ngIf: stadium.Status == 1 --><a class="btn btn-danger btn-sm ng-scope" confirmation-needed="Bạn có chắc chắn muốn ngưng hoạt động Nam Hoa Vang?" ng-if="stadium.Status == 1" ng-click="changeStatus(stadium.Id,2,$event)" title="Ngưng hoạt động">
                                                    <i class="glyphicon glyphicon-ban-circle"></i> Dừng
                                                </a><!-- end ngIf: stadium.Status == 1 -->
                                                <!-- ngIf: stadium.Status == 2 -->

                                                <a href="${contextPath}/stadium/management/del/${stadium.getId()}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa sân ${stadium.getName()} không ?')" title="Xóa">
                                                    <i class="glyphicon glyphicon-remove-circle"></i> Xóa
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                  </c:forEach>  
                                 </c:if>
                                    
                                </tbody>
                            </table><!-- end ngIf: stadiums.length>=1 -->
                            <!-- ngIf: stadiums.length==0 -->
                        </div>
                    </div> <!-- /.tab-pane -->
                </div>
            </div>

        </div>
    </div>
</div>

</div>
