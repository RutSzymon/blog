Blog::Application.routes.draw do
  resources :pages, only: [:show]
  resources :articles, only: [:index, :show]
end
