# Slide in/out iphone animation
# Keep wrapper height
(($) ->
  scroller = null
  
  $.insertSectionFromRight= (section) ->
    # Slide out current section if exsists
    current = $('body section.current')
  
    # Slide in new section
    $.updateWrapperHeight(section, true)
    $('body').append section.addClass("current")
    if current.length == 0
      section.css(left: '0')
    else
      current.removeClass('current').anim(translateX: '-100%', 0.25, 'ease-out')
      section.css(left: '100%').anim(translateX: '-100%', 0.25, 'ease-out', () -> $.setupIScroll() )
 
   $.insertSectionFromLeft= (section, removeCurrent = true) ->
     # Slide out current section if exsists
     current = $('body section.current')
 
     # Slide in new section
     $.updateWrapperHeight(section, true)
     $('body').append section
     if current.length == 0
       section.addClass("current").css(left: '0%')
     else
       current.removeClass('current').anim(translateX: '100%', 0.25, 'ease-out', () -> current.remove() if removeCurrent)
       section.addClass("current").css(left: '-100%').anim(translateX: '100%', 0.25, 'ease-out', () -> $.setupIScroll())

  $.removeCurrentSectionToRight= () ->
    current = $('body section.current')
    current.prev().addClass('current').anim(translateX: '0%', 0.25, 'ease-out', () -> $.setupIScroll())
    current.removeClass('current').css(left: '100%').anim(translateX: '0%', 0.25, 'ease-out', () -> current.remove())
  
  setWrapperHeight= (element) ->
    element = $(element)
    height = window.innerHeight
    
    # Remove toolbars height
    height -= _.reduce(element.find(".toolbar"), (h, elt) -> 
      h += $(elt).height()
    , 0);
    element.find(".wrapper").height(height + "px") 
  
  $.updateWrapperHeight= (element, defer = false) ->
    # Defer if requested or if the element isn't in body yet
    if defer || element.closest('body').length == 0
      _.defer setWrapperHeight, element
    else
      setWrapperHeight(element)
  
  $.setupIScroll= -> 
    _.defer () ->
      console.log("se");
      scroller.destroy() if scroller
      scrollable = $('section.current .wrapper .scrollable')[0]
      scroller = null
      scroller = new iScroll(scrollable) if scrollable

)(Zepto)
