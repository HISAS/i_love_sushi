Rails.application.routes.draw do
  root 'home#index'
  post '/search_by_address' => 'home#search_by_address'
  post '/search_by_current_location' => 'home#search_by_current_location'
end
