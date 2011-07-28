billTemplate  = require('templates/bill')
Plate         = require('models/plate').Plate
BillPlateView = require('views/bill_plate_view').BillPlateView

class exports.BillView extends Backbone.View
  tagName: 'div'
  events: 
    'click #reset': 'reset'
  
  initialize: ->
    @collection.bind('change', @updateBill)    
    
  render: ->
    $(@.el).html billTemplate(collection: @collection)
    $plates = @.$("ul")

    @collection.each( (plate) ->
      view = new BillPlateView(model: plate)
      $plates.append view.render().el
    )
    @updateBill()
    
    $.setupIScroll $(@.el)
    @

  updateBill: => 
    @.$('#count em').html @collection.nbPlates()
    @.$('#total em').html @collection.price()

  reset: -> 
    if confirm("Are you sure to reset, total will be set to 0")
      @collection.invoke('set', count:0)
