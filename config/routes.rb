Rails.application.routes.draw do
  # devise_for :users
  # devise_for :views
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
