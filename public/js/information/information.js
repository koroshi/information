require.config({
    baseUrl:'/js/lib',
    paths: {
        main: '/js/main',
        app: '/js/information/app',
        service: '/js/information/service',
        controller: '/js/information/controller',
        filter: '/js/information/filter',
        editCtrl: '/js/information/editCtrl'
    }
});

define(["main", 'app',  'service', 'controller', 'filter', 'editCtrl'], function() {

//    showUserList({ mode: 'nums', val: 1 });
    require(['validator'], function() {
        validator.bind();
        angular.element(document).ready(function() {
            angular.bootstrap(document, ['myApp']);
        });
    });
});
