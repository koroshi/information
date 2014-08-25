define([
    'app',
    'extension',
    'underscore',
    'pager'
], function (app) {
    app.controller('infoCtrl',['$scope', '$http', '$window', 'informationSvc', infoCtrl]);

    function infoCtrl($scope, $http, $window, informationSvc) {
        pager = new Pager(query_list.pagesize, 0, 1, query_list, showList, -1);
        pager.renderNumberStyleHtml($("#pager").get(0));
        showList({ mode: 'nums', val: 1});

        function showList() {
            pager.moveIndicator(arguments[0]);

            informationSvc.retrieve()
                .done(function(json) {
                    $scope.informations = json.result;
//                    $scope.$apply();
                    $('.listArea').show();
                    pager.setRecordCount(json.allCount);
                    pager.renderNumberStyleHtml($get("pager"));
                }).fail(function() {

                });
        }

        $scope.$on('$destroy', function() {
            console.log($scope.users.length + '..')
        });

        $scope.remove = function(scope, obj) {
            if(confirm('确认删除用户吗？')) {
                informationSvc.delete(scope.information)
                    .done(function() {
                        $scope.informations.removeAt(scope.$index)
                    }).fail(function(msg) {
                        common.popBy(obj, msg)
                    });
            }
        };

        $scope.multiRemoveInfo = function(scope, obj) {
            if($('.chkItem:checked').length == 0) return common.popBy(obj, '请选择要删除的新闻');
            var ids = [];
            $('.chkItem:checked').each(function(i, o) {
                ids.push($(o).val());
            });

            if(confirm('确认删除选中的用户吗？')) {
                informationSvc.multiDelete(ids).done(function() {
                    $scope.informations = _.reject($scope.informations, function(item) {
                        return ids.indexOf(item._id) != -1;
                    });

                    $scope.$apply();
                    $('#chkAllItems').prop('checked', false);

                }).fail(function(msg) {
                    common.popBy(obj, msg);
                });

            }
        };

        $scope.showDetail = function(scope, obj) {
            var editScope = $('#createInfoModal').scope();

            for(var each in scope.user)
                editScope.user[each] = scope.user[each]

            $('#infoModal').modal('show');
        };

        $scope.search = function(obj) {
            console.log($('#searchInput').val())
            query_list.keyword = $('#searchInput').val();
            showList({ mode: 'nums', val: 1});
        }
    }
});
