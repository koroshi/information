define([
    'app'
], function (app) {
    app.controller('editCtrl',['$scope', '$http', '$window', 'userSvc', editCtrl]);

    function editCtrl($scope, $http, $window, userSvc) {
        $scope.user = {
            _id:'',
            name : '',
            password : '',
            confirm : '',
            email : '',
            phone : '',
            address : ''
        };

        $scope.update = function() {
            if(!validator.validateAll('#createUserModal')) return;
            userSvc.update($scope.user).done(function() {
                var scope = $('#user').scope();
                var user = _.find(scope.users, function(item) {return item._id == $scope.user._id;});

                for(var each in $scope.user)
                    user[each] = $scope.user[each]

                $('#createUserModal').modal('hide');
            }).fail(function() {

            });

        }
    }
});