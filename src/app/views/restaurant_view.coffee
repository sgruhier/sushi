restaurantTemplate = require('templates/restaurant')
PlateView          = require('views/plate_view').PlateView
Plate              = require('models/plate').Plate

class exports.RestaurantView extends Backbone.View
  tagName: 'section'
  id: 'home'
  
  events: 
    'click #add': 'add'
    'click #remove': 'remove'
    'click #bill': 'bill'
  
  initialize: -> 
    _.bindAll(@, 'render')
    @collection.bind('add', @render).bind('remove', @render)
    @
    
  render: ->
    $(@.el).html restaurantTemplate()
    $plates = @.$("ul")

    @collection.each( (plate) ->
      view = new PlateView(model: plate)
      $plates.append view.render().el
    )
    $.setupIScroll $(@.el)
    @
  
  add: ->
    @collection.create(color: Plate.colors[@collection.length], price: @collection.length + 1)
     
  remove: ->
    last = @collection.last()
    @collection.remove last
    last.destroy()
  
  bill: ->
    Backbone.history.navigate("bill", true)
    