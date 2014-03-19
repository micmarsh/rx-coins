'use strict'

angular.module('theChartsApp')
  .config ($httpProvider) ->
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    console.log $httpProvider.defaults
  .controller 'MainCtrl', ['$scope',  'Prices', ($scope, prices) ->

    $scope.btcPollFrequency = 5

    btcFrequency = $scope.$toObservable('btcPollFrequency')
   
    prices.btcPrice(btcFrequency) 
    .subscribe (yo) ->
        $scope.btcPrice = yo
        console.log yo

  ]
