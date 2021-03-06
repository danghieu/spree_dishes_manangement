// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'
//= require spree/backend/available_ons/available_ons.js
//= require spree/backend/available_ons/dish_picker.js
Spree.routes.products_search= Spree.pathFor('api/products_search')
Spree.routes.products_serve_date = Spree.pathFor('api/products_serve_date')
Spree.routes.products_serve_date_delete = Spree.pathFor('api/products_serve_date_delete')
Spree.routes.products_available_on_create = Spree.pathFor('api/products_available_on_create')
Spree.routes.products_get_all= Spree.pathFor('api/products_get_all')
Spree.routes.boxes_serve_date = Spree.pathFor('api/boxes_serve_date')

$(document).ready(function () {
  if ($('input[type=checkbox]:checked').length ==0) { 
    $('.btn-delete').prop('disabled', true);
  }
  $(' input[type=checkbox]').click(function(){
  	if ($('input[type=checkbox]:checked').length >0) { 
  	  $('.btn-delete').prop('disabled', false);
  	}
  	if ($('input[type=checkbox]:checked').length ==0) { 
  	  $('.btn-delete').prop('disabled', true);
  	}
  });
  

  $("#image_attachment").change(function(){
      readURL(this);
  });

});
function readURL(input) {

  if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('[data-hook=thumbnail] img').attr('src', e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
  }
}
function getData(Url,data,type){
  var dataResult=false;
  data["token"] =Spree.api_key ;
  $.ajax(
  {
    url: Url,
    type: type,
    async: false,
    data: data,
    success: function(result)
    {
      dataResult=result;
    },
    error: function(result)
    {
      if (result.responseText != null) {
      var a = JSON.parse(result.responseText);
        if (a != null)
          alert(a[0].messages);
        }

      }    
  });
  return dataResult;
}