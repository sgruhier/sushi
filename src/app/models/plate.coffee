class exports.Plate extends Backbone.Model
  defaults:
    price: 10
    color: '#F00'
    currency: '€'
    count: 0
  localStorage: new Store("sushi")

  increment: ->
    @set(count: @get('count') + 1) 

  decrement: ->
    @set(count: @get('count') - 1) 

  reset: ->
    @set(count: 0) 
    