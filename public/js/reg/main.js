require.config({
    baseUrl:'lib',
    paths: {
        jquery: 'jquery',
        angular:'angular',
        common: 'common',
        validator: 'validator',
        bootstrap: 'bootstrap',
        backbone:'backbone',
        md5:'md5',
        controller:'../js/reg/controller',
        directive:'../js/reg/directive',
        service:'../js/reg/service',
        app:'../js/reg/app'
    },
    shim:{
        'validator': ['jquery', 'common']
    }
});


require(['jquery', 'common', 'bootstrap','app',  'service', 'controller', 'validator'], function() {
    validator.bind();
//    angular.bootstrap(document, ['myApp']);
    angular.element(document).ready(function() {
        angular.bootstrap(document, ['myApp']);
    });
});