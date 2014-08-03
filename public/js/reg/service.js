define([
    'app',
    'validator',
    'common'
], function (app) {

    app.factory('validator', function() {
        return validator;
    })
    .factory('common', function() {
        return common;
    })

});