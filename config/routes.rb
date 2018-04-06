Rails.application.routes.draw do
  devise_for :users
  resources :counttypes
  resources :counts
  resources :foods do
    collection {post :import}
  end
  resources :foodtypes
  resources :placetypes
  root 'foods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
