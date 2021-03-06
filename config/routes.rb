Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [ :index, :show ] do
    resources :skills, only: [:show, :new, :create, :edit, :update ] do
      resources :ateliers, only: [:new, :create]
    end
    resources :ateliers, only: [:index, :edit, :update, :destroy]
  end

  get "atelier/approve/:id/", to: "ateliers#approve", as: 'approve'

  resources :skills, only: [ :index, :show ] do
    resources :reviews, only: [:show, :create, :new]
  end

  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
