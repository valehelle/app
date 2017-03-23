# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $( ".qty" ).keyup ->
        element = "input"
        total = 0.00
        $(".qty").each (index, element) =>
            price = $(element).attr("data")
            shipping_price = $(element).attr("shipping")
            qty = $(element).val()
            sub = $(element).attr("sub")
            ship = $(element).attr("ship_id")
            subtotal = price * qty
            shipping_total = shipping_price * qty
            total = total + subtotal + shipping_total
            $("#" + sub).html(subtotal)
            $("#" + ship).html(shipping_total)

        $("#total").html(total)

    $( ".btn-number" ).click ->
        qty_id = $(this).attr("data-field")
        type = $(this).attr("data-type")
        qty = $("#receipt_productreceipt_attributes_" + qty_id + "_qty").val()
        if type == "plus"
            qty_num = parseInt( qty, 10 );
            qty_num = qty_num + 1
            $("#receipt_productreceipt_attributes_" + qty_id + "_qty").val(qty_num)
        else if type == "minus"
            qty_num = parseInt( qty, 10 );
            if(qty_num > 0)
                qty_num = qty_num - 1
                $("#receipt_productreceipt_attributes_" + qty_id + "_qty").val(qty_num)
            else
                $("#receipt_productreceipt_attributes_" + qty_id + "_qty").val(0)

        $( ".qty" ).keyup();

        


       
