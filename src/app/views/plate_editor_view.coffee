plateEditorTemplate = require('templates/plate_editor')

class exports.PlateEditorView extends Backbone.View

  initialize: ->
    _.bindAll(@, 'render')
    @model.bind('change', @render)
    
  render: ->
    $(@.el).html plateEditorTemplate(model: @model)
    @

    
  
