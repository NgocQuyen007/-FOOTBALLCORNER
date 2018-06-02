<%@page import="service.StadiumDetailStatusService"%>
<%@page import="entities.Cost"%>
<%@page import="entities.StadiumDetailStatus"%>
<%@page import="common.DataStaticModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.PitchInfoDto"%>
<%@page import="entities.PitchDetail"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp" %> 

        <div id="calendarBookingTime">
			<%
				StadiumDetailStatusService stadiumDetailStatusService = (StadiumDetailStatusService)request.getAttribute("stadiumDetailStatusService");
				Cost cost = (Cost)request.getAttribute("cost");
				String matchDay = (String)request.getAttribute("matchDay");
				int quantityOfPitchDetail = (int) request.getAttribute("quantityOfPitchDetail");
				
				pageContext.setAttribute("quantityOfPitchDetail", quantityOfPitchDetail);
			%>
			 <c:forEach begin="${cost.getHourStart()}" end="${cost.getHourEnd() - 1}" var="hourStep">
			 
			 <%
			 	StadiumDetailStatus stadiumDetailStatus = new StadiumDetailStatus(cost, matchDay, (int)pageContext.getAttribute("hourStep"));
			 	int count = stadiumDetailStatusService.countNumberOfPitchAvailableByTime(stadiumDetailStatus);
			 	pageContext.setAttribute("count", count);
			 %>
				 <c:choose>
				 	<c:when test="${count < quantityOfPitchDetail}">
					 	<c:choose>
					 		<c:when test="${empty sessionScope.sessionUserInfo}">
								<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#modalNotAuthorize" >
				                 	<i class="fa fa-clock-o" aria-hidden="true"></i> 
				                 	<span class='matchTime-${cost.getId()}-${hourStep}'>
				                 		<%=DataStaticModel.HOUR_LESS_THAN_10.get(pageContext.getAttribute("hourStep"))%> - <%=DataStaticModel.HOUR_LESS_THAN_10.get(Integer.parseInt(pageContext.getAttribute("hourStep").toString())+1)%>
				                 	</span>	
				                </button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-default btn-sm" data-toggle="modal"  data-target="#booking-popup-${cost.getId()}-${hourStep}" >
				                 	<i class="fa fa-clock-o" aria-hidden="true"></i> 
				                 	<span class='matchTime-${cost.getId()}-${hourStep}'>
				                 		<%=DataStaticModel.HOUR_LESS_THAN_10.get(pageContext.getAttribute("hourStep"))%> - <%=DataStaticModel.HOUR_LESS_THAN_10.get(Integer.parseInt(pageContext.getAttribute("hourStep").toString())+1)%>
				                 	</span>	
				                </button>	
							</c:otherwise>
					 	</c:choose>
		                
		                <!-- MODAL PITCH BOOKING BEGIN-->
						<div id="booking-popup-${cost.getId()}-${hourStep}" class="modal fade" role="dialog">
						        <div class="modal-dialog" role="document">
						            <div class="modal-content">
						                <div class="modal-header">
						                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						                    <h3 class="modal-title">Đặt sân</h3>
						                </div> 
						                <!-- /.modal-header -->
						                
		        			<div class="modal-body ">
						        <form action="${contextPath}/customer-booking" method="post">
						            <div class="col-sm-12">
						            	
						            	<input type="hidden" name="costId" value="${cost.getId()}">
						            	<input type="hidden" name="userId" value="${sessionUserInfo.getId()}">
						            	<input type="hidden" name="pitchId" value="${cost.getPitchDetail().getPitch().getId()}">
						            	
						                <div class="form-group row">
						                    <label class="control-label col-md-2 col-xs-12">Thời gian:</label>
						                    <div class="col-xs-12 col-md-6">
						                        <input name="matchDayAndTime" type="text" class="form-control matchDay-modal-${cost.getId()}-${hourStep}" value="">
						                        <script type="text/javascript">
						                        	var thoiGian = $('.matchTime-${cost.getId()}-${hourStep}').text().trim() + ' ngày ' + $('.matchDay-${cost.getId()}').val();
						                        	$('.matchDay-modal-${cost.getId()}-${hourStep}').val(thoiGian) ;
						                    	</script>
						                    </div>
						                </div>
						                
						                <div class="form-group row">
						                    <label class="control-label col-md-2 col-xs-12">Liên hệ:</label>
						                    <div class="col-xs-12 col-md-6">
						                        <strong><input name="customerName" type="text" class="form-control" value="${sessionUserInfo.getFullname()}"></strong>
						                    </div>
						                </div>
						                
						                <div class="form-group row">
						                    <label class="control-label col-md-2 col-xs-12">SĐT:</label>
						                    <div class="col-xs-12 col-md-6">
						                        <strong><input name="phoneNumber" type="text" class="form-control" value="${sessionUserInfo.getPhoneNumber()}"></strong>
						                    </div>
						                </div>
						
						                <div class="row form-group">
						                    <label class="control-label col-md-2 col-xs-12">Ghi chú:</label>
						                    <div class="col-xs-12 col-md-10">
						                        <textarea name="note" placeholder="Nhập tin liên hệ, thông báo để chủ sân xử lý yêu cầu của bạn nhanh hơn" class="form-control"></textarea>
						                    </div>
						                </div>
						                <div class="row form-group">
						                    <div class="col-xs-12">
						                        <label class="control-label" for="is-repeat"><input type="checkbox"> Đặt lịch cố định hàng tuần</label>
						                        <input  type="hidden" value="0">
						                    </div>
						                </div>
						            </div>
						            <div class="modal-footer">
						                    <button type="submit" class="btn btn-primary btn-primary-extra">
						                        <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Đặt lịch
						                    </button>
						                    <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
						                </div>
						        </form>
						    </div> 
				            </div>
				        </div>
				    </div>
					<!-- MODAL PITCH BOOKING END -->
						
		                
				 	</c:when>
				 	<c:otherwise>
				 		<button type="button" onclick="" class="btn btn-default btn-sm" disabled>
		                 	<i class="fa fa-clock-o" aria-hidden="true"></i> 
		                 	<%=DataStaticModel.HOUR_LESS_THAN_10.get(pageContext.getAttribute("hourStep"))%> - <%=DataStaticModel.HOUR_LESS_THAN_10.get(Integer.parseInt(pageContext.getAttribute("hourStep").toString())+1)%>
		                </button>
				 	</c:otherwise>
				 </c:choose>
              </c:forEach>   
         </div>
