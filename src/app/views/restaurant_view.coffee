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
    $plates.append $('<div class="clear"></div>')
    @_updateWrapperHeight()
    @
  
  add: ->
    @model.add new Plate(price: 1, color: '#F00')
      
  remove: ->
    @model.remove @model.last()
    
  # updateCount: -> 
  #   info = _.reduce(@model.models, (info, plate) -> 
  #     info.count += plate.get('count')
  #     info.price += plate.get('count') * plate.get('price')
  #     info
  #   , {count: 0, price: 0});
  #   $('#count em').html info.count
  #   $('#total em').html info.price
  # 
  _updateWrapperHeight: -> 
    @.$('#wrapper').height window.innerHeight - 45 * 2 + "px"
