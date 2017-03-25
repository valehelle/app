// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
jQuery(document).ready(function() {
    $('#open-modal').trigger('click');
    $(".myImg").click(function(){
       var modelId = $(this).attr("modeldata");
       var count = $(this).attr("count");
        // Get the modal
        var modal = document.getElementById(modelId);

        var img = "img" + count;
        var cap = "caption" + count;
        // Get the image and insert it inside the modal - use its "alt" text as a caption
        var modalImg = document.getElementById(img);
        
        modal.style.display = "block";
        modalImg.src = this.src;


        // Get the <span> element that closes the modal
        var closeimg = "closeimg" + count
        var span = document.getElementById(closeimg);

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() { 
        modal.style.display = "none";
        }
    
    });

});
