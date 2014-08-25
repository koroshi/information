
require.config({
    baseUrl:'/js/lib',
    paths: {
        main: '/js/main',
        app: '/js/reg/app',
        service: '/js/reg/service',
        controller: '/js/reg/controller'
    }
});

define(["main", 'app',  'service', 'controller'], function() {
    require(['validator', 'md5'], function() {
        validator.bind();
        angular.element(document).ready(function() {
            angular.bootstrap(document, ['myApp']);
        });
    });
});
