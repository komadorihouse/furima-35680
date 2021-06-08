Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :order, only: [:index, :create]
  end

  root to: 'items#index'
  
end
