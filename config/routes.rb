Blog::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :pages, only: [:show]
  resources :categories do
    resources :articles, only: [:index, :create, :new, :show] do
      resources :comments, only: [:create]
    end
  end
  resources :articles, only: [:index, :create, :new, :show] do
    resources :comments, only: [:create]
    collection do
      get :top
    end
  end
  resources :tags do
    resources :articles, only: [:index, :create, :new, :show] do
      resources :comments, only: [:create]
    end
  end
  resources :users, only: [:edit, :show, :update]
  root to: "articles#index"
end
