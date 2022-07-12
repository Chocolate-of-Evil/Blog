Rails.application.routes.draw do
  get "/articles", to: "articles#index"
  get 'home/about_me', to: 'home#about_me'
  get 'home/contact_me', to: 'home#contact_me'
  devise_for :users
  root to: "home#index"
  resources :articles
  resources :drafts
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
