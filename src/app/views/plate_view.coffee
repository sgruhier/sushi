plateTemplate = require('templates/plate')

class exports.PlateView extends Backbone.View
  tag: 'div'
  className: 'plate'
  events: 
    'tap': 'increment'

  initialize: ->
    _.bindAll(@, 'render')
    $(@.el).addSwipeEvents()
    @model.bind('change', @render)
    
  render: ->
    $(@.el).html plateTemplate(model: @model)
    color = @model.get('color')
    $(@.el).css(background: color, 'box-shadow': "1px 1px 5px #{color}")
    @

  increment: ->
    @model.increment()
    # Force refresh !!!! (iphone only bug, may be due to iScroll?)
    $(@.el).hide().show()
    
  
