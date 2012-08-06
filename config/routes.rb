Hackmarks::Application.routes.draw do
  root to: 'home#index'

  resources :bookmarks, only: [:index, :new, :create]
end
