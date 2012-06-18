Blog::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :pages, only: [:show]
  resources :articles, only: [:index, :show]
end
