class exports.Plate extends Backbone.Model
  this.colors = ["ffffff", "ffe3d2", "d5c5d8", "cccccc", "ffb7ec", "ffc683", "ccff00", "ffff00", "99ffff", "ffba00", "33cc00", "fd6e74",
                 "ff0a5b", "ff0000", "9133cc", "0d9ba0", "C3a100", "8e9500", "9f0000", "5e1d68", "333333", "0a0c52", "330000", "000000"]

  defaults:
    price: 10
    color: 'ff0000'
    currency: '€'
    count: 0
    
  localStorage: new Store("sushi")

  increment: ->
    @save(count: @get('count') + 1) 

  decrement: ->
    @save(count: @get('count') - 1) if @get('count') > 0
    
  reset: ->
    @save(count: 0) 
  
    