Rails.application.routes.draw do
  root 'sessions#index'

  resources :notes
  resources :users

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  get 'send_note/:id' => 'notes#send_note'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end