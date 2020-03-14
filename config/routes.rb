Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'home#index'
  get 'search', to: 'home#search'
  resources :cuisines, only: %i[index show edit update new create]
  resources :restaurants, only: %i[index show new create edit update]
  resources :ads, only: %i[index show new create destroy]
end
