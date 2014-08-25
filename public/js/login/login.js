require.config({
    baseUrl:'/js/lib',
        paths: {
            main: '/js/main',
            app: '/js/login/app',
            service: '/js/login/service',
            controller: '/js/login/controller'
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
