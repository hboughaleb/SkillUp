Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :skills, only: [:index, :show, :new, :create] do
    resources :ateliers, only: [:show, :create, :new]
  end
  resources :user, only: [:index, :show, :new, :create, :update, :edit] do
    resources :skills, only: [:new, :create]
    resources :reviews, only: [:show, :create, :new]
  end

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
