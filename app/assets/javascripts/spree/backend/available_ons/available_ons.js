// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'
  var week=0;
$(document).ready(function () {
  'use strict';
  $( document ).ajaxStart(function() {
    $(".btn-pre").prop('disabled', true);
    $(".btn-next").prop('disabled', true);
  });
  $( document ).ajaxStop(function() {
    checkWeek(week);
  });

  if ($('#wrap_week_action').length>0){
    updateAvailableOnPage(week);

    $("body").on('click', '.a-product-delete', function()
    {
      var product_id = $(this).attr('data-id');
      var serve_date = $(this).attr('data-date');

      DeleteDish(this,product_id,serve_date)
    });

    $("body").on('click', '.btn-next', function()
    {
      week++;
      checkWeek(week);
      $("#container-available-on").empty();
      updateAvailableOnPage(week);
      
    });

    $("body").on('click', '.btn-pre', function()
    {
      week--;
      checkWeek(week); 
      $("#container-available-on").empty();
      updateAvailableOnPage(week);
      
    });


  }//end if #wrap_week_action

 	
});

function checkWeek(week){
  if(week==1){
    $(".center-bar-text").text("Next Week");
    $(".btn-next").prop('disabled', true);
    $(".btn-pre").prop('disabled', false);
  }
  else if(week==-1){
    $(".center-bar-text").text("Last Week");
    $(".btn-pre").prop('disabled', true);
    $(".btn-next").prop('disabled', false);
  }
  else {
    $(".center-bar-text").text("This Week");
    $(".btn-pre").prop('disabled', false);
    $(".btn-next").prop('disabled', false);
  }
}

function updateAvailableOnPage(week){
  var dayOfWeek= calculateWeeks(week); 
  $(".dayofweek").text(DateFormat(dayOfWeek[0]) + "==>" +DateFormat(dayOfWeek[6]));
  for (var i=0; i<dayOfWeek.length;i++)
  {
    $("#container-available-on").append(
      "<div class='whole'>\
        <div class='type day_"+i+"'>\
          <p>"+getDay(i)+"</p>\
        </div>\
        <div class='plan date_"+i+"'>\
        </div>\
        <div class='dishpicker_"+i+"'>\
        </div>\
      </div>"
    );
    LoadDishes(dayOfWeek[i],i);
  }
}

function calculateWeeks(week){
  var dayOfWeek= new Array(7);
  for (var index = 0; index < dayOfWeek.length; ++index) {
    var date = new Date();
    date.setDate(date.getDate()+7*week - date.getDay() +index);
    dayOfWeek[index] =date;
  }
  return dayOfWeek;
}

function getDay(index){
    var weekday = new Array(7);
    weekday[0] = "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday[3] = "Wednesday";
    weekday[4] = "Thursday";
    weekday[5] = "Friday";
    weekday[6] = "Saturday";

    return weekday[index];
}

function DeleteDish(object,product_id,serve_date)
{
	var Url = Spree.routes.products_serve_date_delete;
  $.ajax(
  {
    url: Url,
    type: "delete",
    data: 
    {
    	token: Spree.api_key,
      serve_date: serve_date,
      product_id: product_id
    },
    success: function(result)
    {

       $(object).parent().parent().slideUp();
    },
    error: function()
    {
    	alert("Something is wrong")
    }
  });
}
   

function LoadDishes(serve_date,index)
{
  var Url = Spree.routes.products_serve_date;
  var date =DateFormat(serve_date);

  var name = ".dishpicker_"+index;
  $(name).append(
		    	"<form class='form-search' role='search'  method='get'  name='form-search' autocomplete='off'>\
		    	  <div class='input-group' data-id='"+index+"'>\
	          	<input type='text' class='form-control' name='q' id='q' type='text' placeholder='Choose the dish'>\
	      		</div>\
	      		<div class='search-result'id='search-result-" +index+"' data-date='"+date+"'  data-index='"+index+"'></div>\
	      	</form>"
	  	);
  $.ajax(
  {
    url: Url,
    type: "get",
    data: 
    {
    	token: Spree.api_key,
      serve_date: serve_date
    },
    success: function(result)
    {
      $.each(result.products, function(idx,dish) {
        var divname = ".date_"+index;
        var dish_name = dish.name.substring(0, 10);
        var dish_image ;
var dish_image ;
          if(dish.images[0]!=null)
          dish_image=dish.images[0].product_url;
          else dish_image="/assets/noimage/large.png";

        $(divname).append(
          "<div class='header' data-id="+dish.id+" data-date="+date+">\
              <div class='product_delete'><a class='a-product-delete' data-id="+dish.id+" data-date="+date+"><span class='icon icon-delete'></span></a></div>\
             <p class='product_name'>" +dish.dish_type + "</p>\
            <div class='image'> <img src='"+ dish_image +"'</div>\
            <p class='product_name'>"+dish.name+"</p>\
          </div>"
        );
    	});
    },
    error: function()
    {

    }

  });
	

    
}
function DateFormat(date)
{
  var day = new Date(date);
  var dd = day.getDate();
  var mm = day.getMonth()+1; //January is 0!

  var yyyy = day.getFullYear();
  if(dd<10){
      dd='0'+dd
  } 
  if(mm<10){
      mm='0'+mm
  } 
  return dd+'/'+mm+'/'+yyyy;
}
