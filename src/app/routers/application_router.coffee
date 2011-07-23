PlateEditorView = require('views/plate_editor_view').PlateEditorView

class exports.ApplicationRouter extends Backbone.Router
  routes :
    "": "home"
    "plate/:id/edit" : "editPlate"    
    
  initialize: -> 
    app.models.restaurant.bind('all', () -> $.updateWrapperHeight($(app.views.restaurant.el)))
    
  home: ->
    # We already have home element
    if $('#home').length > 0
      $.removeCurrentSectionToRight()
    # First display
    else
      $.insertSectionFromLeft($(app.views.restaurant.render().el))
      
  editPlate: (id) ->
    # Create editor plate
    plateEditorView = new PlateEditorView model: app.models.restaurant.get(id);
    $.insertSectionFromRight($(plateEditorView.render().el))
      
