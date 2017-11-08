Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [ :index, :show ] do
    resources :skills, only: [:show, :new, :create ]
  end

  resources :skills, only: [ :index ] do
    resources :reviews, only: [:show, :create, :new]
  end

  resources :ateliers, only: [:show, :edit ]

  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
