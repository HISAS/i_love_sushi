Rails.application.routes.draw do
  root 'home#index'
  get '/search_by_address' => 'home#search_by_address'
  get '/search_by_current_location' => 'home#search_by_current_location'
end
