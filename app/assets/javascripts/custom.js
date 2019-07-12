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



$( document ).on('turbolinks:load', function() {



  //display current year on footer
  $('#year').text(new Date().getFullYear());

  // redirect from home_page search bar to the proper controller
  $('#main_select').closest('form').attr('action', '/offers');

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
    var category_helper = $("#category_helper")
    category_helper.html("<small>Things such as: &nbsp;</small> ");
    switch(category){
      case "Fuels":
        category_helper.append("Coal, Pellets, Gassoline, Crude Oils, Gas, Petroleum, Diesel Fuel, Biodiesel, Briquette");
        break;
      case "Services":
        category_helper.append("Programing or Graphic Agencies, Consulting, Telemarketing, Outsourcing, Freelancing");
        break;
      case "Cosmetics / Body Care":
        category_helper.append("Soaps, Shampoos, Toothpastes, Conditioners, Shower Gels, Powders, Deodorants, Lipsticks, Makeup Kits, Hair Dyes");
        break;
      case "Groceries / Food":
        category_helper.append("Beverages, Pasta, Rice, Fruits, Vegetables, Spices, Meat, Coffe, Sugar, Milk, Fishes, Canned Food, Salt ");
        break;
      case "Mechanic Devices and Parts":
        category_helper.append("Factory Machines, Engines, Pump, Tools, Auto Parts, Motors, Tractors, Combines, Construction Machines, Tires");
        break;
      case "Basic Necessities":
        category_helper.append("Bandages, Diapers, Plasters, Condoms, Hydrogen Peroxide, Vitamins, Infant Formulas");
        break;
      case "Electronics":
        category_helper.append("TVs, Computers, Cameras, Washers, Fridges, Home Theater Sets, Hair Dryers, Video Game Consoles, Tablets, Pendrives, Mobile Phones, Electronic Parts");
        break;
      case "Clothers / Textiles":
        category_helper.append("T-shirts, Jeans, Coats, Sunglasses, Caps, Jackets, Shoes, Fabrics, Wool, Silk, Fibers, Dyes, Cashmere, Underwear, Protective Clothing");
        break;
      case "Agriculture":
        category_helper.append("Seeds, Fertilizers, Insecticides, Cattle, Cattle Feed, Suplements for animals, Seedlings");
        break;
      case "Industrial Goods":
        category_helper.append("Steel, Metal Ores, Raw Materials, Timber");
        break;
      case "Construction Materials":
        category_helper.append("Bricks, Cement, Cables, Paints, Pipes, Concrete, Electrical Installations, Reinforcing Bars");
        break;
      case "Office/Packaging Products":
        category_helper.append("Paper Sheets, Office Chairs, Desks, Tables, Pens, PencilsCardboards, Notebooks, Crayons, Binders, Boxes, Bags");
        break;
      case "Home Products":
        category_helper.append("Furnitures, Books, Towels, Carpets, Bedding, Pillows, Candles, Dishes, Detergents");
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



})
