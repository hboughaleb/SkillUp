Rails.application.routes.draw do
  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/edit'

  devise_for :users
  root to: 'pages#home'

  resources :skills do
    resources :ateliers, only: [:show, :create, :new]
  end

  resources :users, only: [:index, :show, :new, :create, :update, :edit] do
    resources :reviews, only: [:show, :create, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# ***** Brian's Note *****
# edited line 11. The following is the original line:
# resources :skills, only: [:index, :show, :new, :create, :edit] do
