Blog::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :pages, only: [:show]
  resources :categories do
    resources :articles, only: [:index, :show] do
      collection do
        get :top
      end
      resources :comments, only: [:create]
    end
  end  
  root to: "articles#index"
end
