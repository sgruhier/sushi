plateEditorTemplate = require('templates/plate_editor')

class exports.PlateEditorView extends Backbone.View
  tagName: 'section'
    
  render: ->
    $(@.el).html plateEditorTemplate(model: @model)
    @

    
  
