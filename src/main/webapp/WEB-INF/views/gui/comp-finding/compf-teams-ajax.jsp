<%@page import="java.text.Normalizer"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>


			<div class="col-md-12 l-30" id="team-list">
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
                    
                    <!-- No pagination -->
                    
                    <div class="form-filter-doi">
                        <div class="title-btn-moi-doi">
                            <span>team của bạn Không tìm được đối tác phù hợp?</span>
                            <a href="#" class="btn btn-default btn-moi-doi btn-link-moi-doi modal-link-angularjs" data-modal-tpl="match.create" login-required="true"><i class="fa fa-beer" aria-hidden="true"></i> Mời đối giao lưu</a>
                        </div>
                    </div>
                </div>
            </div>
