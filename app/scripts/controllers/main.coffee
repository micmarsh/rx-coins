'use strict'

angular.module('theChartsApp')
  .controller 'MainCtrl', ['$scope', 'Polling', ($scope, polling) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    window.polling = polling
  ]
