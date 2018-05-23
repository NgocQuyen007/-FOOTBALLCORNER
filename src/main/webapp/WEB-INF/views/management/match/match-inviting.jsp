<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/tags/taglibs.jsp"%>

        <div class="breadcrum">
            <div class="container">
                <div class="breadcrum-line"><a href="https://www.timdoinhanh.com/">Trang chủ</a><a href="https://www.timdoinhanh.com/match/inviting#">Bắt đối</a></div>
            </div>
        </div>
        <div class="content-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="sidebar sidebar-tien-ich">
                            <ul class="list-left-links">
                                <li><a href="https://www.timdoinhanh.com/match/inviting" class="red">Trận đấu của tôi</a></li>
                                <li><a href="https://www.timdoinhanh.com/stadium/bookinghistory">Đặt sân</a></li>
                                <li>
                                    <a href="https://www.timdoinhanh.com/team/view/9293">Quản lý đội bóng</a>
                                    <!-- ngIf: myTeams.length>0 --><ul class="sub-links ng-scope" ng-if="myTeams.length&gt;0">
                                    <!-- ngRepeat: team in myTeams --><li ng-repeat="team in myTeams" class="ng-scope">
                                    <a href="https://www.timdoinhanh.com/team/management?id=9293" class="ng-binding">
                                        fc2013_t4
                                    </a>
                                </li><!-- end ngRepeat: team in myTeams --><li ng-repeat="team in myTeams" class="ng-scope">
                                <a href="https://www.timdoinhanh.com/team/management?id=8918" class="ng-binding">
                                    FC13T4
                                </a>
                            </li>
                        </ul><!-- end ngIf: myTeams.length>0 -->
                    </li>
                    <li><a href="https://www.timdoinhanh.com/stadium/management">Quản lý sân</a></li>
                    <li><a href="https://www.timdoinhanh.com/user/profile">Tài khoản</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-6 ng-scope" ng-controller="MatchFindingQueueController as vm">
            <!-- ngIf: vm.queueOfMatchInProgress -->
            <!-- ngIf: vm.queueOfMatchInProgress -->

            <div class="q-container ngloaded" style="display: none;" ng-class="{&#39;ngloaded&#39;: vm.queuesOfMatchItems.length&gt;0}">
                <div class="q-items ng-scope" ng-repeat="queue in vm.queuesOfMatchItems" style="">
                    <div class="q-info">
                        <ul class="list-item-san">
                            <li ng-repeat="queueItem in queue.queueItems" class="item-card match-finding-item mfr-qi-partner-overtime" idd="39395">
                                <div match="queueItem.queueData" settings="vm.matchDisplaySettings" class="ng-isolate-scope"><div class="row">
                                    <div class="col-md-12 right-item-san right-item-doi">
                                        <div class="header-item-doi header-tim-doi @">
                                            <!-- ngIf: settings.showTeamLogo -->
                                            <div class="match-header-texts">
                                                <h2>
                                                    <!-- ngIf: match.hasStadium --><a href="https://www.timdoinhanh.com/hello.html?matchId=39395" title="FC13T4" ng-if="match.hasStadium" class="ng-binding ng-scope" style="">FC13T4<i class="fa fa-caret-right" aria-hidden="true"></i>Sân Nam Cao Hòa Khánh</a><!-- end ngIf: match.hasStadium -->

                                                    <!-- ngIf: !match.hasStadium -->
                                                    <!-- ngIf: !match.hasStadium -->
                                                </h2>

                                                <!-- ngIf: settings.showFullInfo && match.ownerUserName -->
                                            </div>

                                            <!-- ngIf: settings.showBtnDoi --><div class="btn-doi-top pull-right ng-scope" ng-if="settings.showBtnDoi" style="">
                                            <div data-match="item" data-settings="settings" class="ng-isolate-scope"><div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
                                                <span class="dropdown-toggle" data-toggle="dropdown">
                                                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                </span>
                                                <ul class="dropdown-menu">
                                                    <li><a href="https://www.timdoinhanh.com/match/inviting#">Lưu trận đấu</a></li>
                                                    <li><a href="https://www.timdoinhanh.com/match/inviting#">Chia sẻ</a></li>
                                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                                </ul>
                                            </div>

                                            <!-- ngIf: dataSettings.btnBatdoiIsVisible -->

                                            <!-- ngIf: dataMatch.isUserMarkedMatchFindingRecipient -->
                                        </div>
                                    </div><!-- end ngIf: settings.showBtnDoi -->
                                </div>

                                <div>
                                    <p class="tim-doi-time ng-binding"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>16h00 Thứ Sáu (24/08)</p>

                                    <!-- ngIf: match.hasStadium --><p class="item-stadium-p ng-scope" ng-if="match.hasStadium" style="">
                                    <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="https://www.timdoinhanh.com/san-quan-ngua-ha-noi.html" target="_blank" class="ng-binding">Sân Nam Cao Hòa Khánh</a>
                                    <!-- ngIf: match.stadiumPrice!=null -->
                                </p><!-- end ngIf: match.hasStadium -->

                                <!-- ngIf: match.hasStadium --><p class="item-stadium-address ng-binding ng-scope" ng-if="match.hasStadium" style=""><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>74 Nam Cao Hòa Khánh Bắc (Quận Liên Chiểu Đà Nẵng)</p><!-- end ngIf: match.hasStadium -->
                                <!-- ngIf: match.clientAreaList && settings.showFullInfo -->

                                <!-- ngIf: match.levelList && settings.showFullInfo -->

                                <!-- ngIf: match.ageGroupList && settings.showFullInfo -->

                                <!-- ngIf: match.contractList && settings.showFullInfo -->

                                <!-- ngIf: !settings.hideStatus -->

                                <!-- ngIf: match.message && settings.showFullInfo -->

                                <!-- ngIf: match.teamPictures && settings.showFullInfo -->

                            </div>
                            
                            <!-- ngIf: settings.showBtnDoi --><div class="btn-doi-bottom mobile-only mobile-only ng-scope" ng-if="settings.showBtnDoi" style="">
                            <div data-match="item" data-settings="settings" class="ng-isolate-scope"><div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
                                <span class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </span>
                                <ul class="dropdown-menu">
                                    <li><a href="https://www.timdoinhanh.com/match/inviting#">Lưu trận đấu</a></li>
                                    <li><a href="https://www.timdoinhanh.com/match/inviting#">Chia sẻ</a></li>
                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                </ul>
                            </div>

                            <!-- ngIf: dataSettings.btnBatdoiIsVisible -->

                            <!-- ngIf: dataMatch.isUserMarkedMatchFindingRecipient -->
                        </div>
                    </div><!-- end ngIf: settings.showBtnDoi -->
                </div>
            </div></div>
            <div-queue-info queue-item="queueItem" class="ng-isolate-scope"><!-- ngIf: queueItem.itemType=='Match' && queueItem.isInvitedByOwner --><p class="mfr-qi-container text-before ng-scope" ng-if="queueItem.itemType==&#39;Match&#39; &amp;&amp; queueItem.isInvitedByOwner" style="">
                <a href="https://www.timdoinhanh.com/user/profile/1428" target="_blank" class="ng-binding">Quyen Phan</a> Đã mời đội bạn
                <a href="https://www.timdoinhanh.com/team/view/" target="_blank" class="ng-binding"></a> tham gia trận đấu này.
            </p><!-- end ngIf: queueItem.itemType=='Match' && queueItem.isInvitedByOwner -->

            <!-- ngIf: queueItem.itemType=='Team' && queueItem.isInvitedByOwner -->

            <div class="mfr-qi-container">
                <div class="status-text ng-binding">Bạn đã không trả lời sau 30 phút.</div>
                <!-- ngIf: queueItem.numberOfMinutesRemaining>0 && queueItem.queueStatus==1 -->

                <div class="dropdown pull-right">
                    <span class="dropdown-toggle pointer" data-toggle="dropdown" onclick="alert(&#39;Xin lỗi bạn, tính năng này chưa được thực hiện.&#39;)">
                        <i class="fa fa-gear" aria-hidden="true"></i>
                    </span>
        <!--<ul class="dropdown-menu">
            <li><a href="#">Xử lý ngay</a></li>
            <li><a href="#" onclick="">Bỏ qua</a></li>
            <li><a href="#">Thay đổi thời gian chờ</a></li>
            <li><a href="#">Tùy chỉnh</a></li>
        </ul>-->
    </div>
</div></div-queue-info>
</li><!-- end ngRepeat: queueItem in queue.queueItems -->
</ul>
</div>
<div class="clear-bordered"></div>
</div><!-- end ngRepeat: queue in vm.queuesOfMatchItems -->
</div>

<!-- ngIf: vm.queueOfTeamInProgress -->
<div class="q-container ngloaded" style="display: none;" ng-class="{&#39;ngloaded&#39;: vm.queuesOfTeamItems.length&gt;0}">
    <!-- ngRepeat: queue in vm.queuesOfTeamItems --><div class="q-items ng-scope" ng-repeat="queue in vm.queuesOfTeamItems" style="">
    <div class="q-info">
        <h4 class="q-info-headline">Trận đấu</h4>
        <ul class="list-item-san">
            <li class="item-card match-finding-item">
                <div match="queue.source" settings="vm.matchDisplaySettings2" class="ng-isolate-scope"><div class="row">
                    <div class="col-md-12 right-item-san right-item-doi">
                        <div class="header-item-doi header-tim-doi @">
                            <!-- ngIf: settings.showTeamLogo -->
                            <div class="match-header-texts">
                                <h2>
                                    <!-- ngIf: match.hasStadium --><a href="https://www.timdoinhanh.com/hello.html?matchId=39395" title="FC13T4" ng-if="match.hasStadium" class="ng-binding ng-scope" style="">FC13T4<i class="fa fa-caret-right" aria-hidden="true"></i>Sân Nam Cao Hòa Khánh</a><!-- end ngIf: match.hasStadium -->

                                    <!-- ngIf: !match.hasStadium -->
                                    <!-- ngIf: !match.hasStadium -->
                                </h2>

                                <!-- ngIf: settings.showFullInfo && match.ownerUserName -->
                            </div>

                            <!-- ngIf: settings.showBtnDoi --><div class="btn-doi-top pull-right ng-scope" ng-if="settings.showBtnDoi" style="">
                            <div data-match="item" data-settings="settings" class="ng-isolate-scope"><div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
                                <span class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </span>
                                <ul class="dropdown-menu">
                                    <li><a href="https://www.timdoinhanh.com/match/inviting#">Lưu trận đấu</a></li>
                                    <li><a href="https://www.timdoinhanh.com/match/inviting#">Chia sẻ</a></li>
                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                    <!-- ngIf: dataMatch.isUserAuthorizedToManageMatch -->
                                </ul>
                            </div>

                            <!-- ngIf: dataSettings.btnBatdoiIsVisible -->

                            <!-- ngIf: dataMatch.isUserMarkedMatchFindingRecipient -->
                        </div>
                    </div><!-- end ngIf: settings.showBtnDoi -->
                </div>

                <div>
                    <p class="tim-doi-time ng-binding"><i class="fa fa-calendar-check-o" aria-hidden="true"></i><strong>Thời gian:</strong>16h00 Thứ Sáu (24/08)</p>

                    <!-- ngIf: match.hasStadium --><p class="item-stadium-p ng-scope" ng-if="match.hasStadium" style="">
                    <i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Sân nhà:</strong><a href="https://www.timdoinhanh.com/san-quan-ngua-ha-noi.html" target="_blank" class="ng-binding">Sân Nam Cao Hòa Khánh</a>
                    <!-- ngIf: match.stadiumPrice!=null -->
                </p><!-- end ngIf: match.hasStadium -->

                <!-- ngIf: match.hasStadium --><p class="item-stadium-address ng-binding ng-scope" ng-if="match.hasStadium" style=""><i class="fa fa-shirtsinbulk" aria-hidden="true"></i><strong>Địa chỉ:</strong>74 Nam Cao Hòa Khánh Bắc (Quận Liên Chiểu Đà Nẵng)</p><!-- end ngIf: match.hasStadium -->
                <!-- ngIf: match.clientAreaList && settings.showFullInfo -->

                <!-- ngIf: match.levelList && settings.showFullInfo -->

                <!-- ngIf: match.ageGroupList && settings.showFullInfo -->

                <!-- ngIf: match.contractList && settings.showFullInfo -->

                <!-- ngIf: !settings.hideStatus --><p ng-if="!settings.hideStatus" class="ng-scope" style="">
                <i class="fa fa-shirtsinbulk" aria-hidden="true"></i> <strong>Trạng thái:</strong> <span class="red ng-binding">Đang chờ</span>
            </p><!-- end ngIf: !settings.hideStatus -->

            <!-- ngIf: match.message && settings.showFullInfo -->

            <!-- ngIf: match.teamPictures && settings.showFullInfo -->

        </div>
        
        <!-- ngIf: settings.showBtnDoi --><div class="btn-doi-bottom mobile-only mobile-only ng-scope" ng-if="settings.showBtnDoi" style="">
        <div data-match="item" data-settings="settings" class="ng-isolate-scope"><div class="dropdown pull-right dropdown-match-btn-more mobile-hidden">
            <span class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-angle-down" aria-hidden="true"></i>
            </span>
            <ul class="dropdown-menu">
                <li><a href="https://www.timdoinhanh.com/match/inviting#">Lưu trận đấu</a></li>
                <li><a href="https://www.timdoinhanh.com/match/inviting#">Chia sẻ</a></li>
            </ul>
        </div>

    </div>
</div>
</div>
</div></div>
</li>
</ul>
<ul class="list-item-san">
    <!-- ngRepeat: queueItem in queue.queueItems --><li ng-repeat="queueItem in queue.queueItems" class="item-card  mfr-qi-partner-overtime">
    <team-item team="queueItem.queueData" chat="onQuickChat(userId)" settings="vm.teamDisplaySettings" class="ng-isolate-scope"><div class="row">
        <div class="col-md-2 item-preview-image">
            <a href="https://www.timdoinhanh.com/team/view/9293" title="fc2013_t4" target="_blank">
                <img class="img-responsive" src="img/sport.png" alt="fc2013_t4" align="thumbnail" src="./tran-dau-cua-toi_files/sport.png">
            </a>
        </div>
        <div class="col-md-10 right-item-san right-item-doi">
            <div class="header-item-doi">
                <h2><a href="https://www.timdoinhanh.com/team/view/9293" target="_blank" title="fc2013_t4" class="ng-binding">fc2013_t4</a></h2>
                <button ng-show="!settings.hideBtnInvite &amp;&amp; team.activeInvitedFromTeamIds.indexOf(fromTeamId)==-1" class="btn btn-default mobile-hidden pull-right btn-sm ng-hide" ng-click="invite(team)" style="">
                    <i class="fa fa-send-o"></i>
                    Mời
                </button>
                <span class="pull-right text-highlight ng-hide" ng-show="team.activeInvitedFromTeamIds.indexOf(fromTeamId)&gt;=0" style=""><i class="fa fa-check"></i> Đã mời</span>
            </div>

            <!-- ngIf: team.teamLeaderName --><p class="team-leader-name user-online-status-container ng-scope" ng-if="team.teamLeaderName" owner-id="1428" style="">
            <a href="https://www.timdoinhanh.com/user/profile/1428" class="ng-binding"><i class="fa fa-user" aria-hidden="true"></i> Quyen Phan</a>
            <span class="captain-item-status offline hide"></span>
            <!-- ngIf: !settings.hideChat --><span class="chat-nhanh ng-scope chat-nhanh-offline" ng-click="chat({userId:team.teamLeaderUserId});" ng-if="!settings.hideChat" title="Click để chat nhanh với đối."><i class="fa fa-comments" aria-hidden="true"></i> Nói chuyện</span><!-- end ngIf: !settings.hideChat -->
        </p><!-- end ngIf: team.teamLeaderName -->
        
        <!-- ngIf: team.about  &&  !settings.hideAbout -->

        
        <!-- ngIf: team.levelId > 0 --><p ng-if="team.levelId &gt; 0" class="ng-binding ng-scope" style="">
        <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
        <strong>Trình độ: </strong> Mới chơi
    </p><!-- end ngIf: team.levelId > 0 -->
    
    <!-- ngIf: team.ageGroupName -->

    
    <!-- ngIf: team.homeStadiumInfo -->
    
    <!-- ngIf: team.homeStadiumAddress -->

</div>

<!-- ngIf: !settings.hideBtnInvite -->

</div></team-item>
<div-queue-info queue-item="queueItem" match="queue.source" class="ng-isolate-scope"><!-- ngIf: queueItem.itemType=='Match' && queueItem.isInvitedByOwner -->

    <!-- ngIf: queueItem.itemType=='Team' && queueItem.isInvitedByOwner --><p class="mfr-qi-container text-before ng-scope" ng-if="queueItem.itemType==&#39;Team&#39; &amp;&amp; queueItem.isInvitedByOwner" style="">
    <span>
        Bạn đã mời đối này
    </span>
</p><!-- end ngIf: queueItem.itemType=='Team' && queueItem.isInvitedByOwner -->

<div class="mfr-qi-container">
    <div class="status-text ng-binding">Đối không trả lời sau 30 phút</div>
    <!-- ngIf: queueItem.numberOfMinutesRemaining>0 && queueItem.queueStatus==1 -->

    <div class="dropdown pull-right">
        <span class="dropdown-toggle pointer" data-toggle="dropdown" onclick="alert(&#39;Xin lỗi bạn, tính năng này chưa được thực hiện.&#39;)">
            <i class="fa fa-gear" aria-hidden="true"></i>
        </span>
        <!--<ul class="dropdown-menu">
            <li><a href="#">Xử lý ngay</a></li>
            <li><a href="#" onclick="">Bỏ qua</a></li>
            <li><a href="#">Thay đổi thời gian chờ</a></li>
            <li><a href="#">Tùy chỉnh</a></li>
        </ul>-->
    </div>
</div></div-queue-info>
</li><!-- end ngRepeat: queueItem in queue.queueItems -->
</ul>
</div>
</div><!-- end ngRepeat: queue in vm.queuesOfTeamItems -->
</div>

<!-- ngIf: !vm.queueOfMatchInProgress && !vm.queueOfTeamInProgress && (vm.queuesOfMatchItems==null || vm.queuesOfMatchItems.length==0) && (vm.queuesOfTeamItems==null || vm.queuesOfTeamItems.length==0) -->
</div>
</div>
</div>
</div>
