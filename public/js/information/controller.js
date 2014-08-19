define([
    'app',
    'extension',
    'underscore'
], function (app) {
    app.controller('usersCtrl',['$scope', '$http', '$window', 'information', usersCtrl]);

    function usersCtrl($scope, $http, $window, information) {
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
                information.delete(scope.user)
                    .done(function() {
                        $scope.users.removeAt(scope.$index)
                    }).fail(function(msg) {
                        common.popBy(obj, msg)
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
                information.multiDelete(ids).done(function() {
                    $scope.users = _.reject($scope.users, function(item) {
                        return ids.indexOf(item._id) != -1;
                    });

                    $scope.$apply();
                    $('#chkAllItems').prop('checked', false);

                }).fail(function(msg) {
                    common.popBy(obj, msg);
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
