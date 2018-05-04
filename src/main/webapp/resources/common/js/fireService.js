var channel = function () {
    this.userId = common.config.userId;
    this.guestId = '';
    this.channelId = '';
    this.guestUserName = '';
    this.guestUserStatus = 0;
    this.guestAvatar = '';
    this.pendingMessage = '';
    this.teamName = '';

    this.creatChannel = function (guestId) {
        this.guestId = guestId;
        this.channelId = common.func.getChannelID(this.userId, this.guestId);
    };

    this.parseChannel = function (channelId) {
        this.channelId = channelId;
        this.guestId = common.func.getGuestUserId(this.userId, channelId);
    };
};

/// <reference path="common.js" />
sportApp.service('FireCommonService', ['$q', '$http', '$timeout',
     function ($q, $http, $timeout) {

     }])
.filter('unsafe', function ($sce) {
    return function (val) {
        return $sce.trustAsHtml(val);
    };
})
.service('FireUserService', ['$q', '$http', '$timeout',
     function ($q, $http, $timeout) {
         var getCurrentUser = function (userId) {
             var deferred = $q.defer();
             var userRef = new firebase.database().ref('fireChat/users/' + userId);
             userRef.once('value', function (snapshot) {
                 var val = snapshot.val();
                 if (val != null) {
                     deferred.resolve(val, userId);
                 }
             });

             return deferred.promise;
         };
         var searchUserAvaible = function () {
             var deferred = $q.defer();
             var usresRef = {};
             usresRef = new firebase.database().ref('fireChat/users').orderByChild('status').equalTo(1);
             usresRef.limitToLast(50).once('value', function (snapshot) {
                 var val = snapshot.val();
                 deferred.resolve(val);
             });
             return deferred.promise;
         };
         var searchUsers = function (key) {
             var deferred = $q.defer();
             var usresRef = new firebase.database().ref('fireChat/users').orderByChild('serialName').startAt(key).endAt(key + '\uf8ff');
             usresRef.limitToLast(50).once('value', function (snapshot) {
                 var val = snapshot.val();
                 deferred.resolve(val);
             });
             return deferred.promise;
         };
         var pullChanneluserInfo = function (chann) {
             var deferred = $q.defer();
             var userRef = new firebase.database().ref('fireChat/users/' + chann.guestId);
             userRef.once('value', function (snapshot) {
                 var val = snapshot.val();
                 if (val != null) {
                     chann.guestUserName = val.name;
                     chann.guestAvatar = val.avatar;
                     chann.guestUserStatus = val.status;
                     chann.teamName = val.teamName;
                     deferred.resolve(chann);
                 }
             });
             return deferred.promise;
         };

         return {
             getCurrentUser: getCurrentUser,
             searchUserAvaible: searchUserAvaible,
             searchUsers: searchUsers,
             pullChanneluserInfo: pullChanneluserInfo,
         };
     }])
.service('FireChannelService', ['$q', '$http', '$timeout',
     function ($q, $http, $timeout) {
         var pullChannelInfo = function (chann) {
             var deferred = $q.defer();
             var messageRef = new firebase.database().ref('fireChat/channel/' + chann.channelId);
             messageRef.limitToLast(2).once('value', function (snapshot) {
                 var val = snapshot.val();
                 if (val != null) {
                     var objList = common.func.parseFireObject(val);
                     if (objList.length == 2) {
                         chann.pendingMessage = objList[0].content;
                         deferred.resolve(chann);
                     }
                 }
             });

             return deferred.promise;
         };

         return {
             pullChannelInfo: pullChannelInfo,
         };
     }]);
