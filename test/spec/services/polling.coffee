'use strict'

describe 'Service: Polling', () ->

  # load the service's module
  beforeEach module 'theChartsApp'

  # instantiate service
  Polling = {}
  beforeEach inject (_Polling_) ->
    Polling = _Polling_

  it 'should do something', () ->
    expect(!!Polling).toBe true
