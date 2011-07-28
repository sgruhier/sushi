aboutTemplate      = require('templates/about')

# Just a regular class as it's not a standard backview behavior
class exports.AboutView 
  
  constructor: -> 
    $('#about').live('click', @show)
    $('#close_about').live('click', @hide)
    
  show: => 
    content = $('body > div')
    
    $('body').append aboutTemplate()
    about = $("#about_panel")
    $.setupIScroll about
    about.height(content.height() + "px").width(content.width() + "px")

    $('body > div').addClass('flip')
    about.css opacity: 0
    about.anim({rotateY: '-90deg', scale: 0.8}, 0.4, 'linear', () ->
      about.css opacity: 0.5
      about.anim({rotateY: '0deg', scale: 1, opacity: 1}, 0.4, 'linear')
    )
    content.anim({rotateY: '90deg', scale: 0.8, opacity: 0.5}, 0.4, 'linear', () ->
      content.css opacity: 0
      content.anim({rotateY: '180deg', scale: 1,}, 0.4, 'linear')
    )

  hide: => 
    content = $('body > div').first()

    $('body > div').removeClass('flip')
    about = $("#about_panel")
    about.anim({rotateY: '-90deg', scale: 0.8, opacity: 0.5}, 0.4, 'linear', () ->
      about.css opacity: 0
      about.remove()
    )
    content.anim({rotateY: '90deg', scale: 0.8}, 0.4, 'linear', () ->
      content.css opacity: 0.5
      content.anim({rotateY: '0deg', scale: 1, opacity: 1}, 0.4, 'linear')
    )
    $.setupIScroll section
    