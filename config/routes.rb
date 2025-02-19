Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
 
  get "up" => "rails/health#show", as: :rails_health_check
    resources :abalones, only: [:index]  # This creates a GET /abalones route
  
  
end


