'use strict'

angular.module('theChartsApp')
  .config ($httpProvider) ->
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
  .controller 'MainCtrl', ['$scope',  'Prices', ($scope, prices) ->

    currencies = 
        'btc': 
            image: "https://bitcoin.org/img/opengraph.png"
            price: 'Bitcoin'
        'ltc':
            image:"http://cryptocur.com/wp-content/uploads/2012/11/new_litecoin_logo_large.png"
            price: 'Litecoin'
        'doge':
            image: "http://foundation.dogecoin.com/img/300coin.png"
            price: 'Such Crypto'

    $scope.coins = []

    for name, coin of currencies
        do (name, coin) ->
            priceFn = "#{name}Price" 

            coin.frequency = 5

            frequency = $scope.$toObservable('coins', _.isEqual)
            .map((x) -> "nigga #{x}"; x)
            .map(-> coin.frequency)
            # .subscribe (rate) ->
            #     coin.price = rate
            #     console.log "yo: #{rate}"

            $scope.coins.push coin

            prices[priceFn](frequency)
            .subscribe (rate) ->
                coin.price = rate
                console.log "#{priceFn}: #{rate}"

  ]
