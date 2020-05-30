Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  devise_for :users
  resources :users, only: [:index] do
    put :set_admin
    put :set_visitor
  end
  get 'search', to: 'home#search'
  resources :cuisines, only: %i[index show edit update new create]
  resources :restaurants do
    resources :comments do
      put :approve_comment
    end
    member do
      delete :delete_image_attachment
    end
    resources :ratings, only: %i[create update]
  end
  resources :ads, only: %i[index show new create destroy]
  resources :full_ads, only: %i[index show new create destroy]


  namespace :api do
    namespace :v1 do
      resources :cuisines, only: %i[index]
      get 'search', to: 'home#search'
    end
  end
  get 'sobre', to: 'home#sobre'
  get 'contato', to: 'home#contato'
end
