'use strict'

describe 'Service: Yo', () ->

  # load the service's module
  beforeEach module 'theChartsApp'

  # instantiate service
  Yo = {}
  beforeEach inject (_Yo_) ->
    Yo = _Yo_

  it 'should do something', () ->
    expect(!!Yo).toBe true
