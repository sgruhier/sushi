window.app  = {}

require('utils/iphone')
ApplicationRouter = require('routers/application_router').ApplicationRouter
Restaurant        = require('collections/restaurant').Restaurant
Plate             = require('models/plate').Plate
AboutView         = require('views/about_view').AboutView

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.restaurant  = new Restaurant
    app.router      = new ApplicationRouter

    # Get data from storage
    app.restaurant.fetch()
    app.restaurant.add(new Plate(price: 1)) if app.restaurant.length == 0
    
    new AboutView
    
  app.initialize()
  Backbone.history.start()
  

  