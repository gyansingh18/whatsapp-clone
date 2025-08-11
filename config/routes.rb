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
# Route optimization 3: Mon Aug 11 10:16:58 IST 2025
# Route optimization 8: Mon Aug 11 10:16:59 IST 2025
# Route optimization 13: Mon Aug 11 10:16:59 IST 2025
# Route optimization 18: Mon Aug 11 10:17:00 IST 2025
# Route optimization 23: Mon Aug 11 10:17:01 IST 2025
# Route optimization 28: Mon Aug 11 10:17:01 IST 2025
