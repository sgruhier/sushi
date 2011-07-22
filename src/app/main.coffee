window.app = {}
app.controllers = {}
app.models = {}
app.views = {}

MainController = require('controllers/main_controller').MainController
Restaurant     = require('collections/restaurant').Restaurant
RestaurantView = require('views/restaurant_view').RestaurantView

# app bootstrapping on document ready
$(document).ready ->
    
  app.initialize = ->
    app.models.restaurant = new Restaurant
    app.views.restaurant  = new RestaurantView(model: app.models.restaurant)
    app.controllers.main  = new MainController
    
    app.models.restaurant.fetch()
    
  app.initialize()
  Backbone.history.start()

  # iScroll settings
  scroller = new iScroll('plates')
  document.addEventListener('touchmove', (e) -> e.preventDefault())

  updateScroller= -> 
    _.defer () ->
      scroller.destroy()
      scroller = new iScroll('plates')

  app.models.restaurant.bind('add', updateScroller).bind('remove', updateScroller)
  