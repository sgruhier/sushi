plateEditorTemplate = require('templates/plate_editor')

class exports.PlateEditorView extends Backbone.View
  tagName: 'section'
  className: 'current'

  initialize: ->
    
  render: ->
    $(@.el).html plateEditorTemplate(model: @model)
    @

    
  
