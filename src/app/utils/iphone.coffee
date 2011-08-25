# Add-on to zepto.js for easier iphone UI development
# Slide in/out iphone animation
# Flip back/frony
# Support for iScroller if available
# Convert color rgb(r,g,b,a) to hex

(($) ->
  scroller     = null
  windowHeight =  window.innerHeight || 460
  scale        = 0.8

  # Set perspective origin to window center
  $('body').bind('touchmove', (e) -> e.preventDefault())
  $(document).ready -> $('body').css("-webkit-perspective-origin" : "50% " + windowHeight/2 + "px")
  
  $.insertContent= (content, options = direction: 1) ->
    current = $('body > div:first-child')    
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
 
  $.flip= (content) ->
    $('body').append content
    front = $('body > div:first-child')
    back  = $('body > div:last-child')
    $.setupIScroll back

    # Update back size
    back.height(front.height() + "px").width(front.width() + "px")

    $('body > div').addClass('flip')
    back.css opacity: 0
    back.anim({rotateY: '-90deg', scale: scale}, 0.4, 'ease-in', () ->
      back.anim({rotateY: '0deg', scale: 1, opacity: 1}, 0.4, 'ease-out')
    )
    front.anim({rotateY: '90deg', scale: scale, opacity: 0}, 0.4, 'ease-in', () ->
      front.anim({rotateY: '180deg', scale: 1,}, 0.4, 'ease-out')
    )
  
  $.flipBack= () ->
    back  = $('body > div:first-child')
    front = $('body > div:last-child')

    $('body > div').removeClass('flip')
    front.anim({rotateY: '-90deg', scale: scale, opacity: 0}, 0.4, 'ease-in', () ->
      front.remove()
    )
    back.anim({rotateY: '90deg', scale: scale}, 0.4, 'ease-in', () ->
      back.css opacity: 0
      back.anim({rotateY: '0deg', scale: 1, opacity: 1}, 0.4, 'ease-out')
    )
    $.setupIScroll back
    
   # Setup iScroll for a content if need be and if available
   $.setupIScroll= (element = null) ->
     return if typeof iScroll == "undefined"
     if scroller
       scroller.destroy() 
       scroller = null
  
     element ?= $('body > div:first-child')
  
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
