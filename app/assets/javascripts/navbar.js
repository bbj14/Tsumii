$(document).on('turbolinks:load', function() {
  
  if ($('.toppage-content').length){
    $('nav').css('backgroundColor', 'transparent');
    
    $(window).scroll(function() {
      if ($('.toppage-content').length){
        if ($(this).scrollTop() > 0) {
          $('nav').addClass('to-brown');
          $('nav').removeClass('to-none');
        } else {
          $('nav').addClass('to-none');
          $('nav').removeClass('to-brown');
        }
      };
    });
  };

});