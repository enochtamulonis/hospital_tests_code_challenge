Rails.application.routes.draw do
  root 'patients#index'
  devise_for :users

  get 'search', to: "patients#search"

  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
