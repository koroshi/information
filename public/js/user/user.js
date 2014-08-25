require.config({
    baseUrl:'/js/lib',
    paths: {
        main: '/js/main',
        app: '/js/user/app',
        service: '/js/user/service',
        controller: '/js/user/controller',
        filter: '/js/user/filter',
        editCtrl: '/js/user/editCtrl'
    }
});

define(['main', 'app',  'service', 'controller', 'filter', 'editCtrl'], function() {
    require(['validator'], function() {
        validator.bind();
        angular.element(document).ready(function() {
            angular.bootstrap(document, ['myApp']);
        });
    });
});
