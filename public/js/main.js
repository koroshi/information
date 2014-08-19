define([], function() {
    require.config({
        baseUrl:'/js/lib',
        paths: {
            bootstrap: 'bootstrap',
            angular:'angular',
            underscore: 'underscore',
            extension:'extension',
            common: '/js/common',
            validator: 'validator',
            backbone:'backbone',
            md5:'md5'
        },
        shim:{
            'common': ['jquery', 'bootstrap'],
            'validator': ['jquery', 'common'],
            'bootstrap':['jquery'],
            'extension':['jquery']
        }
    });

    require(['bootstrap', 'extension', 'underscore','validator', 'common', 'angular'])
});

