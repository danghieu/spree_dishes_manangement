$(document).ready(function () {
  'use strict';
  $("body").on("click", function (event) {
      if(!$(event.target).closest('#q').length)
      {
        $(".search-result").hide();
      }
      
  });
  $("body").on('click', '#q', function()
    {   
      $(".search-result").hide();
      var index = $(this).parent().attr('data-id');
      $("#search-result-"+index).show();
    });

  if ($('#wrap_week_action').length>0){
    var products = getAllDishes();
    console.log(products);
    

    

  	$("body").on('keyup', '#q', function()
  	{	  
        var index = $(this).parent().attr('data-id');
        $("#search-result-"+index).show();
        var q =$(this).val();
  			var index = $(this).parent().attr("data-id");
        updateSearchList(q,index);
    });

  	$("body").on('click', '.product-select', function()
  	{	  
  			var product_id =$(this).attr('data-id');
  			var data_date = $(this).parent().parent().parent().attr("data-date");
  			var data_index = $(this).parent().parent().parent().attr("data-index");
       	addDish(product_id,data_date,data_index); 
    });
  }//end #wrap_week_action
});

function addDish(product_id,delivery_date,index) {
  Url = Spree.routes.products_available_on_create;
  $.ajax(
  {
    url: Url,
    type: "post",
    data: 
    {
      token: Spree.api_key,
      available_on:{product_id:product_id,
        delivery_date:delivery_date}
        
    },
    success: function(data_result)
    {
    	console.log(data_result.products);
    	dish = data_result.products
        var dish_image ;
          if(dish.images[0]!=null)
          dish_image=dish.images[0].product_url;
          else dish_image="/assets/noimage/large.png";
        var name = ".date_"+index;
        $(name).append(
          "<div class='header' data-id="+dish.id+" data-date="+delivery_date+">\
              <div class='product_delete'><a class='a-product-delete' data-id="+dish.id+" data-date="+delivery_date+"><span class='icon icon-delete'></span></a></div>\
             <p class='product_name'>" +dish.dish_type + "</p>\
            <div class='image'> <img src='"+ dish_image +"'</div>\
            <p class='product_name'>"+dish.name+"</p>\
          </div>"
        );
      
    },
    error: function(result)
    {
    	if(result.responseText != null){
    		var a = JSON.parse(result.responseText);
        if(a !=null)
    		  alert(a[0].messages);
    	}
    	
    }
  });
}
function getAllDishes(){
  Url = Spree.routes.products_get_all;
  var dataResult=false;
  $.ajax(
  {
    url: Url,
    type: "get",
    async: false,
    data: 
    {
      token: Spree.api_key
    },
    success: function(result)
    {
      dataResult=result;
    },
    error: function(result)
    {
        alert(result);
    }    
  });
  return dataResult;
}

function updateSearchList(q,index) {
  Url = Spree.routes.products_search;
  $.ajax(
  {
    url: Url,
    type: "post",
    async: false,
    data: 
    {
      token: Spree.api_key,
        "q":q
    },
    success: function(result)
    {
      var html ="";
      if(result==null)
        $("#search-result-"+index).html(html);
      else
      {

        var html ="<table class='table table-hover table-striped table-search'>";
        $.each(result.products, function(idx,dish) {
          var dish_image ;
          if(dish.images[0]!=null)
          dish_image=dish.images[0].product_url;
          else dish_image="/assets/noimage/large.png";
        html += "<tr class='product-select' data-id='"+dish.id+"'>\
                  <td class ='product-image'><img src='"+ dish_image +"'></td>\
                  <td class ='product-image'>"+dish.name+"</td>\
                </tr>";
        });
        html += " </table>" ;
        $("#search-result-"+index).html(html);
      }
      
    },
    error: function(result)
    {
    		alert(result);
    }    
  });
}

function updateSearchList2(products,q,index) {
   var html ="";
   var ps="{'products': []}";
    ps.products =[];
    ps = [];
   $.each(products.products, function(idx,dish) {
    if(dish.name.indexOf(q) > -1)
      ps=ps.push(dish);
   });
   console.log(ps);
  if(products==null)
    $("#search-result-"+index).html(html);
  else
  {
    var html ="<table class='table table-hover table-striped table-search'>";
    $.each(products.products, function(idx,dish) {
      var dish_image ;
      if(dish.images[0]!=null)
      dish_image=dish.images[0].product_url;
      else dish_image="/assets/noimage/large.png";
    html += "<tr class='product-select' data-id='"+dish.id+"'>\
              <td class ='product-image'><img src='"+ dish_image +"'></td>\
              <td class ='product-image'>"+dish.name+"</td>\
            </tr>";
    });
    html += " </table>" ;
    $("#search-result-"+index).html(html);
  }

}