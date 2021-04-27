Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#home' # index page
  root 'users#index'

  # log in or out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  # delete '/logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'

  # users
  # get '/user' => 'users#show'
  # get '/users' => 'users#index'
  resources :users, only: [:index, :show]

  # insurances
  # get 'insurances', to: 'insurances#index'
  get 'insurances/new', to: 'insurances#new'
  resources :insurances, only: [:index, :new, :create, :show, :edit, :update, :search] # consider nesting it inside users

  # loans
  # get 'loans', to: 'loans#index'
  get 'loans/new', to: 'loans#new'
  resources :loans, only: [:index, :new, :create, :show, :edit, :update, :search] # consider nesting it inside users


end
