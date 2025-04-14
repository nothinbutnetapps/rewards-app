Rails.application.routes.draw do
  resources :user, only: [:create, :show]
  resources :redemption, only: [:create]
  resources :reward, only: [:index]

  root 'main_app#index'
end
