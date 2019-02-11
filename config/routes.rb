Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books

  get '/my-books', to: 'books#user_books'
end
