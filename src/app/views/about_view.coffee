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
    about.css opacity: 0
    about.anim({rotateY: '-90deg', scale: 0.8}, 0.4, 'linear', () ->
      about.css opacity: 0.5
      about.anim({rotateY: '0deg', scale: 1, opacity: 1}, 0.4, 'linear')
    )
    section.anim({rotateY: '90deg', scale: 0.8, opacity: 0.5}, 0.4, 'linear', () ->
      section.css opacity: 0
      section.anim({rotateY: '180deg', scale: 1,}, 0.4, 'linear')
    )

  hide: => 
    section = $('body > section').first()

    $('body > section').removeClass('flip')
    about = $("#about_panel")
    about.anim({rotateY: '-90deg', scale: 0.8, opacity: 0.5}, 0.4, 'linear', () ->
      about.css opacity: 0
      about.remove()
    )
    section.anim({rotateY: '90deg', scale: 0.8}, 0.4, 'linear', () ->
      section.css opacity: 0.5
      section.anim({rotateY: '0deg', scale: 1, opacity: 1}, 0.4, 'linear')
    )
    $.setupIScroll section
    