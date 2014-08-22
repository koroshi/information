require.config({
    paths: {
        main: '/js/main'
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
