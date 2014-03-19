'use strict'

angular.module('theChartsApp')
  .config ($httpProvider) ->
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    console.log $httpProvider.defaults
  .controller 'MainCtrl', ['$scope',  'Prices', ($scope, prices) ->

    currencies = 
        'btc': 
            image: "https://bitcoin.org/img/opengraph.png"
            defaultText: 'Bitcoin'
        'ltc':
            image:"http://cryptocur.com/wp-content/uploads/2012/11/new_litecoin_logo_large.png"
            defaultText: 'Litecoin'
        'doge':
            image: "http://foundation.dogecoin.com/img/300coin.png"
            defaultText: 'Such Crypto'

    $scope.currencies = []
    for currency, info of currencies
        do (currencies, info) ->
            frequency = currency + 'PollFrequency'
            price = currency + 'Price'
            {image, defaultText} = info
            $scope.currencies.push {
                frequency
                image
                price
            }
            
            $scope[price] = defaultText
            $scope[frequency] = 5

            frequencyObs = $scope.$toObservable frequency
            prices[price](frequencyObs)
            .subscribe (rate) ->
                $scope[price] = rate
                console.log "#{price}: #{rate}"

  ]
