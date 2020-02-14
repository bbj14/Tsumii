$(document).on('turbolinks:load', function() {
  
  /*
  $('[id^="follow-btn"]').on("ajax:success", function(event, data, status, xhr) {
    let state = $(event.currentTarget).find('.btn').val();
    
    if ($(event.currentTarget).parents('.modal').length == 0) {
      if (state=="フォロー中") {
        let count = $('.follower-count').text();
        count--;
        $('.follower-count').text(count);
      }
      if (state=="フォローする") {
        let count = $('.follower-count').text();
        count++;
        $('.follower-count').text(count);
      }
    }
    
    $(event.currentTarget).html(data);
  });
  */
  
  $('[class^="like-btn"]').on("ajax:success", function(event, data, status, xhr) {
    $("." + event.currentTarget.className).html(data);
    
    if ( $('h2').text().indexOf("マイページ") >= 0 ) {
      const i = $(event.currentTarget).find('i')
      if ( i.is("[style= color: red;]") ) {
        let count = $('.likes-counter').text();
        count++;
        $('.likes-counter').text(count);
      }
      if ( i.is("[style= color: white;]") ) {
        let count = $('.likes-counter').text();
        count--;
        $('.likes-counter').text(count);
      }
    }
  });
  
});