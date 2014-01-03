
Problems = require('../src/problems').Problems

describe 'problems', ->
  beforeEach ->
    @prob = new Problems

  it 'problem 1', ->
    num = (new Problems()).problem1()
    expect(num).toBe 233168