Rails.application.routes.draw do
  resources :session, only: [:index, :create, :destroy]
  get '/login', to: "session#new"

  # if needed for comment # 

  namespace :admin do 
    resources :articles
    # destroy 'articles/:id', to: "articles#destroy", as: "delete_article"
    root to: "articles#index"
  end

  resources :categories, only: [:show, :index] do
    resources :articles
  end

  root to: "static#welcome"

  get '/', to: "static#welcome"

end
