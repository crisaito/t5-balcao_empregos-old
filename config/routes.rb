Rails.application.routes.draw do
  root 'home#index'

  resources :companies, only: [:index, :show, :new, :create] do
    resources :jobs, only: [:show]
  end
end
