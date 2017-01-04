Rails.application.routes.draw do
  root 'home#index'
  post '/search_by_address' => 'home#search_by_address'
  get '/search_by_address' => 'home#index'
  post '/search_by_current_location' => 'home#search_by_current_location'
  get '/search_by_current_location' => 'home#index'
end
