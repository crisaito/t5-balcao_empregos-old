Rails.application.routes.draw do
  root 'home#index'

  resources :companies, only: [:index, :show, :new, :create] do
    resources :jobs, only: [:show, :new, :create]
  end
end
