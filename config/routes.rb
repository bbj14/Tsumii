Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get :likes
      get :followings
      get :followers
    end
  end
  get 'signup', to: 'users#new'
  
  resources :works do
    collection do
      get :popular
      get :recent
      get 'moves/:number_of_moves', to: 'works#moves', as: 'moves', constraints: { number_of_moves: /\d*[13579]+/ }
    
      get :timeline
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  
end
