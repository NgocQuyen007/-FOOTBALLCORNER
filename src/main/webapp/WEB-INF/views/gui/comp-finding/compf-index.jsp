<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>


<div class="breadcrum">
    <div class="container">
        <div class="breadcrum-line">
            <a href="/">Trang chủ</a>
            <a>Tìm đối đá bóng</a>
        </div>
    </div>
</div>

<div class="content-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="sidebar-filter-container">
                    <div class="m-btn-expand-holder mobile-only">
                        <span class="form-filter-san-span">Lọc kết quả <i class="fa fa-filter" aria-hidden="true"></i></span>
                    </div>
                    <h2 id="dssa" class="title-intent title-pages mobile-hidden"><i class="fa fa-filter" aria-hidden="true"></i>Lọc kết quả</h2>

                    <div class="sidebar sidebar-tim-doi">
                        <ul class="list-left-links list-left-check">
                            <li>
                                <strong>Sân nhà</strong>
                                <ul>
                                    <li onclick="location.href='/tim-doi-da-bong?hasstadium=1';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="2fo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> C&#243; s&#226;n nh&#224;
                                                <span class="pull-right filter-count">168</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/tim-doi-da-bong?hasstadium=0';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="21fo" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Cần đi kh&#225;ch
                                                <span class="pull-right filter-count">117</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <strong>Trình độ</strong>
                                <ul>
                                    <li onclick="location.href='/tim-doi-da-bong?level=8';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fsdsso" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Kh&#225;
                                                <span class="pull-right filter-count">6</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/tim-doi-da-bong?level=6';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="afo" name="fo" type="checkbox" value="true" /><input name="afo" type="hidden" value="false" /> Mềm
                                                <span class="pull-right filter-count">7</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li onclick="location.href='/tim-doi-da-bong?level=1';" >
                                        <div class="checkbox">
                                            <label>
                                                <input id="fddso" name="fo" type="checkbox" value="true" /><input name="fo" type="hidden" value="false" /> Mới chơi
                                                <span class="pull-right filter-count">8</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </li>

                        </ul>

                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class="p-content">
                    <h1 id="a" class="title-intent title-pages"><i class="fa fa-futbol-o" aria-hidden="true"></i>Tìm đội đá bóng tại Đà Nẵng</h1>
                    <div class="form-group list-search-top">
                        <form method="get" action="${contextPath}/tim-doi-da-bong-tai-da-nang" class="search-form">
                            <div class="col-md-6 nopaddingleft">
                                <input type="text" class="form-control input-sm" name="keyword" value="${keyword}" placeholder="Nhập tên sân bóng hoặc khu vực ..." />
                            </div>

                            <div class="col-md-4 nopaddingleft">
                                <div class="input-group date frm-date-time">
                                    <input id="datepicker1" placeholder="Thời gian" name="created_at" value="${created_at}" type='text' class="form-control input-sm" />
                                    <label class="input-group-addon btn" for="matchFindingListSearchTime">
                                        <span class="glyphicon glyphicon-calendar">
                                        </span>
                                    </label>
                                </div>
                            </div>

                            <div class="col-md-2 nopadding">
                                <button class="btn btn-sm btn-default width-100p" type="submit">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>

                    <ul class="list-item-san">
					
					<c:forEach var="event" items="${events}">
						
                        <li class="item-card match-finding-item" >
                            <div class="row">
                                <div class="col-md-12 right-item-san right-item-doi">

                                    <div class="header-item-doi header-tim-doi ">
                                        <div class="match-header-texts">
                                            <h2>
                                                <a href="" title="" >${tagfunc:getFCNameFromFullName(event.getUser().getFullname())} - ${event.getUser().getPhoneNumber()}<i class="fa fa-caret-right" aria-hidden="true"></i>${event.getPname()}</a>
                                            </h2>
                                            <p class="captain-item noborder">
                                                <a href="/user/profile/1572"><i class="fa fa-user" aria-hidden="true"></i> ${event.getUser().getFullname()}</a>
                                                <span class="captain-item-status offline hide"></span>
                                                <span class="chat-nhanh"><i class="fa fa-comments" aria-hidden="true"></i>Nói chuyện</span>
                                            </p>
                                        </div>
                                        <div class="btn-doi-top pull-right">
                                            <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
										    <span class="dropdown-toggle" data-toggle="dropdown">
										        <i class="fa fa-angle-down" aria-hidden="true"></i>
										    </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Lưu trận đấu</a></li>
                                                    <li><a href="#">Chia sẻ</a></li>
                                                </ul>
                                            </div>
                                            
                                            <c:if test="${event.status == 0}"> 
                                            	<c:choose>
	                                            	<c:when test="${tagfunc:isDateBeforeNow(event.createdAt, cnow) == 1}">
	                                        				<button class="btn btn-sm btn-default pull-right " >
					                                                <i class="fa fa-send" aria-hidden="true"></i> <span class='color-red'> Quá hạn </span>
					                                        </button>	
	                                        			</c:when>
	                                        			<c:otherwise>
	                                        				<c:choose>
																<c:when test="${empty sessionScope.sessionUserInfo}">
																	<button class="btn btn-sm btn-default pull-right btn-batdoi" data-toggle="modal" data-target="#modalNotAuthorize" >
						                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
						                                            </button>
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${sessionScope.sessionUserInfo.id != event.getUser().getId()}">
																			<button class="btn btn-sm btn-default pull-right btn-batdoi" data-toggle="modal" onclick="InitialFindingRecipientModal('${tagfunc:getFCNameFromFullName(event.getUser().getFullname())} - ${event.getUser().getPhoneNumber()}', '${event.id}')" >
								                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
								                                            </button>	
								                                        </c:when> 
								                                        <c:otherwise>
								                                        	<button class="btn btn-sm btn-default pull-right " >
								                                                <i class="fa fa-send" aria-hidden="true"></i> <span class='color-red'> Hủy trận </span>
								                                            </button>	
								                                        </c:otherwise>
							                                        </c:choose>   
																</c:otherwise>
															</c:choose> 
	                                        			</c:otherwise>	
	                                            </c:choose>
                                            </c:if>
                                            
                                            
                                        </div>
                                    </div>
                                    
                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>
                                    <strong>Thời gian:</strong>${tagfunc:getMatchTime(event.getCreatedAt())}</p>
									
                                    <p class="item-stadium-p">
                                    	<c:if test="${event.getPname().contains('Cần đi khách')}">
                                       		<i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong>Chưa có
                                        </c:if>
                                        <c:if test="${!event.getPname().contains('Cần đi khách')}">
                                        	<i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="" target="_blank">${event.getPname()}</a>
                                    	</c:if>
                                    </p>
                                   
                                    <p class="item-stadium-address"><i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                    	<strong>Khu vực: </strong> ${event.getDistrict().getName()}
                                    </p>
                                    
                                    <p class="level-row">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ:</strong> ${event.getLevel().getName()}
                                    </p>
                                    <p class="match-contract">
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Kèo:</strong> ${event.getHandicap().getName()}
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong>
                                        
                                        
                                        <c:choose>
                                        	<c:when test="${event.status == 0}">
                                        		<c:choose>
                                        			<c:when test="${tagfunc:isDateBeforeNow(event.createdAt, cnow) == 1}">
                                        				<span class="red">Quá hạn</span>	
                                        			</c:when>
                                        			<c:otherwise>
                                        				<span class="red">Đang chờ</span>
                                        			</c:otherwise>
                                        		</c:choose>
                                        	</c:when>
                                        	<c:when test="${event.status == 2}">
                                        			<span class="red">Quá trình bắt đối đang diễn ra .... </span>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<span class="red">Đã có kèo. Hẹn trận khác: ${event.getUser().getPhoneNumber()}</span>
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                    </p>
                                    <p class="quost-doi">
                                        ${event.getMessage()}
                                    </p>
									
									<!-- Responsive mobile -->
                                    <div class="btn-doi-bottom mobile-only mobile-only">

                                        <div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
										    <span class="dropdown-toggle" data-toggle="dropdown">
										        <i class="fa fa-angle-down" aria-hidden="true"></i>
										    </span>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Lưu trận đấu</a></li>
                                                <li><a href="#">Chia sẻ</a></li>
                                            </ul>
                                        </div>
											<!-- Chỉ có status == 0 mới hiển thị cờ Bắt đối để bắt đối với Event đó -->
											<c:if test="${event.status == 0}"> 
                                            	<c:choose>
	                                            	<c:when test="${tagfunc:isDateBeforeNow(event.createdAt, cnow) == 1}">
	                                        				<button class="btn btn-sm btn-default pull-right " >
					                                                <i class="fa fa-send" aria-hidden="true"></i> <span class='color-red'> Quá hạn </span>
					                                        </button>	
	                                        			</c:when>
	                                        			<c:otherwise>
	                                        				<c:choose>
																<c:when test="${empty sessionScope.sessionUserInfo}">
																	<button class="btn btn-sm btn-default pull-right btn-batdoi" data-toggle="modal" data-target="#modalNotAuthorize" >
						                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
						                                            </button>
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${sessionScope.sessionUserInfo.id != event.getUser().getId()}">
																			<button class="btn btn-sm btn-default pull-right btn-batdoi" data-toggle="modal" onclick="InitialFindingRecipientModal('${tagfunc:getFCNameFromFullName(event.getUser().getFullname())} - ${event.getUser().getPhoneNumber()}')" >
								                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
								                                            </button>	
								                                        </c:when> 
								                                        <c:otherwise>
								                                        	<button class="btn btn-sm btn-default pull-right " >
								                                                <i class="fa fa-send" aria-hidden="true"></i> <span class='color-red'> Hủy trận </span>
								                                            </button>	
								                                        </c:otherwise>
							                                        </c:choose>   
																</c:otherwise>
															</c:choose> 
	                                        			</c:otherwise>	
	                                            </c:choose>
                                            </c:if>
										
                                    </div>
                                </div>
                            </div>
                            
                        </li>
                        
					</c:forEach>
                    </ul>
                    
                    
                    
                    <div class="col-md-12">
                    <c:if test="${totalPages > 1}">
						<div class="pagination_container">
							<div class="pagination">
								<c:choose>
									<c:when test="${page==1}">
										<span class="fix-pagination-padding noLinkPager hnpageprev_inactive"> 
											<i class="fa fa-angle-left" aria-hidden="true"></i>
										</span> 
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${empty keyword and empty created_at}">
												<a href="${contextPath}/tim-doi-da-bong-tai-da-nang?page=${page-1}" class="linkPager hnpagenext" title="Trang sau"> 
													<span class="fix-pagination-padding hnotherpage"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${contextPath}/tim-doi-da-bong-tai-da-nang?keyword=${keyword}&created_at=${created_at}&page=${page-1}" class="linkPager hnpagenext" title="Trang sau"> 
													<span class="fix-pagination-padding hnotherpage"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
												</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="i" begin="1" end="${totalPages}">
									<c:choose>
										<c:when test="${empty keyword and empty created_at}">
											<c:set var="urlPage" value="${contextPath}/tim-doi-da-bong-tai-da-nang?page=${i}"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="urlPage" value="${contextPath}/tim-doi-da-bong-tai-da-nang?keyword=${keyword}&created_at=${created_at}&page=${i}"></c:set>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${page==i}">
											<a href="${urlPage}" class="noLinkPager hncurrpage" title="${i}">
												<span class="hnotherpage">${i}</span>
											</a>
										</c:when>
										<c:otherwise>
											<a href="${urlPage}" class="linkPager hnpagelink" title="${i}">
											<span class="hnotherpage">${i}</span>
										</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${page==totalPages}">
										<span class="fix-pagination-padding noLinkPager hnpageprev_inactive"> 
											<i class="fa fa-angle-right" aria-hidden="true"></i>
										</span> 
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${empty keyword and empty created_at}">
												<a href="${contextPath}/tim-doi-da-bong-tai-da-nang?page=${page+1}" class="linkPager hnpagenext" title="Trang sau"> 
													<span class="fix-pagination-padding hnotherpage"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${contextPath}/tim-doi-da-bong-tai-da-nang?keyword=${keyword}&created_at=${created_at}&page=${page+1}" class="linkPager hnpagenext" title="Trang sau"> 
													<span class="fix-pagination-padding hnotherpage fix-pagination-padding"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
												</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:if>
                    </div>
                    

                    <div class="form-filter-doi">
                        <div class="title-btn-moi-doi">
                            <span>Team của bạn Không tìm được đối tác phù hợp?</span>
                            <a href="javascript:void(0);" data-toggle="modal" data-target="#commonModal" class="btn btn-default btn-moi-doi btn-link-moi-doi modal-link-angularjs" data-modal-tpl="match.create"><i class="fa fa-beer" aria-hidden="true"></i> Mời đối giao lưu</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!--#top hero box-->
<style type="text/css">
    .sp-autocomplete img {
        display: none;
    }
</style>
<script type="text/javascript">
    function onSearchMatchStadiumSelectedChange(data) {
        $('#searchMatchStadiumId').val(data.params.data.id);
    }
</script>

<!-- Mở modal bắt đối -->
<script type="text/javascript">
	function InitialFindingRecipientModal(contact, eventId) {
		$(".modal-body #contact-info").val(contact);
		$(".modal-body #event-id").val(eventId);
		$('#modalBatDoi').modal('show');
	}
</script>



<!-- ================  MODAL BẮT ĐỐI ============== -->

<div id="modalBatDoi" class="modal fade" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
			   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			   <h4 class="modal-title"> <i class="fa fa-send" aria-hidden="true"></i> Bắt đối</h4> 
			</div>
            
			<div class="modal-body">
				<div class="ng-scope">
				    <form action="${contextPath}/match-frecipient"  method="post" class="form-horizontal ng-pristine ng-scope ng-invalid ng-invalid-required ngloaded" id="formMatchFindingRecipientCreate"  style="display: none;" >
				        
				        <input type ="hidden" name="event_id" id="event-id" value="" />
				        <input type ="hidden" name="curl" id='current-url' value="" />
				        <script type="text/javascript">
				        	var curl = window.location.href;
				        	document.getElementById("current-url").value = curl;
				        </script>
				        
				        <div class="form-group ng-scope">
				            <strong class="control-label col-md-3 color-red">Liên hệ đối:</strong>
				            <div class="col-md-9">
				                <strong><input id="contact-info" name="info-mock" type="text" class="form-control noborder" value="" readonly="readonly"></strong>
				            </div>
				
				        </div>
				        <hr  class="ng-scope">
				
				        <div class="form-group">
				            <label class="control-label col-md-3">Thông tin của bạn: <span class="required">*</span></label>
				            <div class="col-md-9">
				                <div style="margin-bottom:5px">
						              <strong><input name="information" type="text" class="form-control" value="${sessionScope.sessionUserInfo.fullname} - ${sessionScope.sessionUserInfo.phoneNumber} " placeholder="Nhập thông tin để đối thủ liên hệ ..."></strong>
				                </div>
				            </div>
				        </div>
						
				        <div class="form-group">
				            <label class="control-label col-md-3">Lời nhắn: <span class="required">*</span></label>
				            <div class="col-md-9">
				                <textarea name="message" required rows="3" cols="5" class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" placeholder="Lời mời giao lưu"></textarea>
				            </div> 
				        </div> 
				
				        <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
				            <button class="btn btn-primary btn-primary-extra ng-scope" type="submit">
				                <i class="fa fa-send"></i> Gửi
				            </button>
				        </div> 
				
				    </form>
				</div>
			</div>
		</div>
	</div>
</div>
