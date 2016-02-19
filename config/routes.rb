Spree::Core::Engine.routes.draw do
  
	namespace :admin do
    	resources :dish_types do
    		collection do
		      delete 'destroy_multiple'
		    end
		    member do
		    	post 'active'
		    end
		    #active 'active'
		    resources :products
		
    	end
		resources :products do
    		collection do
			    delete 'destroy_multiple'
			end
			resources :available_ons
		end
		resources :available_ons
		resources :ingredients do
			resources :ingredient_images
    		collection do
			    delete 'destroy_multiple'
			end
		end


		resources :nutritions do
    		collection do
			    delete 'destroy_multiple'
			end
		end

		concern :products_ingredient_concern do
		  resources :products_ingredients
		end

		resources :products, concerns: :products_ingredient_concern
		resources :ingredients, concerns: :products_ingredient_concern

		concern :product_nutrition_concern do
		  resources :products_nutritions
		end

		resources :products, concerns: :product_nutrition_concern
		resources :ingredients, concerns: :product_nutrition_concern

  	end
  	get "/api/products_serve_date" => "api/products#serve_date"
  # Add your extension routes here
end
