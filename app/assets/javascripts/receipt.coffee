# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $( ".qty" ).keyup ->
        element = "input"
        total = 0.00
        $(".qty").each (index, element) =>
            price = $(element).attr("data")
            qty = $(element).val()
            sub = $(element).attr("sub")
            subtotal = price * qty
            total = total + subtotal
            $("#" + sub).html(subtotal)
        $("#total").html(total)

       
