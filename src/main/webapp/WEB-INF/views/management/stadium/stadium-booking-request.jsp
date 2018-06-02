<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>



<div class="top-banner-box ng-scope">
    <div class="container">
        <h2 class="page-title">Danh sách sân bóng</h2>
    </div>
</div>

<div class="breadcrum ng-scope">
    <div class="container">
        <div class="breadcrum-line"><a href="#">Trang chủ</a><a href="#">Danh sách sân</a></div>
    </div>
</div>

<div class="alert alert-danger reject hidden">
  <strong>Từ chối đặt sân!</strong> Thực hiện thất bại.
</div>

<div class="content-wrap ng-scope">
    <div class="container">
        <div class="item-card">
            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li class="active">
                        <a href="${contextPath}/stadium/management/booking" aria-expanded="true">
                            <i class="fa fa-list" aria-hidden="true"></i>
                            Yêu cầu đặt sân <b class="badge badge-primary ng-binding" style="background-color:red">${stadiumDetailStatusList.size()}</b>
                        </a>
                    </li>

                    <li>
                        <a href="${contextPath}/stadium/management" aria-expanded="false">
                            <i class="fa fa-list" aria-hidden="true"></i>
                            Danh sách sân
                        </a>
                    </li>
                </ul>
                <div id="myTab1Content" class="tab-content">
                    <div class="tab-pane fade active in" id="booking">
                        <div id="stadiumBookingRequests" style="min-height:250px; position:relative">
                            <table class="table table-striped table-booking-requests table-responsive">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Sân</th>
                                        <th>Người đặt</th>
                                        <th>Thời gian</th>
                                        <th>Nội dung</th>
                                        <th class="text-right" width="250">Tác vụ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty stadiumDetailStatusList}">
                                	<c:forEach var="stadiumStatus" items="${stadiumDetailStatusList}" varStatus="loop">
                                	
                                		<tr class="booking-request-${stadiumStatus.getId()}">
                                        	<td>${loop.index}</td>
	                                        <td>
	                                            ${stadiumStatus.getCost().getPitchDetail().getPitch().getName()} <br>
	                                            Sân ${stadiumStatus.getCost().getPitchDetail().getPitchType().getId()}
	                                        </td>
	                                        <td>
	                                            ${stadiumStatus.getCustomerName()}
	                                            <span>
	                                               <br>
	                                               ${stadiumStatus.getPhoneNumber()}
	                                            </span>
	                                        </td>
	                                        <td>
	                                            <span>${stadiumStatus.getMatchDateTime()}</span>
	                                        </td>
	                                        <td class="ng-binding">
	                                            ${stadiumStatus.getNote()}
	                                        </td>
	                                        <td class="text-right" style="text-align:right">
	                                            <button ng-click="approveBookingRequest($event, item)" data-loading-text="&lt;i class=&#39;fa fa-spinner fa-spin &#39;&gt;&lt;/i&gt; Đang xử lý" class="btn btn-primary btn-primary-extra btn-sm">
	                                                <i class="fa fa-check-square"></i>
	                                                Chấp nhận
	                                            </button>
	                                            <button onclick="rejectBookingRequest(${stadiumStatus.getId()}, '${stadiumStatus.getMatchDateTime()}')" class="btn btn-danger btn-sm">
	                                                <i class="fa fa-ban" aria-hidden="true"></i>
	                                                Từ chối
	                                            </button>
	                                        </td>
	                                    </tr>
                                	</c:forEach>
                                </c:if>
                                
                                <c:if test="${empty stadiumDetailStatusList}">
                                	Không có yêu cầu đặt sân nào
                                </c:if>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="#/stadium">
                    </div> <!-- /.tab-pane -->
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
	function rejectBookingRequest(stadiumDetailStatusId, matchDateTime) {
		var contextPath = $("#contextPath").val();
		
		$.ajax({
			url : contextPath+"/stadium/management/booking/reject/"+ stadiumDetailStatusId,
			type: "GET", 
			data: {
				
			},
				
			success: function(value) {
				if (value == 'success') {
					alert("Bạn đã từ chối sân lúc " + matchDateTime);
					$(".booking-request-"+stadiumDetailStatusId).hide();	
				} else {
					$(".reject").removeClass("hidden");
				}
			},
			
			error: function() {
				console.log("rejectBookingRequest: FAIL")
			}
		})
		
	}
</script>