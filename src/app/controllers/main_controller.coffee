
class exports.MainController extends Backbone.Router
  routes :
    "": "home"

  initialize: ->
    
  home: ->
    $('body').html app.views.restaurant.render().el
