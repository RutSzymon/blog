Blog::Application.routes.draw do
  resources :pages, only: [:show]
  resources :articles, only: [:show]
end
