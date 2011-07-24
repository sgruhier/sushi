Plate = require('models/plate').Plate

class exports.Restaurant extends Backbone.Collection
  model: Plate
  localStorage: new Store("sushi")
      
  price: ->
    _.reduce(@models, (price, plate) -> 
      price += plate.get('count') * plate.get('price') 
    , 0)
    
  nbPlates: ->
    _.reduce(@models, (nbPlates, plate) -> 
      nbPlates += plate.get('count')
    , 0)
    
