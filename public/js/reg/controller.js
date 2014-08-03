define([
    'app',
    'service',
], function (app) {
    app.controller('regCtrl',['$scope', 'service', '$http', '$window', regCtrl]);

    function regCtrl($scope, service, $http, $window) {
        $scope.user = {
            name : '',
            password : '',
            confirm : '',
            email : '',
            phone : '',
            address : ''
        };

        $scope.register = function() {
            if(!service.validator.validateAll('#registArea')) return;
            $http.post('/user', $scope.user).success(function(json) {
                if(!json) return service.common.popBy('#btnReg', '未知的错误');
                if(!json.code || json.code == 'fail')  return service.common.popBy('#btnReg', json.result);
                $window.location.href = "/";

            })
        }
    }
});
