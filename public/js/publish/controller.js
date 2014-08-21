define([
    'app',
    'extension',
    'underscore'
], function (app) {
    app.controller('publishCtrl', ['$scope', '$window', 'publishSvc', publishCtrl]);

    function publishCtrl($scope, $window, publishSvc) {
        $scope.information = {
            title : '',
            content : '',
            user:$.cookie('id')
        };
        $scope.createInformation = function(obj) {
            if(!$scope.information.user) common.popBy(obj, '请登录后在发表文章');
            if(!validator.validateAll('#user')) return;
            publishSvc.create($scope.information).done(function() {
                window.location.href = '/'
            }).fail(function(msg) {
                common.popBy(obj, msg);
            })
        }
    }
});