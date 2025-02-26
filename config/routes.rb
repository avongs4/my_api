Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  use_doorkeeper
  devise_for :users
 
  get "up" => "rails/health#show", as: :rails_health_check
      resources :abalones, only: [:index, :show, :create, :update, :destroy]
    
end


