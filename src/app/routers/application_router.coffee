PlateEditorView = require('views/plate_editor_view').PlateEditorView
BillView        = require('views/bill_view').BillView

class exports.ApplicationRouter extends Backbone.Router
  routes :
    ""               : "home"
    "plate/:id/edit" : "editPlate"    
    "bill"           : "bill"
    
  initialize: -> 
    app.models.restaurant.bind('all', () -> $.updateWrapperHeight($(app.views.restaurant.el)))
    
  home: ->
    # We already have a "home" element
    if $('#home').length > 0
      $.removeCurrentSectionToRight()
    # First display
    else
      $.insertSectionFromLeft($(app.views.restaurant.render().el))
      
  editPlate: (id) ->
    plateEditorView = new PlateEditorView model: app.models.restaurant.get(id);
    $.insertSectionFromRight($(plateEditorView.render().el))
      
  bill: () ->
    billView = new BillView model: app.models.restaurant;
    $.insertSectionFromRight($(billView.render().el))
    
