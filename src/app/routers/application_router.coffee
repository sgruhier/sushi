PlateEditorView = require('views/plate_editor_view').PlateEditorView

class exports.ApplicationRouter extends Backbone.Router
  routes :
    "": "home"
    "plate/:id/edit" : "editPlate"    
    
  initialize: -> 
    app.models.restaurant.bind('all', @updateWrapperHeight)
    
  home: ->
    $('body').html app.views.restaurant.render().el

  editPlate: (id) ->
    plateEditorView = new PlateEditorView model: app.models.restaurant.get(id);
    $('body').append plateEditorView.render().el    

  setWrapperHeight: -> 
    $('.wrapper').height  window.innerHeight - 45 * 2 + "px" 

  updateWrapperHeight: => 
    hasBody = $('.wrapper').closest('body').length > 0
    if hasBody
      @setWrapperHeight()
    else
      _.defer @setWrapperHeight
      
