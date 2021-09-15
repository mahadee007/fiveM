$(document).ready(function(){
    
    $(".alert").hide();
    
    window.addEventListener("message", function(event){
        if(event.data.showing == true)
        {
            $("#success").fadeIn();
            $("#success").delay(3000);
            $("#success").fadeOut();
            $('#success').text(event.data.newText);
        }
        else if(event.data.showing == false) 
        {
            $("#error").fadeIn();
            $("#error").delay(3000);
            $("#error").fadeOut();
            $('#error').text(event.data.newText);
        }
    })
});