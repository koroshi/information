define([
    'app',
    'validator',
    'common'
], function (app) {

    app.factory('service', function() {
        return {
            validator:validator,
            common:common
        };
    })

});