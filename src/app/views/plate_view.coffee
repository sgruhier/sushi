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
    $(@.el).find('.color').css(background: @model.get('color'))
    @

  edit: ->
    Backbone.history.navigate("plate/" + @model.id + "/edit", true)
    
  
