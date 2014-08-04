define([
    'app',
    'service',
], function (app) {
    app.controller('usersCtrl',['$scope', 'service', '$http', '$window', usersCtrl]);

    function usersCtrl($scope, service, $http, $window, $element) {
        $http.get('/users').success(function(json) {
            if(!json) return;// common.popBy('#btnReg', '未知的错误');
            if(!json.code || json.code == 'fail')  return; //common.popBy('#btnReg', json.result);
            $scope.users = json.result;
        })

        $scope.$on('$destroy', function() {
            console.log(arguments[0] + '..')
            console.log($scope.users.length + '..')
        });

        $scope.remove = function(scope, obj) {
            if(confirm('确认删除用户吗？')) {
                $http.delete('/user/' + scope.user._id).success(function (json) {
                    if (!json) return common.popBy(obj, '未知的错误');
                    if (!json.code || json.code == 'fail') return common.popBy(obj, json.result);
                    $scope.users.removeAt(scope.$index)
                });
            }
        }

        $scope.removeUsers = function(scope, obj) {
            if($('.chkItem:checked').length == 0) return common.popBy(obj, '请选择要删除的用户');
            var ids = [];
            $('.chkItem:checked').each(function(i, o) {
                ids.push($(o).val())
            });
            if(confirm('确认删除选中的用户吗？')) {
                $http.delete('/users',{data:ids}).success(function (json) {
                    if (!json) return common.popBy(obj, '未知的错误');
                    if (!json.code || json.code == 'fail') return common.popBy(obj, json.result);
                    $scope.users.removeAt(scope.$index)
                });
            }
        }
    }
});
