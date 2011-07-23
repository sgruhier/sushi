class exports.MainController extends Backbone.Router
  routes :
    "": "home"
    "plate/:id/edit" : "editPlate"    
    
  home: ->
    $('body').html app.views.restaurant.render().el

  editPlate: ->
    console.log($('body').html());