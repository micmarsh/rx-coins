'use strict'

describe 'Service: Prices', () ->

  # load the service's module
  beforeEach module 'theChartsApp'

  # instantiate service
  Prices = {}
  beforeEach inject (_Prices_) ->
    Prices = _Prices_

  it 'should do something', () ->
    expect(!!Prices).toBe true
