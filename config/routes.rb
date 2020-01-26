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
    end
  end
end
