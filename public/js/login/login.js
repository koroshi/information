require.config({
    paths: {
        main: '/js/main'
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
