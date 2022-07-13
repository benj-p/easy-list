Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  get 'notes/show'
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"

  resources :lists do
    delete '/clear_items', to: 'lists#clear_items'
    resources :items
  end

  resources :notes, only: [:index, :show, :new, :create, :update]
end