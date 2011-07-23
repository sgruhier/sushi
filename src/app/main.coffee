window.app  = {}
app.routers = {}
app.models  = {}
app.views   = {}

ApplicationRouter = require('routers/application_router').ApplicationRouter
Restaurant        = require('collections/restaurant').Restaurant
RestaurantView    = require('views/restaurant_view').RestaurantView

# app bootstrapping on document ready
$(document).ready ->
    
  app.initialize = ->
    app.models.restaurant = new Restaurant
    app.views.restaurant  = new RestaurantView(model: app.models.restaurant)
    app.routers.main      = new ApplicationRouter
    
    app.models.restaurant.fetch()
    
  app.initialize()
  Backbone.history.start()

  # iScroll settings
  scroller = new iScroll('plates')

  updateScroller= -> 
    _.defer () ->
      scroller.destroy()
      scroller = new iScroll('plates')

  app.models.restaurant.bind('add', updateScroller).bind('remove', updateScroller)
  