Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do

      resources :users, only: [:show] do
        
        
      end

      resources :topics do
        resources :comments
        resources :passages
      end

      get '/signup', to: "users#new"

      post '/signup', to: "users#create"

      get '/login', to: 'sessions#new'

      post '/login', to: 'sessions#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
