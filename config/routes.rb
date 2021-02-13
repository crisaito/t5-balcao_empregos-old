Rails.application.routes.draw do
  root 'home#index'

  resources :companies, only: [:index, :show, :new, :create]
end
