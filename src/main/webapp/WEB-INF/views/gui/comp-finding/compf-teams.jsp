<%@page import="java.text.Normalizer"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>


<div class="breadcrum">
    <div class="container">
        <div class="breadcrum-line">
            <a href="">Trang chủ</a>
            <a href="" class="" title="Đội bóng">Đội bóng</a>
            <a>Đội bóng tại Đà Nẵng</a>
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
                    <h2 id="a" class="title-intent title-pages mobile-hidden"><i class="fa fa-filter" aria-hidden="true"></i>Lọc kết quả</h2>

                    <div class="sidebar sidebar-tien-ich sidebar-province">
                        <p class="title-box"><i class="fa fa-map-marker" aria-hidden="true"></i> Quận / Huyện</p>
                        <ul class="list-left-links">
                        	<c:forEach var="dqty" items="${teamsofeachdistrict}">
                        	<c:set var="name" value="${dqty.name.substring(dqty.name.indexOf(' '))}"></c:set>
		                    	<%
		                    		String name = (String)pageContext.getAttribute("name");
		                    		String temp = Normalizer.normalize(name, Normalizer.Form.NFD);
		                    		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		                    		pageContext.setAttribute("dnameurl", pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d"));
		                    	%>
                            <li>
                            	<a  href="${contextPath}/san-bong-tai${dnameurl}-${dqty.zipcode}">${dqty.name}
                            		<span>${dqty.quantity}</span>
                            	</a>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="sidebar sidebar-tim-doi ">
                        <ul class="list-left-links list-left-check" >
                            <li>
                                <strong>Trình độ</strong>
                                <ul id="btn-compf-teams-search-all">
                                <c:forEach var="level" items="${teamsofeachlevel}">
                                    <li>
                                        <div class="checkbox">
                                            <label>
                                                <input name="fo-level" type="checkbox" value="${level.id}" />
                                                ${level.name}
                                                <span class="pull-right filter-count">${level.quantity}</span>
                                            </label>
                                        </div>
                                    </li>
                                </c:forEach>    
                                </ul>
                            </li>
                        </ul>

                    </div>
                </div>

            </div>
            <div class="col-md-9 l-30" id="team-list">
                <div class="p-content">
                    <h1 id="3232a" class="title-intent title-pages"><i class="fa fa-futbol-o" aria-hidden="true"></i> Đội bóng tại Đà Nẵng</h1>

                    <div class="form-group list-search-top">
                        <form method="get" action="${contextPath}/doi-bong-tai-da-nang">
                            <div class="col-md-7 nopaddingleft">
                                <input type="text" name="keyword" id="keyword" class="form-control input-sm" placeholder="Nhập tên đội bóng, hoặc khu vực" value="${keyword}" />
                            </div>
                            <div class="col-md-3 nopaddingleft">
                                <div class="input-group date frm-date-time">
                                    <input id="matchFindingListSearchTime" type='text' placeholder="Thời gian đá" class="form-control input-sm jqueryTimePickerEnabled" />
                                    <label class="input-group-addon btn" for="matchFindingListSearchTime">
                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-2 nopadding">
                                <button class="btn btn-sm btn-default" type="submit">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>

                    <ul class="list-item-san">
                    
                    <c:if test="${not empty teams}">
                    <c:forEach var="team" items="${teams}">
                        <li class="item-card">
                            <div class="row">
                                <div class="col-md-2 item-preview-image">
                                    <a href="" title="royal Fc"><img class="img-responsive" src='<c:url value="/resources/common/img/sport.png" />' alt="" align="thumbnail"></a>
                                </div>
                                <div class="col-md-10 right-item-san right-item-doi">
                                    <div class="header-item-doi">
                                        <h2><a href="/royal-fc-262011.html" title="royal Fc">${team.name}</a></h2>

                                        <button idd="9465" class="btn btn-default mobile-hidden pull-right btn-sm modal-link-angularjs"
                                                data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9465&toUserId=1715&toTeamName=royal Fc">
                                            <i class="fa fa-send"></i>
                                            Mời giao lưu
                                        </button>
                                    </div>
                                    <p class="team-leader-name user-online-status-container" owner-id="1715">
                                        <a href="/user/profile/1715"><i class="fa fa-user" aria-hidden="true"></i>${team.getUsers().iterator().next().getFullname()}</a>
                                        <span class="captain-item-status offline hide"></span>
                                        <span class="chat-nhanh" ng-click="onQuickChat(1715);"><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span>
                                    </p>
                                    <p class="quost-doi">${team.description}</p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Trình độ: </strong> ${team.getLevel().getName()}
                                    </p>
                                    <p>
                                        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                                        <strong>Nhóm tuổi: </strong> ${tagfunc:getAgeUtils(team.minAge, team.maxAge)} tuổi
                                    </p>
                                </div>

                                <div class="btn-doi-bottom mobile-only">
                                    <button idd="9465" class="btn btn-default pull-right btn-sm modal-link-angularjs"  data-modal-tpl="match.invitation" login-required="true"  data-modal-qs="toTeamId=9465&toUserId=1715&toTeamName=royal Fc">
                                        <i class="fa fa-send-o"></i>
                                        Mời giao lưu
                                    </button>
                                </div>

                            </div>
                        </li>
                     </c:forEach>
                     </c:if>  
                     
                     <c:if test="${empty teams}">
                     	<b>Không có đội bóng nào được tìm thấy.</b>
                     </c:if>
                        
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
											<c:when test="${empty keyword}">
												<a href="${contextPath}/doi-bong-tai-da-nang?page=${page-1}" class="linkPager hnpagenext" title="Trang sau"> 
													<span class="fix-pagination-padding hnotherpage"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${contextPath}/doi-bong-tai-da-nang?keyword=${keyword}&page=${page-1}" class="linkPager hnpagenext" title="Trang sau"> 
													<span class="fix-pagination-padding hnotherpage"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
												</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="i" begin="1" end="${totalPages}">
								<!-- SET URL PAGE -->
									<c:choose>
										<c:when test="${empty keyword}">
											<c:set var="urlPage" value="${contextPath}/doi-bong-tai-da-nang?page=${i}"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="urlPage" value="${contextPath}/doi-bong-tai-da-nang?keyword=${keyword}&page=${i}"></c:set>
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
												<a href="${contextPath}/doi-bong-tai-da-nang?page=${page+1}" class="linkPager hnpagenext" title="Trang sau"> 
													<span class="fix-pagination-padding hnotherpage"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${contextPath}/doi-bong-tai-da-nang?keyword=${keyword}&page=${page+1}" class="linkPager hnpagenext" title="Trang sau"> 
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
                            <span>team của bạn Không tìm được đối tác phù hợp?</span>
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
