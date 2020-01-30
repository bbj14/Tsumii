$(document).on('turbolinks:load', function() {
  
  $('[id^="follow-btn"]').on("ajax:success", (e) => {
    $(e.currentTarget).html(e.detail[2].response);
  });
  
  $('[class^="like-btn"]').on("ajax:success", (e) => {
    $("." + e.currentTarget.className).html(e.detail[2].response);
  });
  
});