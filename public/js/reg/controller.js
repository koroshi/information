define([
    'app',
    'service'
], function (app) {
    app.controller('regCtrl',['$scope', 'validator', function($scope, validator) {
        $scope.user = {
            name : '',
            password : '',
            confirm : '',
            email : '',
            phone : '',
            address : ''
        };
        $scope.register = function() {
            if(!validator.validateAll('#registArea'))
            console.log($scope.user.email + '.............')
        }
    }])
});
