define([
    'app'
], function (app) {

    app.factory('userSvc', ['$http', function($http) {
        return {
            delete: function(user) {
                var def = $.Deferred();
                var promise = def.promise();
                $http.delete('/user/' + user._id).success(function (json) {
                    if (!json) return def.reject('未知的错误');
                    if (!json.code || json.code == 'fail') return def.reject(json.result);
                    def.resolve();
                });

                return promise;
            },

            multiDelete: function(ids) {
                var def = $.Deferred();
                var promise = def.promise();

                $.ajax({
                    type: "DELETE",
                    url: "/users",
                    data: JSON.stringify(ids),
                    contentType: "application/json; charset=utf-8"
                }).success(function (json) {
                    if (!json) return def.reject('未知的错误');
                    if (!json.code || json.code == 'fail')  return def.reject(json.result);
                    def.resolve();
                });

                return promise;
            },

            update: function(user) {
                var def = $.Deferred();
                var promise = def.promise();
                $http.put('/user', user).success(function(json) {
                    if(!json || json.code == 'fail') return def.reject(json?json.result:'未知的错误');
                    def.resolve(json.result);
                });

                return promise;
            },

            retrieve:function() {
                var def = $.Deferred();
                var promise = def.promise();
                $http.get('/users').success(function(json) {
                    if(!json) return def.reject('未知的错误');
                    if(!json.code || json.code == 'fail')  return def.reject(json.result);
                    def.resolve(json.result);
                });

                return promise;
            }
        };
    }])

});