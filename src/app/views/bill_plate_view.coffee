billPlateTemplate = require('templates/bill_plate')

class exports.BillPlateView extends Backbone.View
  tagName: 'li'
  events: 
    'click .increment': 'increment'
    'click .decrement': 'decrement'

  initialize: ->
    _.bindAll(@, 'render')
    @model.bind('change', @render)
    
  render: ->
    $(@.el).html billPlateTemplate(model: @model)
    $(@.el).find('.color').css(background: '#' + @model.get('color'))
    @

  increment: ->
    @model.increment()

  decrement: ->
    @model.decrement()
  
    
    
  
