Rails.application.routes.draw do
  devise_for :users
  resources :counttypes do
    collection {post :import}
  end
  resources :counts do
    collection {post :import}
  end
  resources :foods do
    collection {post :import}
  end
  resources :foodtypes　do
    collection {post :import}
  end
  resources :placetypes do
    collection {post :import}
  end
  root 'foods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
