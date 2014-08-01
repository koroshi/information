//require(['angular', function() {
//    console.log(typeof angular)
//    angular.module('myApp', []);
//
//    var regCtrl = function($scope, $element) {
//        $scope.user = {
//            name : '',
//            password : '',
//            confirm : '',
//            email : '',
//            phone : '',
//            address : ''
//        };
//
//        $scope.register = function() {
//            //if(!validator.bindAll('#registArea'))
//            console.log($scope.user.email + '.............')
//        }
//    };
//}]);

//angular.module('myApp', []);
//
//var regCtrl = function($scope, $element) {
//    $scope.user = {
//        name : '',
//        password : '',
//        confirm : '',
//        email : '',
//        phone : '',
//        address : ''
//    };
//
//    $scope.register = function() {
////        console.log(typeof validator)
////        if(!validator.bindAll('#registArea'))
//        console.log($scope.user.email + '.............')
//    }
//};
//
//angular.module('myApp.services', []).
//    factory('validator', function() {
//        console.log(typeof validator + '================');
//    });
//
//
//angular.bootstrap(document.documentElement, ['xxxxxxx']);



//define(['angular'], function (ng) {
//      'use strict';
//       ng.controller('regCtrl', function($scope) {
//           console.log('...........')
//       });
//   });

define(['app'],function(app){
    app.controller("regCtrl",function($scope){
        console.log('.......')
    })
})