$(document).on('turbolinks:load', function() {

  $('[data-toggle="tooltip"]').tooltip()

  $('.move:visible').each(function(index, element) {
    const movenum = index + 1;
    $(element).find($('.move-num')).val(movenum);
    $(element).find('span').text(movenum + '手目：');
  });
  
  $(document).on('fields_added.nested_form_fields fields_removed.nested_form_fields', function() {
    $('.move:visible').each(function(index, element) {
      const movenum = index + 1;
      $(element).find($('.move-num')).val(movenum);
      $(element).find('span').text(movenum + '手目：');
    });
  });
  
  /*
  $('.number-of-move').change(function() {
    
    const elmHtml = $(".move").prop('outerHTML');
    const movesnum = $('.number-of-move').val();
    
    $('.moves').empty();

    for (var i = 0; i<movesnum; i++) {
      $('.moves').append(elmHtml);
    }
  });
  */
  
});