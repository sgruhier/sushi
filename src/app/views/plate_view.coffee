plateTemplate = require('templates/plate')

class exports.PlateView extends Backbone.View
  tagName: 'li'
  events: 
    'tap': 'increment'

  initialize: ->
    _.bindAll(@, 'render')
    $(@.el).addSwipeEvents()
    @model.bind('change', @render)
    
  render: ->
    $(@.el).html plateTemplate(model: @model)
    color = @model.get('color')
    $(@.el).find('.color').css(background: color)
    @

  increment: ->
    @model.increment()
    # Force refresh !!!! (iphone only bug, may be due to iScroll?)
    # $(@.el).hide().show()
    
  
