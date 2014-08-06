define([
    'app',
], function (app) {
    app.controller('regCtrl',['$scope', '$http', '$window', regCtrl]);

    function regCtrl($scope, $http, $window) {
        $scope.user = {
            name : '',
            password : '',
            confirm : '',
            email : '',
            phone : '',
            address : ''
        };

        $scope.register = function() {
            if(!validator.validateAll('#registArea')) return;
            $scope.user.password = hex_md5($scope.user.password);
            $http.post('/user', $scope.user).success(function(json) {
                if(!json) return common.popBy('#btnReg', '未知的错误');
                if(!json.code || json.code == 'fail')  return common.popBy('#btnReg', json.result);
                $window.location.href = "/";

            })
        }
    }
});
