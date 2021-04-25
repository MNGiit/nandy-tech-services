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
  get '/user' => 'users#show'
  get '/users' => 'users#index'

  # insurances
  get 'insurances/new', to: 'insurances#new'

  # loans

end
