$(document).ready(function(){

  $('#year').text(new Date().getFullYear());

  //image preview placeholder
  function readURL(input,width,height) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function (e) {
        $('#img_prev')
        .attr('src', e.target.result)
        .width(width)
        .height(height);
      };

      reader.readAsDataURL(input.files[0]);
     }
  }

});