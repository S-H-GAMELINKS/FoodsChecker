Rails.application.routes.draw do
  resources :counts
  resources :foods
  resources :foodtypes
  resources :placetypes
  root 'foods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
