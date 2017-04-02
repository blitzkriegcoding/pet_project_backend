Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  jsonapi_resources :locations, only: [:all] do
    get 'get_current_temp/:location_id/', to: 'locations#get_current_temp', on: :collection, constraints:  { location_id: /[0-9]/ }
  end
  # jsonapi_resources :countries, only: [:show]
  # jsonapi_resources :temperatures, only: [:show]  
  
end
