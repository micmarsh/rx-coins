'use strict'

angular.module('theChartsApp')
  .service 'Prices', [ '$http', 'rx', ($http, rx) ->

    multiPluck = (keys) -> (object) ->
        if keys.length <= 0
            return object
        else
            [head, tail...] = keys
            multiPluck(tail)(object[head])

    makeTicker = ({observable, url, parse}) ->
        observable
        .map(Number)
        .filter((x) -> x > 0)
        .flatMapLatest (seconds) ->
            millis = seconds * 1000
            rx.Observable.interval millis
        .flatMap ->
            promise = $http.get(url)
            rx.Observable.fromPromise(promise)
            .pluck 'data'
        .map multiPluck parse


    btcPrice: (rateObservable) ->
        makeTicker
            observable: rateObservable
            url: 'https://api.coindesk.com/v1/bpi/currentprice.json'
            parse: ['bpi', 'USD', 'rate']

    ltcPrice: (rateObservable) ->
        makeTicker
            observable: rateObservable
            url: 'http://demo-qznajz.webscript.io/script'
            parse: ['ticker', 'last']

    dogePrice: (rateObservable) ->
        makeTicker
            observable: rateObservable
            url: 'https://www.dogeapi.com/wow/v2/?a=get_current_price'
            parse: ['data', 'amount']


  ]
    
