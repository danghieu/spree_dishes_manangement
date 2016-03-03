$(document).ready(function () {
  'use strict';

  $("body").on("click", function (event) {
    if(!$(event.target).closest('#q').length)
    {
      for(var i = 0 ; i<7;i++){
        $("#search-result-"+i).hide();
      }
    }
    
  });

  $("body").on('click', '#q', function()
  {   
      for(var i = 0 ; i<7;i++){
        $("#search-result-"+i).hide();
      }
    var index = $(this).parent().attr('data-id');
    $("#search-result-"+index).show();
  });

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


function updateSearchList(q,index) {
  Url = Spree.routes.products_search;
  $.ajax(
  {
    url: Url,
    type: "post",
    data: 
    {
      token: Spree.api_key,
        "q":q
    },
    success: function(result)
    {
      var html ="<table class='table table-hover table-striped table-search'>";
      if(result==null)
        $("#search-result-"+index).html(html);
      else{

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