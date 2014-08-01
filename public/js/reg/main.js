require.config({
    baseUrl:'lib',
    paths: {
        jquery: 'jquery',
        bootstrap: 'bootstrap',
        angular:'angular',
        extension:'extension',
        common: '../js/common',
        validator: 'validator',
        backbone:'backbone',
        md5:'md5',
        controller:'../js/reg/controller',
        directive:'../js/reg/directive',
        service:'../js/reg/service',
        app:'../js/reg/app'
    },
    shim:{
        'common': ['jquery', 'bootstrap'],
        'validator': ['jquery', 'common']
    }
});


require(['jquery', 'common', 'bootstrap', 'extension', 'app',  'service', 'controller', 'validator'], function() {
    validator.bind();
//    angular.bootstrap(document, ['myApp']);
    angular.element(document).ready(function() {
        angular.bootstrap(document, ['myApp']);
    });
});