PlateEditorView = require('views/plate_editor_view').PlateEditorView

class exports.ApplicationRouter extends Backbone.Router
  routes :
    "": "home"
    "plate/:id/edit" : "editPlate"    
    
  initialize: -> 
    app.models.restaurant.bind('all', @updateWrapperHeight)
    
  home: ->
    # We already have home element
    if $('#home').length > 0
      current = $('body section.current')
      current.removeClass('current').anim({ translateX: '100%'}, 0.25, 'ease-out', () -> current.remove())
      $('#home').addClass('current').anim({ translateX: '0%'}, 0.25, 'ease-out')
    # First display
    else
      element = $(app.views.restaurant.render().el)
      $('body').html element
      element.addClass('current').css('-webkit-transform': 'translateX(0)')
      @updateWrapperHeight()
      
  editPlate: (id) ->
    # Create editor plate
    plateEditorView = new PlateEditorView model: app.models.restaurant.get(id);
    # Slide out current section
    current = $('body section.current')
    current.removeClass('current').anim({ translateX: '-100%'}, 0.25, 'ease-out')
    
    # Slide in new section
    newSection = $(plateEditorView.render().el)
    @updateWrapperHeight(true)
    $('body').append newSection
    newSection.addClass('current').css(left: '100%').anim({ translateX: '-100%'}, 0.25, 'ease-out')

  setWrapperHeight: -> 
    _.map $('.wrapper'), (element) -> $(element).height(window.innerHeight - 45 * 2 + "px") 

  updateWrapperHeight: (forceDefer = false) =>
    hasBody = $('.wrapper').closest('body').length > 0
    if !forceDefer && hasBody
      @setWrapperHeight()
    else
      _.defer @setWrapperHeight
      
