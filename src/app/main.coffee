window.app = {}
app.controllers = {}
app.models = {}
app.collections = {}
app.views = {}

MainController = require('controllers/main_controller').MainController
RestaurantView = require('views/restaurant_view').RestaurantView

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.controllers.main = new MainController()
    app.views.home = new RestaurantView()

  app.initialize()
  Backbone.history.start()

  # iScroll settings
  new iScroll('plates')
	document.addEventListener('touchmove', (e) -> e.preventDefault())
  