require.config({
    baseUrl:'/js/lib',
    paths: {
        main: '/js/main',
        app: '/js/publish/app',
        service: '/js/publish/service',
        controller: '/js/publish/controller'
    }
});

define(["main", 'app',  'service', 'controller'], function() {
    require(['validator'], function() {
        validator.bind();
        angular.element(document).ready(function() {
            angular.bootstrap(document, ['myApp']);
        });
    });
});
