define([
    'app',
    'service',
], function (app) {
    app.controller('usersCtrl',['$scope', 'service', '$http', '$window', usersCtrl]);

    function usersCtrl($scope, service, $http, $window, $element) {

        $http.get('/users').success(function(json) {
            if(!json) return;// service.common.popBy('#btnReg', '未知的错误');
            if(!json.code || json.code == 'fail')  return; //service.common.popBy('#btnReg', json.result);
            $scope.users = json.result;
        })

        $scope.$on('$destroy', function() {
            console.log(arguments[0] + '..')
            console.log($scope.users.length + '..')
        })

        $scope.remove = function(scope) {
            console.log(typeof common)

            $scope.users = _($scope.users).without(scope.user);

        }
    }
});
