aboutTemplate      = require('templates/about')

# Just a regular class as it's not a standard backview behavior
class exports.AboutView 
  
  constructor: -> 
    $('#about').live('click', @show)
    $('#close_about').live('click', @hide)
    
  show: => 
    $.flip aboutTemplate()

  hide: => 
    $.flipBack()
        