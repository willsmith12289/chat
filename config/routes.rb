Rails.application.routes.draw do
  devise_for :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
  root "chat_rooms#index"
  mount ActionCable.server => '/cable'
  get "users/:id", to: "profiles#show", as: :profile
  get 'users/:id/edit', to: 'profiles#edit', as: :edit_profile
  patch 'users/:id/edit', to: 'profiles#update', as: :update_profile
end
