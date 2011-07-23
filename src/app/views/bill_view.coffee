billTemplate = require('templates/bill')
Plate        = require('models/plate').Plate

class exports.BillView extends Backbone.View
  tagName: 'section'
    
  render: ->
    $(@.el).html billTemplate(model: @model)
    @
