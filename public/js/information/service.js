define([
    'app',
    'validator',
    'common',
    'underscore'
], function (app) {

    app.factory('service', function() {
        return {
            validator:validator,
            common:common,
            _:_
        };
    })

});