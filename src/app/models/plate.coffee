class exports.Plate extends Backbone.Model
  this.colors = ["ff0000", "ffff00", "330000", "ffffff", "000000", "ffb7ec", "33cc00", "ffc683", "ff0a5b", "0a0c52", "9133cc", "99ffff", 
                 "ccff00", "cccccc", "333333", "ffba00", "ffe3d2", "d5c5d8", "c3a100", "5e1d68", "0d9ba0", "fd6e74", "8e9500", "9f0000"]
  defaults:
    price: 10
    color: '00ff00'
    currency: '€'
    count: 0
    
  localStorage: new Store("sushi")

  increment: ->
    @save(count: @get('count') + 1) 

  decrement: ->
    @save(count: @get('count') - 1) if @get('count') > 0
    
  reset: ->
    @save(count: 0) 
  
    