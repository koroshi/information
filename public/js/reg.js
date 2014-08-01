require.config({
    baseUrl:'lib',
    paths: {
        common: 'common',
        jquery: 'jquery',
        md5: 'md5',
        validator: 'validator',
        bootstrap: 'bootstrap',
        angular:'angular'
    }
});

require(['jquery', 'angular', 'bootstrap', 'common', 'validator'], function() {
    validator.bind('#registArea');
    angular.module('regApp', function($scope) {
        $scope.user ={
            name:''
        }
    })
});