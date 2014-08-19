define([
    'app'
], function (app) {
    count = 0;
    app.filter('roleFilter', function() {
        var role = {
            normal:'普通用户',
            vip:'VIP用户',
            admin:'管理员'
        };
        return function(input) {
            return role[input];
        }
    });

    app.filter('searchFilter',function(){
        return function(items, keyword){
            if(!keyword) return items;
            return _.filter(items, function(item) {
                return item.name.indexOf(keyword) >-1 || item.email.indexOf(keyword) > -1;
            });
        }
    });

});