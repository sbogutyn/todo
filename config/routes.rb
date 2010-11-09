Forum::Application.routes.draw do
  resources :comments, :only => [ :create ]

  devise_for :users

  resources :tasks
  root :to => "tasks#index"
end
