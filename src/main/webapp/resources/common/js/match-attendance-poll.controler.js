sportApp.controller('MatchAttendancePollController', ['$scope',  '$routeParams', 'CommonService',
    function ($scope, $routeParams, CommonService) {
        var _self = this;

        _self.listOfTimes = [];

        _self.onCreatePoll = function() {

        };

        _self.addTime = function() {
            _self.listOfTimes.push(new Date());
        };

    }]);
