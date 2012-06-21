Blog::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :pages, only: [:show]
  resources :categories do
    resources :articles, only: [:index, :show] do
      resources :comments, only: [:create]
    end
  end
  resources :articles, only: [] do
    collection do
      get :top
    end
  end  
  root to: "articles#index"
end
