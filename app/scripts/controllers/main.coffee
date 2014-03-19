'use strict'

angular.module('theChartsApp')
  .config ($httpProvider) ->
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    console.log $httpProvider.defaults
  .controller 'MainCtrl', ['$scope',    '$http', 'rx', ($scope,     $http, rx) ->

    COINDESK = "https://api.coindesk.com/v1/bpi/currentprice.json"

    $scope.btcPollFrequency = 5

    $scope.$toObservable('btcPollFrequency')
    .map ({oldValue, newValue}) ->
        Number newValue
    .filter((x) -> x > 0)
    .flatMapLatest (seconds) ->
        millis = seconds * 1000
        rx.Observable.interval millis
    .flatMap ->
        price = $http.get(COINDESK)
        rx.Observable.fromPromise price
    .subscribe (yo) ->
        console.log yo

  ]
