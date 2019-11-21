Rails.application.routes.draw do

  devise_for :users
  root to: "emails#index"

  resources :emails, only: [:create, :show, :destroy, :update]

  resources :tasks, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
