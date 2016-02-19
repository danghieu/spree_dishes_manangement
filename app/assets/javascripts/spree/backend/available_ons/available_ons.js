// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'

$(document).ready(function () {
  'use strict';
  var sunday;
  var saturday;

  var dayOfWeek= new Array(7);
  var today = new Date();

	for (var index = 0; index < dayOfWeek.length; ++index) {
		var date = new Date();
		date.setDate(date.getDate()  - date.getDay() +index);
		dayOfWeek[index] =date;
    //console.log(dayOfWeek[index]);
	}

	$(".dayofweek").text(DateFormat(dayOfWeek[0]) + "==>" +DateFormat(dayOfWeek[6]));
	 var d = new Date();
	LoadDishes(d);

});

function LoadDishes(serve_date){	
	dish = GetDishByServeDate(serve_date)
 	console.log(dish);
 	//console.log(dish[0].images[0].mini_url);
}
function GetDishByServeDate(serve_date)
{
  var Url = Spree.routes.products_serve_date;
  var result_data;
  console.log(66666666666666);
	console.log(serve_date);
  $.ajax(
  {
    url: Url,
    async: false,
    data: 
    {
    	token: Spree.api_key,
      serve_date: serve_date
    },
    success: function(result)
    {
      //console.log(result);
      result_data = result;
    },
    error: function()
    {

    }
  });

  return result_data;
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
