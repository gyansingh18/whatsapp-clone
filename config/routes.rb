Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Authentication routes
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # User routes
  resources :users, only: [:new, :create, :show]

  # Chat routes
  resources :chats, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end

  # Root path
  root 'chats#index'

  # Mount Action Cable
  mount ActionCable.server => '/cable'
end
