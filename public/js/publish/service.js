define([
    'app'
], function (app) {

    app.factory('publishSvc', ['$http', function($http) {
        return {
            create:function(information) {
                var def = $.Deferred();
                var promise = def.promise();
                $http.post('/information', information).success(function(json) {
                    if(!json || json.code == 'fail') return def.reject(json ? json.result : '未知的错误');
                    def.resolve(json.result);
                });

                return promise;
            }
        };
    }])

});