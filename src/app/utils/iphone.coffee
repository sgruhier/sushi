# Slide in/out iphone animation
# Keep wrapper height
(($) ->
  scroller     = null
  windowHeight =  window.innerHeight

  # Set perspective origin to window center
  $(document).ready -> $('body').css("-webkit-perspective-origin" : "50% " + window.innerHeight/2 + "px")
  
  $.insertContent= (content, options = direction: 1) ->
    current = $('body > div')
    
    $('body').append content.css(left: '-100%')
    $.setupIScroll(content)
    if current.length == 0
      # First content in dom, no anim
      content.css(left: '0')
    else
      # Slide out current content 
      current.anim(translateX: "#{-options.direction}00%", 0.25, 'ease-out', slideOutCallback)
      # Slide in new content
      content.css(left: "#{options.direction}00%").anim(translateX: "#{-options.direction}00%", 0.25, 'ease-out')
 
  # Setup iScroll for a content if need be
  $.setupIScroll= (element = null) ->
    if scroller
      scroller.destroy() 
      scroller = null

    element ?= $('body > div')
    scrollable = element.find('.wrapper > .scrollable')[0]

    if scrollable
      setWrapperHeight(element)
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
  
  # callback when slide out is done: remove slided content, update new content position
  slideOutCallback= () ->
    contents = $('body').children()
    contents.first().remove()
    contents.last().css(left: '0%', '-webkit-transform' : 'none')

  # Update wrapper for iscroll
  setWrapperHeight= (element) ->
    height = windowHeight
    # Remove toolbars height
    height -= _.reduce(element.find(".toolbar"), (h, elt) -> 
      h += $(elt).height()
    , 0);
    element.find(".wrapper").height(height + "px") 
  
)(Zepto)
