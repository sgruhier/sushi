PlateEditorView = require('views/plate_editor_view').PlateEditorView
BillView        = require('views/bill_view').BillView
RestaurantView  = require('views/restaurant_view').RestaurantView

class exports.ApplicationRouter extends Backbone.Router
  routes :
    ""               : "home"
    "plate/:id/edit" : "editPlate"    
    "bill"           : "bill"
        
  home: ->
    restaurantView = new RestaurantView(collection: app.restaurant)
    $.insertSection($(restaurantView.render().el), direction: -1)
      
  editPlate: (id) ->
    plateEditorView = new PlateEditorView model: app.restaurant.get(id)
    $.insertSection($(plateEditorView.render().el))
      
  bill: () ->
    billView = new BillView collection: app.restaurant
    $.insertSection($(billView.render().el))
    
