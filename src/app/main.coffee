window.app  = {}
app.routers = {}
app.models  = {}
app.views   = {}

require('utils/iphone')
ApplicationRouter = require('routers/application_router').ApplicationRouter
Restaurant        = require('collections/restaurant').Restaurant
RestaurantView    = require('views/restaurant_view').RestaurantView


# app bootstrapping on document ready
$(document).ready ->
  

  app.initialize = ->
    app.models.restaurant = new Restaurant
    app.views.restaurant  = new RestaurantView(model: app.models.restaurant)
    app.routers.main      = new ApplicationRouter
    # Get data from storage
    app.models.restaurant.fetch()
    
  app.initialize()
  Backbone.history.start()
  
  $.setupIScroll()
  app.models.restaurant.bind('add', $.setupIScroll).bind('remove', $.setupIScroll)
  # document.addEventListener('touchmove', (e) -> e.preventDefault())

  