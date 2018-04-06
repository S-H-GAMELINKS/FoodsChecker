Rails.application.routes.draw do
  devise_for :users

  resources :foods, :placetypes, :foodtypes, :counttypes, :counts do
    collection {post :import}
  end

  root 'foods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end