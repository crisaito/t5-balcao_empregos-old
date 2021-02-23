Rails.application.routes.draw do
  root 'home#index'

  devise_for :recruiters, controllers: { registrations: "registrations" }
  resources :recruiters, only: [:show]

  resources :companies, only: [:index, :show, :new, :create] do
    resources :jobs, only: [:show, :new, :create]
  end
end
