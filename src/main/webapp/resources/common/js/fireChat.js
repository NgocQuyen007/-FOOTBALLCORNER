if (typeof isMessagesPage === 'undefined') {
    isMessagesPage = false;
}
var isMobile = common.func.isMobile.any();
$(document).ready(function () {
    if (isMobile) {
        $('#fireChatConversation').addClass('mobile-conversation');
    }
});

'use strict';
sportApp.config(function ($httpProvider, $routeProvider) {
    // todo
})
    .run(function ($rootScope, CommonService, FireUserService, $firebase) {

    })
    .controller("fireChatCtrl", function ($q, $rootScope, $scope, CommonService, FireUserService, FireChannelService) {
        $scope.currentUser = {};
        $scope.pendingUsersId = [];
        $scope.pendingChannelList = [];
        $scope.normalChannelList = [];
        $scope.searchChannelList = [];
        $scope.chattingChannelList = [];
        $scope.currentChannel = {};
        $scope.liveChattingChannelList = [];
        $scope.totalPendingMsg = 0;
        $scope.loadPendingChannelList = false;
        $scope.loadNormalChannelList = false;

        // load pending channel infomation
        $scope.countLoadPendingChannelItem = 0;
        $scope.onLoadPendingChannelList = function () {
            if ($.isEmptyObject($scope.currentUser) ||
                $.isEmptyObject($scope.currentUser.currentChannels)) {
                $scope.loadPendingChannelList = true;
                return;
            }

            var channels = [];
            var pendingChannels = $scope.currentUser.currentChannels;
            for (var i = 0; i < pendingChannels.length; i++) {
                var chann = new channel();
                chann.parseChannel(pendingChannels[i]);

                if (!$scope.isInChattingChannelList(chann.channelId)) {
                    // get channel info
                    $scope.pullGuestUserInfo(chann).then(function (chann) {
                        FireChannelService.pullChannelInfo(chann).then(function () {
                            common.func.angularApply($scope, function () {
                                $scope.pendingChannelList = $scope.pendingChannelList;

                                $scope.countLoadPendingChannelItem++;
                                if ($scope.countLoadPendingChannelItem == $scope.pendingChannelList.length) {
                                    $scope.loadPendingChannelList = true;
                                }
                            });
                        });
                    });
                    channels.push(chann);
                }
            }

            if (channels.length == 0) {
                $scope.loadPendingChannelList = true;
            }
            $scope.totalPendingMsg = channels.length;
            $scope.pendingChannelList = channels;
        };
        // end

        // load normal channel
        $scope.countLoadNormalChannelItem = 0;
        $scope.onLoadNormalChannelList = function () {
            var channels = [];
            var userList = $scope.onlineFriends;
            for (var i = 0; i < userList.length; i++) {
                var chann = new channel();
                chann.creatChannel(userList[i].id);

                // check channel not in chatting channel list
                if (!$scope.isInChattingChannelList(chann.channelId)) {
                    // check channel not pending channel
                    var pendingChannel = $.grep($scope.pendingChannelList, function (u) {
                        return u.channelId == chann.channelId;
                    });
                    if (!common.func.isActiveObj(pendingChannel)) {
                        // get channel info
                        $scope.pullGuestUserInfo(chann).then(function () {
                            common.func.angularApply($scope, function () {
                                $scope.normalChannelList = $scope.normalChannelList;

                                $scope.countLoadNormalChannelItem++;
                                if ($scope.countLoadNormalChannelItem == $scope.normalChannelList.length) {
                                    $scope.loadNormalChannelList = true;
                                }
                            });
                        });
                        channels.push(chann);
                    }
                }
            }

            if (channels.length == 0) {
                $scope.loadNormalChannelList = true;
            }
            $scope.normalChannelList = channels;
        };
        // end

        // load search channel
        $scope.onLoadSearchChannelList = function () {
            var channels = [];
            var userList = $scope.userSearchListDisplay;
            for (var i = 0; i < userList.length; i++) {
                var chann = new channel();
                chann.creatChannel(userList[i].id);
                // get channel info
                $scope.pullGuestUserInfo(chann).then(function () {
                    common.func.angularApply($scope, function () {
                        $scope.normalChannelList = $scope.normalChannelList;
                    });
                });
                channels.push(chann);
            }

            $scope.searchChannelList = channels;
        };

        $scope.isInChattingChannelList = function (channelId) {
            var existingChatting = $.grep($scope.chattingChannelList, function (u) {
                return u.channelId == channelId;
            });
            return common.func.isActiveObj(existingChatting);
        };
        // end

        $scope.doAfterLoaded = function () {
            $scope.showFirstChatWidget();
        };
        $scope.triggerDoAfterLoaded = function () {
            setTimeout(function () {
                if ($scope.loadNormalChannelList && $scope.loadPendingChannelList) {
                    $scope.doAfterLoaded();
                }
                else {
                    $scope.triggerDoAfterLoaded();
                }
            }, 1000);
        };

        $scope.pullGuestUserInfo = function (chann) {
            var guestInfo = $.grep($scope.onlineFriends, function (u) {
                return u.id == chann.guestId;
            });

            if (!common.func.isActiveObj(guestInfo)) { // not exist user in online list
                // chann.guestUserStatus = 0; // offline
                // get info from firebase
                return FireUserService.pullChanneluserInfo(chann);
            }
            else {
                chann.guestUserStatus = 1; // online
                chann.guestUserName = guestInfo[0].name;
                chann.guestAvatar = guestInfo[0].avatar;
                chann.teamName = guestInfo[0].teamName;

                var deferred = $q.defer();
                deferred.resolve(chann);
                return deferred.promise;
            }
        };

        $scope.showFirstChatWidget = function () {
            if (!common.func.isActiveObj($scope.currentChannel)) {
                if (isMessagesPage) {
                    setTimeout(function () {
                        var isChatting = false;
                        $('#fireChatApplication').find('.chat__wrapper li').each(function () {
                            if (!isChatting && !$(this).hasClass('hidden')) {
                                $(this).click();
                                isChatting = true;
                            }
                        });
                    }, 200);
                }
                else if (common.func.isActiveObj($scope.currentUser.chattingChannelId)) {
                    $scope.onGoToChattingChannel($scope.currentUser.chattingChannelId);
                }
            }
        };

        $scope.onlineFriends = [];
        $scope.offlineFriends = [];

        //$scope.userListFireObj = [];
        $scope.userSearchListDisplay = [];
        $scope.userTotalOnline = 0;
        $scope.currentGuestUser = null;
        $scope.currentMessageContent = '';
        $scope.currentConversationDisplay = {
            currentChannelId: '',
            title: '',
            messages: []
        };
        $scope.searchUserKeyword = '';
        $scope.activeChannel = null;

        $scope.onLoadFriendsWidget = function () {
            FireUserService.searchUserAvaible().then(function (users) {
                common.func.angularApply($scope, function () {
                    var userListFireObj = users == null ? [] : users;
                    $scope.calculateFriendsCount(userListFireObj);

                    $scope.onLoadPendingChannelList();
                    $scope.onLoadNormalChannelList();
                    $scope.triggerDoAfterLoaded();
                });
            });
        };

        $scope.onSearchFriendsWidget = function (keyword) {
            var usresRef = {};
            if (keyword != undefined && keyword != null && keyword != '') {
                $scope.animationFriendListLoading_Start();

                var key = keyword.toLowerCase();
                FireUserService.searchUsers(key).then(function (users) {
                    common.func.angularApply($scope, function () {
                        var userListFireObj = users == null ? [] : users;
                        $scope.calculateSearchFriendsCount(userListFireObj);

                        $scope.animationFriendListLoading_End();
                    });
                });
            }
        };

        $scope.calculateSearchFriendsCount = function (userListFireObj) {
            $scope.userSearchListDisplay = [];
            var userOnlineList = $scope.parseUserList(userListFireObj);
            $scope.userSearchListDisplay = userOnlineList;
            $scope.onLoadSearchChannelList();
        };

        $scope.calculateFriendsCount = function (userListFireObj) {
            var userOnlineList = $scope.parseUserList(userListFireObj);
            var count = userOnlineList.length;
            $scope.userTotalOnline = count == 0 ? '' : count >= 50 ? '50+' : count;
            $scope.onlineFriends = userOnlineList;
        };

        $scope.parseUserList = function (userListFireObj) {
            var userOnlineList = [];
            var userList = [];
            var keys = Object.keys(userListFireObj);
            for (var i = 0; i < keys.length; i++) {
                var item = userListFireObj[keys[i]];
                if (item.id != $scope.currentUser.id) {
                    var user = jQuery.extend(true, {}, item);
                    user.channelId = common.func.getChannelID($scope.currentUser.id, item.id);
                    user.orderNumber = 0;
                    if (user.isAdmin) {
                        user.orderNumber = 100000;
                    }
                    userList.push(user);

                    if ($.inArray(user, userOnlineList) == -1) {
                        userOnlineList.push(user);
                    }
                }
            }

            return userOnlineList;
        };

        $scope.getChannelClass = function (chann) {
            var channelClass = '';
            if (chann.channelId == $scope.currentChannelId) {
                channelClass = 'active-channel';
            }
            else if (chann.pendingMessage != '') {
                channelClass = 'pendingMsg';
            }

            return channelClass;
        };

        $scope.onConversation = function (chann) {
            if ($scope.activeChannel != null && $scope.activeChannel.channelId == chann.channelId) {
                return;
            }

            $scope.setUserJoinChatChannel($scope.activeChannel, 0);
            $scope.updateChattingChannel(chann);
            $scope.activeChannel = chann;
            $scope.activeChannel.channelId = chann.channelId;
            $scope.currentGuestUser = null;

            $('#fireChatConversation').show(300);
            chann.pendingMessage = '';
            $('[channelId="' + chann.channelId + '"]').removeClass('pendingMsg');

            // reset
            $scope.currentMessageContent = '';
            $scope.currentConversationDisplay = {
                currentChannelId: '',
                title: '',
                messages: []
            };

            // load messages
            $scope.currentConversationDisplay.title = chann.guestUserName;
            $scope.currentConversationDisplay.userId = chann.channelId.split('_')[1];
            var messageRef = new firebase.database().ref('fireChat/channel/' + $scope.activeChannel.channelId);
            messageRef.limitToLast(20).once('value', function (snapshot) {
                var val = snapshot.val();
                if (val != null) {
                    common.func.angularApply($scope, function () {
                        $scope.currentConversationDisplay.messages = common.func.parseFireObject(val);

                        setTimeout(function () {
                            $scope.slimDisplay();
                        }, 200);

                        $scope.activeChannel.current = val['current'];
                        $scope.activeChannel.newLoading = true;
                    });

                    // set user join to chat
                    $scope.setUserJoinChatChannel(chann, 1);
                }
                else {
                    // create new channel
                    var currentChannel = {};
                    currentChannel[$scope.activeChannel.userId] = {
                        isTyping: 0,
                        sendNew: 0,
                        isRead: 1,
                        isJoin: 1
                    };
                    currentChannel[$scope.activeChannel.guestId] = {
                        isTyping: 0,
                        sendNew: 0,
                        isRead: 1,
                        isJoin: 0
                    };
                    var channelListRef = new firebase.database().ref('fireChat/channel');
                    var updates = {};
                    updates[$scope.activeChannel.channelId] = { current: currentChannel };
                    channelListRef.update(updates);
                }
            });

            // off old ref firebase
            //if ($scope.activeChannelSyncMessageRef != undefined) {
            //    $scope.activeChannelSyncMessageRef.orderByChild('date').limitToLast(1).off('child_added');
            //}
            var syncMessageRef = $scope.setSyncMessageRef(chann);
            $scope.activeChannelSyncMessageRef = syncMessageRef;

            // refresh user
            $scope.refreshUserChannel();

            $scope.onSearchedUser = false;

            // reresh layout
            if (isMobile) {
                $('#btnChatAppTrigger').click();
            }
        };

        $scope.setSyncMessageRef = function (chann) {
            var syncMessageRef = {};
            var existingLiveChatting = $.grep($scope.liveChattingChannelList, function (u) {
                return u.channelId == chann.channelId;
            });
            if (common.func.isActiveObj(existingLiveChatting)) {
                syncMessageRef = existingLiveChatting[0].syncMessageRef;
                syncMessageRef.orderByChild('date').limitToLast(1).off('child_added');
            }
            else {
                syncMessageRef = new firebase.database().ref('fireChat/channel/' + chann.channelId + '/');
                $scope.liveChattingChannelList.push({
                    channelId: chann.channelId,
                    syncMessageRef: syncMessageRef
                });
            }
            syncMessageRef.orderByChild('date').limitToLast(1).on('child_added', function (childSnapshot, prevChildKey) {
                var currentLiveChannelId = $scope.getCurrentLiveChanelId(childSnapshot);
                var val = childSnapshot.val();
                // current widget
                if (currentLiveChannelId == $scope.activeChannel.channelId) {
                    if (!$scope.activeChannel.newLoading && val != null && val.content != undefined) {
                        common.func.angularApply($scope, function () {
                            var newMessage = jQuery.extend(true, {}, val);
                            $scope.currentConversationDisplay.messages.push(newMessage);

                            setTimeout(function () {
                                $scope.slimDisplay();
                            }, 200);
                        });
                    }
                    else {
                        $scope.activeChannel.newLoading = false;
                    }
                }
                else {
                    // on chatting list
                    var existinChattingChann = $.grep($scope.chattingChannelList, function (u) {
                        return u.channelId == currentLiveChannelId;
                    });

                    existinChattingChann[0].pendingMessage = val.content;
                    existinChattingChann[0].guestUserStatus = 1;
                    common.func.angularApply($scope, function () {
                        $scope.chattingChannelList = $scope.chattingChannelList;
                    });
                }
            });
            syncMessageRef.orderByChild('date').on('child_changed', function (childSnapshot, prevChildKey) {
                var currentLiveChannelId = $scope.getCurrentLiveChanelId(childSnapshot);
                var val = childSnapshot.val();
                if (!common.func.isActiveObj(val.content) && !common.func.isActiveObj(val.date)) {
                    // change state in channel.current
                    common.func.angularApply($scope, function () {
                        $scope.activeChannel.current = val;
                    });
                }
            });
            return syncMessageRef;
        };

        $scope.getCurrentLiveChanelId = function (childSnapshot) {
            try {
                return childSnapshot.ref.path.n[2];
            }
            catch (err) {
                return childSnapshot.ref.path.o[2];
            }
        };

        $scope.getMsgConversationClass = function (msg) {
            return msg.from == $scope.currentUser.id ? 'home-user' : 'guest-user';
        };

        $scope.onSendMessage = function (e) {
            if (e.keyCode === 13) {
                var content = $scope.currentMessageContent;
                if (content != '') {
                    $scope.sendMessage(content);
                    $scope.currentMessageContent = '';
                }
            }
        };

        $scope.onSearchedUser = false;
        $scope.onSearchUser = function (e) {
            var keyword = $('#inpSearchUserKeyword').val();
            if (e != undefined) { // from key up event
                if (e.keyCode === 13 && keyword != '') {
                    $scope.onSearchedUser = true;
                    $scope.onSearchFriendsWidget(keyword);
                }
            }
            else { // from text change event
                if (keyword == '' && $scope.onSearchedUser) {
                    $scope.onSearchedUser = false;
                }
            }
        };

        $scope.sendMessage = function (content) {
            var msg = {
                from: $scope.currentUser.id,
                content: content,
                date: firebase.database.ServerValue.TIMESTAMP
            };
            var messageRef = new firebase.database().ref('fireChat/channel/' + $scope.activeChannel.channelId);
            var newKey = messageRef.push().key;
            var updates = {};
            updates[newKey] = msg;
            messageRef.update(updates);
            $scope.slimDisplay();

            // notifi to guest user
            $scope.notiGuestUser();
        };

        $scope.notiGuestUser = function () {
            // check if guest not join => send noti to guest
            var activeCurrent = $scope.activeChannel.current;
            if ($scope.activeChannel.current == undefined || activeCurrent[$scope.activeChannel.guestId] == undefined || activeCurrent[$scope.activeChannel.guestId].isJoin != 1) {
                FireUserService.getCurrentUser($scope.activeChannel.guestId).then(function (val) {
                    var guestUser = val;
                    var guestCurrentChannelIds = guestUser.currentChannels;
                    if (guestCurrentChannelIds == null || guestCurrentChannelIds == undefined) {
                        guestCurrentChannelIds = [];
                    }

                    if ($.inArray($scope.activeChannel.channelId, guestCurrentChannelIds) == -1) {
                        guestCurrentChannelIds.push($scope.activeChannel.channelId);

                        var userRef = new firebase.database().ref('fireChat/users/' + guestUser.id);
                        var updates = {};
                        updates['currentChannels'] = guestCurrentChannelIds;
                        userRef.update(updates);
                    }
                });
            }
        };

        $scope.refreshUserChannel = function () {
            if ($scope.activeChannel == null || $scope.activeChannel == undefined) {
                return;
            }

            var currentChannelIds = $scope.currentUser.currentChannels;
            if (currentChannelIds == null || currentChannelIds == undefined) {
                currentChannelIds = [];
            }

            var updates = {};

            if ($.inArray($scope.activeChannel.channelId, currentChannelIds) >= 0) {
                currentChannelIds = $.grep(currentChannelIds, function (value) {
                    return value != $scope.activeChannel.channelId;
                });

                updates['currentChannels'] = currentChannelIds;
                var channelRef = new firebase.database().ref('fireChat/users/' + $scope.currentUser.id);
                channelRef.update(updates);
            }
        };

        $scope.setUserSessionChatEnd = function () {
            var updates = {};
            updates['chattingChannelId'] = $scope.activeChannel != null ? $scope.activeChannel.channelId : '';
            var channelRef = new firebase.database().ref('fireChat/users/' + $scope.currentUser.id);
            channelRef.update(updates);
        };

        $scope.getConversationClass = function () {
            var _cl = 'conversation-online';
            if ($scope.currentGuestUser != null && $scope.currentGuestUser != undefined && $scope.currentGuestUser.status == 0) {
                _cl = 'conversation-offline';
            }
            else if ($scope.activeChannel == null || $scope.activeChannel.current == undefined) {
                _cl = 'conversation-offline';
            }
            else {
                var activeCurrent = $scope.activeChannel.current;
                if (activeCurrent[$scope.activeChannel.guestId] != undefined) {
                    var activeCurrentGuest = activeCurrent[$scope.activeChannel.guestId];
                    if (activeCurrentGuest.isJoin == 0) {
                        _cl = 'conversation-offline';
                    }
                    if (activeCurrentGuest.isJoin == 2) {
                        _cl = 'conversation-away';
                    }
                }
            }

            return _cl;
        };

        $scope.getCurrentUser = function () {
            var userRef = new firebase.database().ref('fireChat/users/' + common.config.userId);
            userRef.on('value', function (snapshot) {
                var val = snapshot.val();
                if (val != null) {
                    // proccess when get user data or new user data was updated
                    // 1. proccess when new channel was active
                    val.currentChannels = common.func.convertFireObjectToArrayString(val.currentChannels);
                    $scope.scanUpdateChannels(val);

                    // 2. update current user
                    common.func.angularApply($scope, function () {
                        $scope.currentUser = val;
                    });
                }
                else {
                    // create user
                    var user = {
                        id: common.config.userId,
                        avatar: common.config.avatar,
                        name: common.config.name,
                        serialName: common.config.name.toLowerCase(),
                        status: 1, // mark online
                        currentChannels: [] // pending channel -> wait to chat
                    };
                    var userListRef = new firebase.database().ref('fireChat/users');
                    var newKey = common.config.userId;
                    var updates = {};
                    updates[newKey] = user;
                    userListRef.update(updates);
                }
            });
        };

        $scope.$on('rootscope_onGoToChatting', function (event, data) {
            $scope.onGoToChatting();
        });

        $scope.onGoToChattingChannel = function (channId) {
            var guestId = common.func.getGuestUserId($scope.currentUser.id, channId);
            $('#guestUserId_Chatting').val(guestId);
            $scope.onGoToChatting();
        };

        $scope.onGoToChatting = function () {
            var guestIdStr = $('#guestUserId_Chatting').val();
            if (common.func.isActiveObj(guestIdStr)) {
                var guestId = guestIdStr.indexOf('usr-') >= 0 ? guestIdStr : 'usr-' + guestIdStr;
                var channelId = common.func.getChannelID($scope.currentUser.id, guestId);

                var existingChannel = $('#fireChatApplication .chat__wrapper').find('li[channelId="' + channelId + '"]');
                if (common.func.isActiveObj(existingChannel)) {
                    // existing => chat
                    setTimeout(function () {
                        existingChannel.click();
                    }, 200);
                }
                else {
                    // not existing => pull channel => chat
                    var chann = new channel();
                    chann.creatChannel(guestId);
                    // get channel info
                    $scope.pullGuestUserInfo(chann).then(function () {
                        common.func.angularApply($scope, function () {
                            $scope.chattingChannelList = $scope.chattingChannelList;

                            $scope.onConversation(chann);
                        });
                    });
                    $scope.chattingChannelList.push(chann);
                }
            }
        };

        $scope.scanUpdateChannels = function (updatedUser) {
            if (!$.isEmptyObject($scope.currentUser)) {
                if (!common.func.isActiveObj($scope.currentUser.currentChannels)) {
                    $scope.currentUser.currentChannels = [];
                }
                if (!common.func.isActiveObj(updatedUser.currentChannels)) {
                    updatedUser.currentChannels = [];
                }

                if ($scope.currentUser.currentChannels.length != updatedUser.currentChannels.length && updatedUser.currentChannels.length > 0) {
                    var lastestChannelId = updatedUser.currentChannels[updatedUser.currentChannels.length - 1];
                    $scope.getOrCreateChannel(lastestChannelId).then(function (chann) {
                        // open chat widget if not channel active
                        if ($scope.activeChannel == null) {
                            $scope.onConversation(chann);
                        }
                        else {
                            $scope.updateChattingChannel(chann);
                        }
                    });
                }

            }
        };

        $scope.updateChattingChannel = function (chann) {
            var existinChattingChann = $.grep($scope.chattingChannelList, function (u) {
                return u.channelId == chann.channelId;
            });
            if (!common.func.isActiveObj(existinChattingChann)) {
                $scope.animationFriendListLoading_Start();

                var ind = jQuery.inArray(chann, $scope.pendingChannelList);
                if (ind > -1) {
                    // remove from pending channel list
                    common.func.angularApply($scope, function () {
                        $scope.pendingChannelList.splice(ind, 1);
                    });
                }
                else {
                    ind = jQuery.inArray(chann, $scope.normalChannelList);
                    if (ind > -1) {
                        // remove from normal channel list
                        common.func.angularApply($scope, function () {
                            $scope.normalChannelList.splice(ind, 1);
                        });
                    }
                    else {
                        ind = jQuery.inArray(chann, $scope.searchChannelList);
                        if (ind > -1) {
                            // remove from search channel list
                            common.func.angularApply($scope, function () {
                                $scope.searchChannelList.splice(ind, 1);
                            });
                        }
                    }
                }

                // add to chatting channel list
                common.func.angularApply($scope, function () {
                    $scope.chattingChannelList.push(chann);
                });

                $scope.animationFriendListLoading_End();
            }

            if ($scope.activeChannel != null && chann.channelId != $scope.activeChannel.channelId) {
                $scope.setSyncMessageRef(chann);
            }
        };

        $scope.getOrCreateChannel = function (channelId) {
            var deferred = $q.defer();
            // search chann from pending channel
            var chann = $.grep($scope.pendingChannelList, function (u) {
                return u.channelId == channelId;
            });
            if (!common.func.isActiveObj(chann)) {
                // search chann from normal channel
                chann = $.grep($scope.normalChannelList, function (u) {
                    return u.channelId == channelId;
                });
            }

            // todo : if still not exist => pull from firebase
            if (!common.func.isActiveObj(chann)) {
                var _cn = new channel();
                _cn.parseChannel(channelId);

                // get channel info
                $scope.pullGuestUserInfo(_cn).then(function () {
                    FireChannelService.pullChannelInfo(_cn).then(function (_cn) {
                        deferred.resolve(_cn);
                    });
                });
            }
            else {
                deferred.resolve(chann[0]);
            }

            return deferred.promise;
        };

        $scope.setUserStatus = function (status) {
            if ($scope.currentUser.id != undefined) {
                var userRef = new firebase.database().ref('fireChat/users/' + $scope.currentUser.id);
                var updates = {};
                updates['status'] = status;
                userRef.update(updates);
            }
        };

        $scope.setUserJoinChatChannel = function (chann, status) {
            if ($scope.currentUser.id != undefined && chann != null && chann != undefined) {
                var idd = $scope.currentUser.id;
                var userChannelRef = new firebase.database().ref('fireChat/channel/' + chann.channelId + '/current');
                var updates = {};
                updates['isChange'] = true;
                updates[idd] = {
                    isJoin: status,
                    isTyping: 0,
                    sendNew: 0,
                    isRead: 0
                };
                userChannelRef.update(updates);
            }
        };

        $scope.calculateUserPendingMessage = function () {
            if ($.isEmptyObject($scope.currentUser) || $scope.pendingUsersId.length > 0) {
                return;
            }

            var pendingUsersId = [];
            var pendingChannel = $scope.currentUser.currentChannels;
            if (common.func.isActiveObj(pendingChannel)) {
                for (var i = 0; i < pendingChannel.length; i++) {
                    pendingUsersId.push(common.func.getGuestUserId($scope.currentUser.id, pendingChannel[i]));
                }
                $scope.pendingUsersId = pendingUsersId;
            }
        };

        $scope.slimDisplay = function () {
            var messageContainer = $('.conversation__wrap');
            messageContainer.scrollTop(9999999999999);
        };

        $scope.defaultChat = function () {
            setTimeout(function () {
                if (($scope.activeChannel == null || $scope.activeChannel == undefined) && common.func.isActiveObj($scope.pendingChannelList)) {
                    $scope.onConversation($scope.pendingChannelList[0]);
                }
            }, 6000);
        };

        $scope.rootInit = function () {
            $scope.getCurrentUser();

            // set user online
            setTimeout(function () {
                $scope.setUserStatus(1);
                $scope.calculateUserPendingMessage();
            }, 5000);
        };

        $scope.onFireChat = function () {
            $scope.rootInit();
            $scope.onLoadFriendsWidget();
            $scope.defaultChat();

            $(document).ready(function () {
                $('.conversation__header').on('click', function () {
                    if (isMessagesPage) {
                        return;
                    }

                    $scope.refreshUserChannel();
                    // set user leave off active channel . 2 == ga away
                    $scope.setUserJoinChatChannel($scope.activeChannel, 2);
                    // off ref firebase
                    $scope.activeChannelSyncMessageRef.orderByChild('date').limitToLast(1).off('child_added');
                    $scope.activeChannelSyncMessageRef.limitToLast(1).off('child_changed');

                    $scope.activeChannel = null;
                    $scope.currentGuestUser = null;

                    $('.conversation').slideToggle(300);
                });

                // refresh after 200seconds
                setInterval(function () { $scope.onRefreshFireChat(); }, 200000);
            });

            window.onbeforeunload = function (e) {
                // set user offline
                $scope.setUserStatus(0);

                // set user leave off  all chatting channel
                var chatList = $scope.chattingChannelList;
                for (var i = 0; i < chatList.length; i++) {
                    // 0 == offline
                    $scope.setUserJoinChatChannel(chatList[i], 0);
                }

                $scope.setUserSessionChatEnd();
            };


            // hide html on page load
            $scope.isloaded = true;

            //// scrollbar
            //setTimeout(function () {
            //    $('#fireChatApplication .chat__wrapper').slimscroll({
            //        color: '#00f',
            //        size: '10px',
            //        height: 'auto'
            //    });
            //}, 1000);

        };

        $scope.onFireChat();

        $scope.onRefreshFireChat = function () {
            $scope.animationFriendListLoading_Start();

            $scope.getCurrentUser();
            $scope.calculateUserPendingMessage();
            $scope.onLoadFriendsWidget();
            $scope.defaultChat();

            setTimeout(function () {
                $scope.displayGuestUserStatus($scope.pendingChannelList);
                $scope.displayGuestUserStatus($scope.chattingChannelList);

                $scope.animationFriendListLoading_End();
            }, 1000);
        };

        $scope.animationFriendListLoading_Start = function () {
            var widget = $('#fireChatApplication').find('.chat__wrapper');
            widget.addClass('widget_friend_list_loading');
        };

        $scope.animationFriendListLoading_End = function () {
            setTimeout(function () {
                var widget = $('#fireChatApplication').find('.chat__wrapper');
                widget.removeClass('widget_friend_list_loading');
            }, 500);
        };

        $scope.displayGuestUserStatus = function (channelList) {
            var userOnlineList = $scope.onlineFriends;
            for (var i = 0; i < channelList.length; i++) {
                var userOnine = $.grep(userOnlineList, function (u) {
                    return u.id == channelList[i].guestId;
                });
                if (common.func.isActiveObj(userOnine)) {
                    channelList[i].guestUserStatus = 1;
                }
                else {
                    channelList[i].guestUserStatus = 0;
                }
            }
        };
    });