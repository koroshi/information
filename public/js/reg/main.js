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
        bootxx:'../js/reg/bootxx',
        app:'../js/reg/app'
    }
});


require(['bootxx']);