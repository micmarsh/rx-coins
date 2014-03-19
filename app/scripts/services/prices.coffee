'use strict'

angular.module('theChartsApp')
  .service 'Prices', [ '$http', 'rx', ($http, rx) ->

    makeTicker = ({observable, url, parse}) ->
        observable.map ({oldValue, newValue}) ->
            Number newValue
        .filter((x) -> x > 0)
        .flatMapLatest (seconds) ->
            millis = seconds * 1000
            rx.Observable.interval millis
        .flatMap ->
            promise = $http.get(url)
            rx.Observable.fromPromise(promise).pluck 'data'
        .map (body) ->
            for key in parse
                body = body[key]
            return body



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

    dogePrice: (rateObservable) -> rx.Observable.return '999'


  ]
    
