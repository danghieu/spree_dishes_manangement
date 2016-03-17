// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'
  var week=0;
$(document).ready(function () {
  'use strict';
  

  if ($('#wrap_week_action').length>0){
    $( document ).ajaxStart(function() {
      $(".btn-pre").prop('disabled', true);
      $(".btn-next").prop('disabled', true);
    });
    $( document ).ajaxStop(function() {
      checkWeek(week);
    });

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

    if ($('#available-on-box').length>0){
      $("body").on('click', '.whole', function(ev) {
        var box_id =$("#available-on-box").attr("data-id");;
        var serve_date = $(this).attr("data-date");
        $(".modal-header").text(serve_date); 
        var Url = Spree.routes.boxes_serve_date;
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
            var html = "<div class='form-group field col-md-12' id='box_dish_field'>";
            $.each(result.products, function(idx,dish) {
              var dish_image ;
              if(dish.images[0]!=null)
                dish_image=dish.images[0].product_url;
              else dish_image="/assets/noimage/large.png";
              html +="<div class='form-group col-md-12' data-dish-type='"+dish.dish_type.id+" id='dish_field'>\
                        <label for='dish_box_dish'>"+dish.dish_type.name+" :</label>\
                        <div id='box-dish-"+ dish.dish_type.id+"' class = 'dish'>\
                            <div class='image'> <img src='"+ dish_image +"'></div>\
                            <div class='product-name'>"+dish.name+"</div>\
                            <span class='icon icon-chevron-down' style='padding-top: 20px;float: right;'></span>\
                        </div >\
                        <div id='elect-dish-"+ dish.dish_type.id+"' class='select-dish'>\
                          <form class='form-search' role='search'  method='get'  name='form-search' autocomplete='off'>\
                            <div class='input-group' data-id='"+ dish.dish_type.id+"' style='width: 100%;'>\
                              <input type='text' class='form-control' name='q' id='q' type='text' placeholder='Choose the dish'>\
                            </div>\
                            <div class='search-result' data-product-id-old='"+ dish.id+"' id='search-result-"+ dish.dish_type.id+"' data-box='"+box_id+"' data-date='"+serve_date+"' data-index='"+ dish.dish_type.id+"'>\
                            </div>\
                          </form>\
                        </div>\
                      </div>\
                    ";
            });
            html+="</div>";
            $(".modal-body").html(html); 
          },
          error: function()
          {

          }

        }); 

        $("#myModal").modal();


      });
    }
    

    // $("body").on('click', '.box-dish', function()
    // {
    //   console.log("a");
    //   var index =1;
    //   $(this).append(
    //     "<form class='form-search' role='search'  method='get'  name='form-search' autocomplete='off'>\
    //         <div class='input-group' data-id='"+index+"'>\
    //           <input type='text' class='form-control' name='q' id='q' type='text' placeholder='Choose the dish'>\
    //         </div>\
    //         <div class='search-result'id='search-result-" +index+"' data-date='"+index+"'  data-index='"+index+"'></div>\
    //       </form>"
    //     );
    // });


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
  for (var i=1; i<dayOfWeek.length;i++)
  {
    $("#container-available-on").append(
      "<div class='whole' data-date='"+DateFormat(dayOfWeek[i])+"'>\
        <div class='type day_"+i+"'>\
          <p>"+getDay(i)+"</p>\
        </div>\
        <div class='plan date_"+i+"'>\
        </div>\
        <div class='dishpicker_"+i+"'>\
        </div>\
      </div>"
    );
    if ($('#available-on-dish').length>0){
      LoadDishes(dayOfWeek[i],i);
    }else if ($('#available-on-box').length>0){
      LoadBoxes(dayOfWeek[i],i);
    }
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
             <p class='product_name'>" +dish.dish_type.name + "</p>\
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

function LoadBoxes(serve_date,index)
{
  var Url = Spree.routes.boxes_serve_date;
  var date =DateFormat(serve_date);
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
          "<div class='header box-dish' id='box-dish-"+dish.id+"-"+date+"' data-id="+dish.id+" data-date="+date+">\
             <p class='product_name'>" +dish.dish_type.name + "</p>\
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
  return yyyy+'-'+mm+'-'+dd;
}
