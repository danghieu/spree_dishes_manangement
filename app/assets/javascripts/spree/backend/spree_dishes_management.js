// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'


Spree.routes.products_serve_date = Spree.pathFor('api/products_serve_date')

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