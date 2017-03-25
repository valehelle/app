# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




jQuery ->
    url      = window.location.href;    
    hostname = $('<a>').prop('href', url).prop('hostname')
    data = $('#path').attr("data-id")
    formURL = hostname + "/view/form/" + data;
    $('#path').text("URL: " + formURL);
    $('form').on 'click', '.add_fields', (event) ->
        time = new Date().getTime()
        regexp = new RegExp($(this).data('id'),'g')
        $(this).before($(this).data('fields').replace(regexp,time))
        event.preventDefault()

    $("#copy").on "click", ->
        copyTextToClipboard(formURL)


 copyTextToClipboard = (text) ->
    textArea = document.createElement("textarea")

    textArea.style.position = 'fixed'
    textArea.style.top = 0
    textArea.style.left = 0
    textArea.style.width = '2em'
    textArea.style.height = '2em'
    textArea.style.padding = 0
    textArea.style.border = 'none'
    textArea.style.outline = 'none'
    textArea.style.boxShadow = 'none'
    textArea.style.background = 'transparent'
    textArea.value = text;
    document.body.appendChild(textArea)
    textArea.select();
    try 
        successful = document.execCommand('copy')
        msg = successful ? 'successful' : 'unsuccessful'
        alert(text + " have been copied.")
    catch err
        alert('Oops, unable to copy')
    
    document.body.removeChild(textArea)