Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "groups#index", as: :authenticated_root
  end

  resources :groups, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end

  # Defines the root path route ("/")
  root "home_page#index"

end
