Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :skills do
    resources :ateliers, only: [:show, :create, :new]
  end
    resources :reviews, only: [:show, :create, :new]
  end

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# ***** Brian's Note *****
# edited line 11. The following is the original line:
# resources :skills, only: [:index, :show, :new, :create, :edit] do
