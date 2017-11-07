Rails.application.routes.draw do
  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/edit'

  devise_for :users
  root to: 'pages#home'

  resources :skills, only: [:index, :show, :new, :create] do
    resources :ateliers, only: [:show, :create, :new]
  end
  resources :user, only: [:index, :show, :new, :create, :update, :edit] do
    resources :skills, only: [:new, :create]
    resources :reviews, only: [:show, :create, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
