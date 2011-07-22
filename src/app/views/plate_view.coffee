plateTemplate = require('templates/plate')

class exports.PlateView extends Backbone.View
  tagName: 'li'
  className: 'arrow'
  events: 
    'click': 'edit'

  initialize: ->
    _.bindAll(@, 'render')
    @model.bind('change', @render)
    
  render: ->
    $(@.el).html plateTemplate(model: @model)
    color = @model.get('color')
    $(@.el).find('.color').css(background: color)
    @

  edit: ->
     
    
  
