'use strict'

angular.module('theChartsApp')
  .config ($httpProvider) ->
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
  .controller 'MainCtrl', ['$scope',  'Prices', ($scope, priceApis) ->

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
            coin.name = name

            frequency = $scope.$toObservable('coins', _.isEqual)
            .map(-> coin.frequency)

            $scope.coins.push coin

            priceApis[priceFn](frequency)
            .subscribe (rate) ->
                coin.price = rate
                console.log "#{priceFn}: #{rate}"

            $scope.$createObservableFunction('clicked')
            .windowWithCount(2,1)
            .map((x) -> x.toArray())
            .subscribe (coins) ->
                names = coins.map (c) -> c.toUpperCase()
                prices = coins.map (c) -> 
                    Number currencies[c].price
                $scope.rate = "#{names[1]} per #{names[0]} = #{prices[0]/prices[1]}"
  ]
