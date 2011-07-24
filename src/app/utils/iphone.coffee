# Slide in/out iphone animation
# Keep wrapper height
(($) ->
  scroller     = null
  windowHeight =  window.innerHeight
  
  $.insertSection= (section, options = direction: 1) ->
    current = $('body section')
    
    $('body').append section.hide()
    $.setupIScroll(section)
    if current.length == 0
      # First section in dom, no anim
      section.css(left: '0').show()
    else
      # Slide out current section 
      current.anim(translateX: "#{-options.direction}00%", 0.25, 'ease-out', slideOutCallback)
      # Slide in new section
      section.css(left: "#{options.direction}00%").show().anim(translateX: "#{-options.direction}00%", 0.25, 'ease-out')
 
  # Setup iScroll for a section if need be
  $.setupIScroll= (section = null) ->
    if scroller
      scroller.destroy() 
      scroller = null

    section ?= $('body > section')
    scrollable = section.find('.wrapper > .scrollable')[0]

    if scrollable
      setWrapperHeight(section)
      scroller = new iScroll(scrollable) 

  # Convert rgb(12,5,200) to <prefix>0c05c8
  $.hexColorFromString = (color, prefix = '') ->
    if (color.slice(0,4) == 'rgb(') 
      cols = color.slice(4, color.length - 1).split(',')
      _.inject cols, (str, color) -> 
        color = parseInt(color, 10).toString(16) 
        color = "0#{color}" if color.length == 1
        str += color
      , prefix
    else
      color

  ## PRIVATE METHODS ##
  
  # callback when slide out is done: remove slided section, update new section position
  slideOutCallback= () ->
    sections = $('body section')
    sections.first().remove()
    sections.last().css(left: '0%', '-webkit-transform' : 'none')

  # Update wrapper for iscroll
  setWrapperHeight= (element) ->
    height = windowHeight
    # Remove toolbars height
    height -= _.reduce(element.find(".toolbar"), (h, elt) -> 
      h += $(elt).height()
    , 0);
    element.find(".wrapper").height(height + "px") 
  
)(Zepto)
