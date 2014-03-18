'use strict'

angular.module('theChartsApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'rx'
])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
  ]
