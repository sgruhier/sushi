billTemplate  = require('templates/bill')
Plate         = require('models/plate').Plate
BillPlateView = require('views/bill_plate_view').BillPlateView

class exports.BillView extends Backbone.View
  tagName: 'section'
  
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
