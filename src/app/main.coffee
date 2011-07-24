window.app  = {}

require('utils/iphone')
ApplicationRouter = require('routers/application_router').ApplicationRouter
Restaurant        = require('collections/restaurant').Restaurant

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.restaurant  = new Restaurant
    app.router      = new ApplicationRouter

    # Get data from storage
    app.restaurant.fetch()
    
  app.initialize()
  Backbone.history.start()
  

  