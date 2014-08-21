define([
    'app'
], function (app) {

    app.factory('informationSvc',['$http', function($http) {
        return {
            delete: function(information) {
                var def = $.Deferred();
                var promise = def.promise();
                $http.delete('/information/' + information._id).success(function (json) {
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
                    url: "/informations",
                    data: JSON.stringify(ids),
                    contentType: "application/json; charset=utf-8"
                }).success(function (json) {
                    if (!json) return def.reject('未知的错误');
                    if (!json.code || json.code == 'fail')  return def.reject(json.result);
                    def.resolve();
                });

                return promise;
            },

            retrieve: function() {
                var def = $.Deferred();
                var promise = def.promise();

                $http.get('/informations').success(function(json) {
                    if (!json) return def.reject('未知的错误');
                    if (!json.code || json.code == 'fail')  return def.reject(json.result);
                    def.resolve(json.result);
                })

                return promise;
            }
        };
    }])

});