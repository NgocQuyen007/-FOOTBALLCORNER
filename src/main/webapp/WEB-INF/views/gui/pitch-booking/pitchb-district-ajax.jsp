<%@page import="java.text.Normalizer"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.PitchInfoDto"%>
<%@page import="entities.PitchDetail"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp" %>

			<div class="col-md-12 l-30" id="stadium-list">
                <div class="p-content">
                    <h1 id="a" class="title-intent title-pages"><i class="fa fa-futbol-o" aria-hidden="true"></i> Sân bóng tại ${pitches.get(0).getDesName()}</h1>
                    
                    <div class="list-search-top">
                        <form method="get" action="${contextPath}/san-bong-tai${dnameurl}-${zipcode}">
                            <div class="col-md-9 nopaddingleft">
                                <div class="form-group">
                                    <input class="form-control" name="keyword" placeholder="Nhập tên sân hoặc địa chỉ để tìm kiếm..." value="${keyword}"/>
                                </div>
                            </div>
                            <div class="col-md-3 nopadding">
                                <button class="btn btn-primary btn-primary-extra col-md-6" type="submit"><i class="fa fa-search" aria-hidden="true"></i>Tìm</button>
                                <a href="${contextPath}/san-bong-tai${dnameurl}-${zipcode}" class="btn btn-default col-md-5 pull-right"><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;Tất cả</a>
                            </div>
                        </form>
                    </div>

                    <ul class="list-item-san">
						
						<c:set var="pitchDetails" value="${pitchDetails}"></c:set>
						<c:set var="pitchInfodtos" value="${pitchInfodtos}"></c:set>
						
						<c:if test="${not empty pitchInfodtos.size()}">
						<%
							List<PitchDetail> pitchDetails = (List<PitchDetail>)pageContext.getAttribute("pitchDetails");
							List<PitchInfoDto> pitchInfodtos = (List<PitchInfoDto>)pageContext.getAttribute("pitchInfodtos");
						%>
						
						<%!
						public List<PitchDetail> getPitchDetailsByPitchId(int pitchId, List<PitchDetail> pitchDetails) {
							List<PitchDetail> pitchDetailByPitchIds = new ArrayList<>();
							for(PitchDetail item: pitchDetails) {
								if(item.getPitch().getId() == pitchId) {
									pitchDetailByPitchIds.add(item);
								}
							}
							return pitchDetailByPitchIds;
						}
						%>
						
						<c:forEach var="pitch" items="${pitches}">
								<li class="item-card">
									<div class="row">
										<div class="col-md-5 item-preview-image">
											<a href="${contextPath}/san-bong/${pitch.id}" title="${pitch.name}" title="">
												<c:choose>
													<c:when test="${empty pitch.avatar}">
														<img class="img-responsive" src='<c:url value="/resources/common/img/sanbong.jpg" />' title="">
													</c:when>
													<c:otherwise>
														<img class="img-responsive" src="https://res.givator.com/pictures/11017/600/2018_04/medium/sanbongdamhong.jpg" title="">
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<div class="col-md-7 right-item-san">
											<h2>
												<a href="${contextPath}/san-bong/${pitch.id}" title="${pitch.name}" title="">
													${pitch.name}
												</a>
											</h2>
											<p>
												<i class="fa fa-map-o" aria-hidden="true"></i> 
												 ${pitch.detail} (${pitch.desName}, Đà Nẵng) 
												<a href="javascript:showGmapPopup('map_canvas', 10.7779868, 106.6373224, 'Hệ Thống Sân Bóng Cỏ Nhân Tạo Đà Nẵng')">
													<span class="fa fa-map-marker"></span>
												</a>
											</p>
										<div>	
										<%
											PitchInfoDto pitch = (PitchInfoDto)pageContext.getAttribute("pitch");
											List<PitchDetail> pitchDetailByPitchIds = getPitchDetailsByPitchId(pitch.getId(), pitchDetails);
											for(PitchDetail pDetailById: pitchDetailByPitchIds) {
										%>
												<p>
													<strong>Giá thuê sân <%=pDetailById.getPitchType().getId()%> người</strong>
												</p>
										<%		
												for (PitchInfoDto dto : pitchInfodtos) {
													if (dto.getPitchDetailId() != null) {
														if (dto.getPitchDetailId() == pDetailById.getId()) {
														pageContext.setAttribute("wdays", dto.getWdayStart());
														pageContext.setAttribute("wdaye", dto.getWdayEnd());
										%>
												<p>
													<%=dto.getHourStart()%>:00 - <%=dto.getHourEnd()%>:00  ${tagfunc:getWday(wdays,wdaye)}  <span class="price-san"><%=dto.getPrice()%>.000 <sup>vnđ</sup></span>
												</p>
										<%					
														}
													}
												}
											}
										%>
										
										</div>
											
										<p class="phone-numb">
											<i class="fa fa-phone-square" aria-hidden="true"></i> 
											${pitch.fullName} - ${pitch.phoneNumber}
										</p>
										
										<a href="${contextPath}/san-bong/${pitch.id}" title="${pitch.name}" class="btn-chi-tiet">
											<i class="fa fa-long-arrow-right" aria-hidden="true"></i> 
											Chi tiết
										</a>
									</div>
									</div>
								</li>
								
						</c:forEach>
						</c:if>
						
						
						<c:if test="${empty pitchInfodtos}">
							<strong>Không có sân bóng nào được tìm thấy</strong>
						</c:if>
					<!-- END PROCESSING -->	
						
					</ul>
					<!--End list-item-san-->
					
					<c:if test="${totalPages > 1}">
					<c:set var="keyword" value="${keyword.replaceAll(' ','+')}" />
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
										<c:when test="${empty keyword}">
											<a href="${contextPath}/san-bong-tai${dnameurl}-${zipcode}?page=${page-1}" class="linkPager hnpagenext" title="Trang sau"> 
												<span class="fix-pagination-paddinghnotherpage fix-pagination-padding"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
											</a>
										</c:when>
										<c:otherwise>
											<a href="${contextPath}/san-bong-tai${dnameurl}-${zipcode}?keyword=${keyword}&page=${page-1}" class="linkPager hnpagenext" title="Trang sau"> 
												<span class="fix-pagination-padding hnotherpage fix-pagination-padding"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
											</a>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							
							<c:forEach var="i" begin="1" end="${totalPages}">
							<!-- SET URL PAGE -->
								<c:choose>
									<c:when test="${empty keyword}">
										<c:set var="urlPage" value="${contextPath}/san-bong-tai${dnameurl}-${zipcode}?page=${i}"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="urlPage" value="${contextPath}/san-bong-tai${dnameurl}-${zipcode}?keyword=${keyword}&page=${i}"></c:set>
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
										<c:when test="${empty keyword}">
											<a href="${contextPath}/san-bong-tai${dnameurl}-${zipcode}?page=${page+1}" class="linkPager hnpagenext" title="Trang sau"> 
												<span class="fix-pagination-padding hnotherpage"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
											</a>
										</c:when>
										<c:otherwise>
											<a href="${contextPath}/san-bong-tai${dnameurl}-${zipcode}?keyword=${keyword}&page=${page+1}" class="linkPager hnpagenext" title="Trang sau"> 
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
            </div>