Plate = require('models/plate').Plate

class exports.Restaurant extends Backbone.Collection
  model: Plate
  localStorage: new Store("sushi")
      
