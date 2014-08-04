define([
    'app',
    'service',
], function (app) {
    app.controller('editCtrl',['$scope', 'service', '$http', '$window', editCtrl]);

    function editCtrl($scope, service, $http, $window, $element) {
        $scope.user = {
            name : 'XXX',
            password : '',
            confirm : 'AAA',
            email : 'XXX',
            phone : 'xxx',
            address : 'xxx'
        };
    }
});