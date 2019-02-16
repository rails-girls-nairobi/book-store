Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  devise_for :users
  root 'books#index'
  resources :books

  get '/my-books', to: 'books#user_books'
end
