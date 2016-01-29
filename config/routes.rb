Spree::Core::Engine.routes.draw do
	namespace :admin do
    	resources :dish_types do
    		collection do
		      delete 'destroy_multiple'
		    end
		    resources :products
		
    	end
		resources :products do
    		collection do
			    delete 'destroy_multiple'
			end
		end

  	end
  # Add your extension routes here
end
