define([
    'app'
], function (app) {
    app.controller('loginCtrl',['$scope', '$http', '$window', loginCtrl]);

    function loginCtrl($scope, $http, $window) {
        $scope.user = {
            name : '',
            password : ''
        };

        $scope.login = function(obj) {
            if(!validator.validateAll()) return;
            $scope.user.password = hex_md5($scope.user.password);
            $http.post('/login', $scope.user).success(function(json) {
                if(!json) return common.popBy(obj, '未知的错误');
                if(!json.code || json.code == 'fail')  return common.popBy(obj, json.result);
                $window.location.href = "/";

            })
        }

        $window.document.onkeydown = function(e) {
            var e = e || window.event;
            if(e.keyCode == 13) $scope.login();
        }
    }
});
