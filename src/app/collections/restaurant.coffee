Plate = require('models/plate').Plate

class exports.Restaurant extends Backbone.Collection
  model: Plate

  localStorage: new Store("sushi")
  
  initialize: () -> 
    # To test add a bunch of 6 different plates
    @add new Plate(price: 1, color: '#F00')
    @add new Plate(price: 2, color: '#0F0')
    @add new Plate(price: 3, color: '#00F')
    @add new Plate(price: 4, color: '#F0F')
    @add new Plate(price: 5, color: '#FF0')
    @add new Plate(price: 6, color: '#0FF')
    
