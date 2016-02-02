RottenMangoes::Application.routes.draw do

  root to: 'movies#index'

  get 'search' => 'search#index'

  # get 'reviews/new'

  # get 'reviews/create'

  # get 'sessions/new'

  # post 'sessions/create'

  # get 'users/new'

  # get 'users/create'

  # delete 'session/:id' => "session#destroy"

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end

end
