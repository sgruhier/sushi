restaurantTemplate = require('templates/restaurant')
PlateView          = require('views/plate_view').PlateView
Plate              = require('models/plate').Plate

class exports.RestaurantView extends Backbone.View
  tagName: 'section'
  className: 'current'
  
  events: 
    'click #add': 'add'
    'click #remove': 'remove'
  
  initialize: -> 
    _.bindAll(@, 'render')
    @model.bind('all', @render)
    @
    
  render: ->
    $(@.el).html restaurantTemplate()
    $plates = @.$("#plates")

    @model.each( (plate) ->
      view = new PlateView(model: plate)
      $plates.append view.render().el
    )
    @_updateWrapperHeight()
    @
  
  add: ->
    @model.create(price: 1, color: '#F00')
     
  remove: ->
    last = @model.last()
    @model.remove last
    console.log("de");
    last.destroy()
    
  _updateWrapperHeight: -> 
    @.$('#wrapper').height window.innerHeight - 45 * 2 + "px"
