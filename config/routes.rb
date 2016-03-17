Spree::Core::Engine.routes.draw do


  namespace :admin do
    resources :rules do
      collection do
        put 'update_rules'
      end
    end

    resources :dish_types do
      resources :dish_type_images
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

  namespace :api do
		get    "products_serve_date" => "available_ons#serve_date"
		delete "products_serve_date_delete" => "available_ons#serve_date_delete"
    post   "products_search" => "products#search"
		get   "products_get_all" => "products#get_all"
		post   "products_available_on_create" => "available_ons#create"
  end

  
  # Add your extension routes here
end
