// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'
//= require spree/backend/available_ons/available_ons.js
//= require spree/backend/available_ons/dish_picker.js
Spree.routes.products_search= Spree.pathFor('api/products_search')
Spree.routes.products_serve_date = Spree.pathFor('api/products_serve_date')
Spree.routes.products_serve_date_delete = Spree.pathFor('api/products_serve_date_delete')
Spree.routes.products_available_on_create = Spree.pathFor('api/products_available_on_create')
Spree.routes.products_get_all= Spree.pathFor('api/products_get_all')
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
});