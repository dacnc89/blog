Rails.application.routes.draw do
  get 'relationships/create'

  get 'relationships/destroy'

  root to: 'articles#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get get'/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :articles do
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]
end
