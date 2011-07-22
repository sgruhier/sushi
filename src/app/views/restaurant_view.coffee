restaurantTemplate = require('templates/restaurant')
Restaurant         = require('collections/restaurant').Restaurant
PlateView          = require('views/plate_view').PlateView

class exports.RestaurantView extends Backbone.View
  tagName: 'section'
  className: 'current'
  
  events: 
    'click #reset': 'reset'
  
  initialize: -> 
    @restaurant = new Restaurant
    _.bindAll(@, 'updateCount')
    @restaurant.bind('change', @updateCount)
    @
    
  render: ->
    $(@.el).html restaurantTemplate()
    $plates = @.$("#plates")

    @restaurant.each( (plate) ->
      view = new PlateView(model: plate)
      $plates.append view.render().el
    )
    $plates.append $('<div class="clear"></div>')
    @_updateWrapperHeight()
    @
  
  reset: ->
    if confirm("Are you sure to reset, total will be set to 0")
      @restaurant.invoke('set', count:0)
      
  updateCount: -> 
    info = _.reduce(@restaurant.models, (info, plate) -> 
      info.count += plate.get('count')
      info.price += plate.get('count') * plate.get('price')
      info
    , {count: 0, price: 0});
    $('#count em').html info.count
    $('#total em').html info.price

  _updateWrapperHeight: -> 
    @.$('#wrapper').height window.innerHeight - 45 * 2 + "px"
