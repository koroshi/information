define([
    'app',
    'underscore'
], function (app) {
    app.controller('usersCtrl',['$scope', '$http', '$window', usersCtrl]);

    function usersCtrl($scope, $http, $window, $element) {
        $http.get('/users').success(function(json) {
            if(!json) return;
            if(!json.code || json.code == 'fail')  return;
            $scope.users = json.result;
        });

        $scope.$on('$destroy', function() {
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
        };

        $scope.removeUsers = function(scope, obj) {
            if($('.chkItem:checked').length == 0) return common.popBy(obj, '请选择要删除的用户');
            var ids = [];
            $('.chkItem:checked').each(function(i, o) {
                ids.push($(o).val());
            });

            if(confirm('确认删除选中的用户吗？')) {
                $.ajax({
                    type: "DELETE",
                    url: "/users",
                    data: JSON.stringify(ids),
                    contentType: "application/json; charset=utf-8"
                }).success(function (json) {
                    if (!json) return common.popBy(obj, '未知的错误');
                    if (!json.code || json.code == 'fail') return common.popBy(obj, json.result);

                    $scope.users = _.reject($scope.users, function(item) {
                        return ids.indexOf(item._id) != -1;
                    });

                    $scope.$apply();
                });
            }
        };

        $scope.showEditModal = function(scope, obj) {
            var editScope = $('#createUserModal').scope();

            for(var each in scope.user)
                editScope.user[each] = scope.user[each]

            $('#createUserModal').modal('show');
        }
    }
});
