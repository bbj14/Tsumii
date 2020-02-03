Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, except: :edit do
    member do
      get :likes
      get :followings
      get :followers
    end
  end
  
  
  get 'mypage', to: 'mypages#show'
  resource :mypage, only: [:show, :edit] do
    collection do
      get :likes
      get :followings
      get :followers
      get :solved
      get :solve_later
    end
  end
  
  resources :works do
    collection do
      get :popular
      get :recent
      get 'moves/:number_of_moves', to: 'works#moves', as: 'moves', constraints: { number_of_moves: /\d*[13579]+/ }
    
      get :timeline
    end
  end
  
  #resources :moves, only: [:create, :destroy]
  
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  
end
