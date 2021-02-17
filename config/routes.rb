Rails.application.routes.draw do
  resources :users
  resources :sessions

  post 'login' => 'sessions#create'
  get 'sign_in' => 'sessions#new'
  get 'sign_out' => 'sessions#destroy'
  get 'sign_up' => 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
