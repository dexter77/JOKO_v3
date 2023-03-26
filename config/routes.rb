Rails.application.routes.draw do
  devise_for :users, controllers: { users: "users"}

  root to: "users#sign_in"
  post "users/user", to: "users#show"

  resources :users, only: [:new, :create, :show, :destroy ] do
    resources :accounts do
      resources :transactions
    end
  end

end
