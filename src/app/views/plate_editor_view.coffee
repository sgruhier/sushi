plateEditorTemplate = require('templates/plate_editor')
Plate               = require('models/plate').Plate


class exports.PlateEditorView extends Backbone.View
  tagName: 'div'
  events: 
    'change input.price': 'updatePrice'
    'click span.color': 'updateColor'
    
  render: ->
    $(@.el).html plateEditorTemplate(model: @model, colors: Plate.colors)
    @

  updatePrice: (event) ->
    price = parseFloat(event.target.value)
    @model.save(price: price)
  
  updateColor: (event) ->
    @.$('.color').removeClass('selected')
    $(event.target).addClass('selected')
    
    @model.save(color: $.hexColorFromString($(event.target).css('background')))
