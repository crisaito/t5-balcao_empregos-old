Rails.application.routes.draw do
  devise_for :recruiters
  root 'home#index'

  resources :companies, only: [:index, :show, :new, :create] do
    resources :jobs, only: [:show, :new, :create]
  end
end
