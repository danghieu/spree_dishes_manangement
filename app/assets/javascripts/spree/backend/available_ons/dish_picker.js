$(document).ready(function() {
  'use strict';
  $("body").on("click", function(event) {
    if (!$(event.target).closest('#q').length) {
      $(".search-result").hide();
    }
  });

  $("body").on('click', '#q', function() {
    $(".search-result").hide();
    var index = $(this).parent().attr('data-id');
    $("#search-result-" + index).show();
  });

  if ($('#wrap_week_action').length > 0) {

    $("body").on('keyup', '#q', function() {
      var index = $(this).parent().attr('data-id');
      $("#search-result-" + index).show();
      var q = $(this).val();
      var index = $(this).parent().attr("data-id");
      updateSearchList(q, index);
    });

    $("body").on('click', '.product-select', function() {
      var product_id = $(this).attr('data-id');
      var data_date = $(this).parent().parent().parent().attr("data-date");
      var data_index = $(this).parent().parent().parent().attr("data-index");
      addDish(product_id, data_date, data_index);
    });
  } //end #wrap_week_action
});

function addDish(product_id, delivery_date, index) {
  Url  = Spree.routes.products_available_on_create;
  type = "post";
  data = {
      available_on: {
      product_id: product_id,
      delivery_date: delivery_date
      }
    };
  data_result = getData(Url,data,type);
  dish = data_result.products;
  var dish_image;
  if (dish.images[0] != null)
    dish_image = dish.images[0].product_url;
  else dish_image = "/assets/noimage/large.png";
  var name = ".date_" + index;
  $(name).append(
    "<div class='header' data-id=" + dish.id + " data-date=" + delivery_date + ">\
          <div class='product_delete'><a class='a-product-delete' data-id=" + dish.id + " data-date=" + delivery_date + "><span class='icon icon-delete'></span></a></div>\
         <p class='product_name'>" + dish.dish_type.name + "</p>\
        <div class='image'> <img src='" + dish_image + "'</div>\
        <p class='product_name'>" + dish.name + "</p>\
      </div>"
  );
}


function updateSearchList(q, index) {
  Url = Spree.routes.products_search;
  type= "post";
  data= {
    "q": q
  };
  result = getData(Url,data,type);
  var html = "";
  if (result == null)
    $("#search-result-" + index).html(html);
  else {
    var html = "<table class='table table-hover table-striped table-search'>";
    $.each(result.products, function(idx, dish) {
      var dish_image;
      if (dish.images[0] != null)
        dish_image = dish.images[0].product_url;
      else dish_image = "/assets/noimage/large.png";
      html += "<tr class='product-select' data-id='" + dish.id + "'>\
              <td class ='product-image'><img src='" + dish_image + "'></td>\
              <td class ='product-image'>" + dish.name + "</td>\
            </tr>";
    });
    html += " </table>";
    $("#search-result-" + index).html(html);
  }
}

function updateSearchList2(products, q, index) {
  var html = "";
  var ps = "{'products': []}";
  ps.products = [];
  ps = [];
  $.each(products.products, function(idx, dish) {
    if (dish.name.indexOf(q) > -1)
      ps = ps.push(dish);
  });
  if (products == null)
    $("#search-result-" + index).html(html);
  else {
    var html = "<table class='table table-hover table-striped table-search'>";
    $.each(products.products, function(idx, dish) {
      var dish_image;
      if (dish.images[0] != null)
        dish_image = dish.images[0].product_url;
      else dish_image = "/assets/noimage/large.png";
      html += "<tr class='product-select' data-id='" + dish.id + "'>\
              <td class ='product-image'><img src='" + dish_image + "'></td>\
              <td class ='product-image'>" + dish.name + "</td>\
            </tr>";
    });
    html += " </table>";
    $("#search-result-" + index).html(html);
  }

}