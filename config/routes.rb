

Rails.application.routes.draw do
  use_doorkeeper
  namespace :api do
    namespace :v1 do
      resources :animals, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:create]  
      post '/signup', to: 'users#create'  # Signup route
    end
  end
end
