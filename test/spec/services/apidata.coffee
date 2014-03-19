'use strict'

describe 'Service: Apidata', () ->

  # load the service's module
  beforeEach module 'theChartsApp'

  # instantiate service
  Apidata = {}
  beforeEach inject (_Apidata_) ->
    Apidata = _Apidata_

  it 'should do something', () ->
    expect(!!Apidata).toBe true
