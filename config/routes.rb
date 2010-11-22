Forum::Application.routes.draw do
  resources :comments, :only => [ :create ]
  match '/login' => "users#sign_in"
  devise_for :users

  resources :tasks
  root :to => "tasks#index"
end
