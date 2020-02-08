$(document).on('turbolinks:load', function() {
  
  $('[id^="follow-btn"]').on("ajax:success", function(event, data, status, xhr) {
    $(event.currentTarget).html(data);
  });
  
  $('[class^="like-btn"]').on("ajax:success", function(event, data, status, xhr) {
    $("." + event.currentTarget.className).html(data);
  });
  
});