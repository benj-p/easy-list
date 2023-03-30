Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  root to: "pages#home"

  resources :lists do
    delete '/clear_items', to: 'lists#clear_items'
    resources :items
  end

  resources :notes, only: [:index, :show, :new, :create, :update, :destroy]

  get '/dashboard', to: 'pages#dashboard'
end