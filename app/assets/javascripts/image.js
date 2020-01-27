$(document).on('turbolinks:load', function() {
  
  $(function() {
    function readURL(input) {
     if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
         $('#work_image_prev').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
     }
    }
    $("#work_image").change(function(){
     readURL(this);
    });
  });

  $(function() {
    function readURL(input) {
     if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
         $('#user_image_prev').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
     }
    }
    $("#user_image").change(function(){
     readURL(this);
    });
  });

});