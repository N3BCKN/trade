$(document).ready(function(){

  $('#year').text(new Date().getFullYear());

  // examples of products for selected categories on add lead pages
$("#lead_category_id").on('change',function(selectObject){
    var category = $("option:selected", this).text();
    switch(category){
      case "Fuels":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Raw Materials":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Cosmetics / Body Care":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Groceries / Food":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Mechanic Devices and Parts":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Basic Necessities":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Electronics":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Clothers / Textiles":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Agriculture":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Industrial Goods":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Construction Materials":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
      case "Office/Packaging Products":
        $("#category_helper").text("Here are examples of products for category " + category);
        break;
    }
  });

});
  
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

