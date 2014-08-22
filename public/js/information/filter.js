define([
    'app',
    'moment'
], function (app) {
    app.filter('dateFilter', function() {
        return function(input) {
            return  moment(input).format('YYYY-MM-DD HH:mm:ss');
        }
    });
});