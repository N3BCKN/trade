$( document ).on('turbolinks:load', function() {

  //display current year on footer
  $('#year').text(new Date().getFullYear());

  // redirect from home_page search bar to the proper controller
  $('#main_select').on('change',function(){
    if ($(this).val() == 'products'){
      $(this).closest('form').attr('action', '/products');
    }
    else{
      $(this).closest('form').attr('action', '/offers');
    }
  });

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


  var menuHeight = $('#menu').outerHeight();
  // Fixed Sidebar

  $('.has-sidebar>*').theiaStickySidebar({
    additionalMarginTop: menuHeight + 30,
    additionalMarginBottom:30,
    minWidth: 767,
  });

  
   
   // Initiate select2 plugin
   
  function initiateSelect2() {
    $( ".ui-select:visible" ).selectric({
      //minimumResultsForSearch: Infinity,
      //dropdownCssClass: "animated fadeIn"
    }
    );  
    $('.ui-select-s:visible').selectric();  
  }
   initiateSelect2();
  $( window ).resize(function() {
    initiateSelect2();
  });
  $('.modal').on('shown.bs.modal', function (e) {
    initiateSelect2();
  })
  
  // Initiate Tooltops
  
  $('[data-toggle="tooltip"]').tooltip({container: 'body'});
  
  // Initiate AOS animations
  
  AOS.init({
    offset: 50
  });
  
  
  $('#menu-content').on('show.bs.collapse', function () {
    var menu = $('#menu');
    if(menu.hasClass('navbar-over')) {
      menu.removeClass('navbar-over');
      $(window).resize(function() {
        if ($(window).width() > 992) {
          menu.addClass('navbar-over');
        } else {
          if(menu.find('.navbar-collapse').hasClass('show')) {
            menu.removeClass('navbar-over');
          }
        }
      });
      $('#menu-content').on('hide.bs.collapse', function () {
        $('#menu').addClass('navbar-over');
      })
    }
  });

$(window).ready(function(e) {
  if ($('#content').length > 0) {
    function menuAdjustments() {
      var menu = $('#menu'),
        menuHeight = menu.outerHeight() + 15;
        
      if ($(window).width() > 767) {
        var scrollTop = $(this).scrollTop(),
        topDistance = $('#content').offset().top;   
          
          
        if ( (topDistance) < scrollTop ) {
          if((menu.hasClass('navbar-over')) || (menu.hasClass('absolute-top'))) {
            menu.addClass('fixed-top animated fadeInDown').removeClass('absolute-top');
          } else {
            $('body').css({'margin-top':menuHeight}).find(menu).addClass('fixed-top animated fadeInDown');
          }
        } else if ( scrollTop == 0 ) {
          if(menu.hasClass('navbar-over')) {
            menu.addClass('absolute-top').removeClass('fixed-top animated fadeInDown');
          } else {
            $('body').css({'margin-top':0}).find(menu).removeClass('fixed-top animated fadeInDown');
          }
        }
      }
    }
    $(window).on('scroll', function() {
      menuAdjustments();
    });
    $(document).resize(function() {
      var menu = $('#menu');
      if($(document).width() < 768) {
        if((menu.hasClass('navbar-over')) || (menu.hasClass('absolute-top'))) {
          menu.addClass('absolute-top').removeClass('fixed-top animated fadeInDown');
        } else {
          $('body').css({'margin-top':0}).find(menu).removeClass('fixed-top animated fadeInDown');
        }
      }
    });
  }
  
  $(document).scroll(function() {
    var btnTop = $('#to-top');
    if ($(document).scrollTop() >= 50) {
      btnTop.css({'visibility': 'visible', 'opacity' : '1'});
    } else {
      btnTop.css({'visibility': 'hidden', 'opacity' : '0'});
    }
  });


  
  $('#to-top').on('click', function() {
    $('html').animate({ scrollTop: 0 }, "slow");
  });
  
  $('.close-panel').on('click', function() {
    $.sidr('close', 'sidebar');
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

})
