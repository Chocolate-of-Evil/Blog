Rails.application.routes.draw do
  get "/articles", to: "articles#index"
  #get 'home/index'
  devise_for :users
  #get 'persons/profile'
  root to: "home#index"
  resources :articles
  resources :drafts
  #get 'persons/profile', as: 'user_root'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
