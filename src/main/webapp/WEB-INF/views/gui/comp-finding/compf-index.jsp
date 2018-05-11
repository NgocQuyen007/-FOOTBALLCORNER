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
                        <form method="get" action="https://www.timdoinhanh.com/tim-doi-da-bong" class="search-form">
                            <div class="col-md-6 nopaddingleft">
                                <input type="text" class="form-control input-sm" name="keyword" placeholder="Nhập tên khu vực, đội bóng hoặc sân bóng..." />
                            </div>

                            <div class="col-md-4 nopaddingleft">
                                <div class="input-group date frm-date-time">
                                    <input id="matchFindingListSearchTime" placeholder="Thời gian" name="time" type='text' class="form-control input-sm jqueryDateTimePickerEnabled" />
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
                                                <a href="/fc-ki-luat.html?matchId=38281" title="Fc kỉ luật">${tagfunc:getFCNameFromFullName(event.getUser().getFullname())} - ${event.getUser().getPhoneNumber()}<i class="fa fa-caret-right" aria-hidden="true"></i>${event.getPname()}</a>
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

                                            <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                     data-modal-qs="toTeamId=8925&toUserId=1572&toMatchId=38281&matchId=38281&teamId=8925&toTeamName=Fc kỉ luật">
                                                <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                            </button>

                                        </div>
                                    </div>

                                    <p class="tim-doi-time"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>${tagfunc:getMatchTime(event.getCreatedAt())}</p>
									
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
                                        <span class="red">Đang chờ</span>
                                    </p>
                                    <p class="quost-doi">
                                        ${event.getMessage()}
                                    </p>

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

                                        <button class="btn btn-sm btn-default pull-right btn-batdoi modal-link-angularjs" data-modal-tpl="match.recipientMaker"
                                                login-required="true" data-modal-qs="toTeamId=8925&toUserId=1572&toMatchId=38281&matchId=38281&teamId=8925&toTeamName=Fc kỉ luật">
                                            <i class="fa fa-send" aria-hidden="true"></i> Bắt đối
                                        </button>



                                    </div>
                                </div>
                            </div>
                        </li>
                        
					</c:forEach>
					
                    </ul>
                    <div class="col-md-12">
                        <div class="pagination_container">
	                        <div class="pagination">
		                        <span class="fix-pagination-padding noLinkPager hnpageprev_inactive">
		                        	<i class="fa fa-angle-left" aria-hidden="true"> </i>
		                        </span>
		                        <span class="noLinkPager hncurrpage">1</span>
		                        
		                        <a href="/tim-doi-da-bong?pi=2" class="linkPager hnpagelink" title="2">
		                        	<span class="hnotherpage">2</span>
		                        </a>
		                        
		                        <a href="/tim-doi-da-bong?pi=3" class="linkPager hnpagelink" title="3">
		                        	<span class="hnotherpage">3</span>
		                        </a>
		                        <a href="/tim-doi-da-bong?pi=19" class="linkPager hnpagelink" title="19">
		                        	<span class="hnotherpage">19</span>
		                        </a>
		                        <a href="/tim-doi-da-bong?pi=2" class="linkPager hnpagenext" title="Trang sau">
		                        	<span class="fix-pagination-padding hnotherpage">
		                        	<i class="fa fa-angle-right" aria-hidden="true"></i>
		                        </span>
		                        </a>
	                        </div>
                        </div>
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