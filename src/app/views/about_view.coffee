aboutTemplate      = require('templates/about')

# Just a regular class as it's not a standard backview behavior
class exports.AboutView 
  
  constructor: -> 
    $('#about').live('click', @show)
    $('#close_about').live('click', @hide)
    
  show: => 
    section = $('body > section')
    
    $('body').append aboutTemplate()
    about = $("#about_panel")
    $.setupIScroll about
    about.height(section.height() + "px").width(section.width() + "px")

    $('body > section').addClass('flip')
    about.anim({rotateY: '-90deg', scale: 0.8}, 0.15, 'linear', () ->
      about.anim({rotateY: '0deg', scale: 1}, 0.15, 'linear')
    )
    section.anim({rotateY: '90deg', scale: 0.8}, 0.15, 'linear', () ->
      section.anim({rotateY: '180deg', scale: 1}, 0.15, 'linear')
    )

  hide: => 
    section = $('body > section').first()

    $('body > section').removeClass('flip')
    about = $("#about_panel")
    about.anim({rotateY: '-90deg', scale: 0.8}, 0.15, 'linear', () ->
     about.remove()
    )
    section.anim({rotateY: '90deg', scale: 0.8}, 0.15, 'linear', () ->
      section.anim({rotateY: '0deg', scale: 1}, 0.15, 'linear')
    )
    