define([
    'app'
], function (app) {
    app.controller('editCtrl',['$scope', '$http', '$window', editCtrl]);

    function editCtrl($scope, $http, $window, $element) {
        $scope.information = {
            _id:'',
            title : '',
            content : '',
            addedTime : '',
            status : '',
            user : {}
        };

        $scope.update = function() {
            if(!validator.validateAll('#createUserModal')) return;
            $http.put('/user', $scope.user).success(function(json) {
                var scope = $('#user').scope();

                var user = _.find(scope.users, function(item) {return item._id == $scope.user._id;});

                for(var each in $scope.user)
                    user[each] = $scope.user[each]

                $('#createUserModal').modal('hide');
            });
        }
    }
});