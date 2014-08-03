define([], function() {
    require.config({
        baseUrl:'lib',
        paths: {
            jquery: 'jquery',
            bootstrap: 'bootstrap',
            angular:'angular',
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

//    require(['jquery', 'bootstrap'], function() {
//        console.log('load complete')
//    })
})

