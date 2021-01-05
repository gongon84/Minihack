Rails.application.routes.draw do

  root to: 'home#index'

  # home
  get "/" => "home#index"
  get "/test" => "home#test"

  # events
  get "/events/index" => "events#index"
  get "/events/:id/show" => "events#show"
  get "/events/new" => "events#new"
  get "/events/table" => "events#table"
  post "/events/update" => "events#update"
  post "/events/create" => "events#create"
  get "/events/:id/edit" => "events#edit"
  post "/events/:id/destroy" => "events#destroy"

  # comments
  post 'comments/:event_id/create' => "comments#create"
  post 'comments/:event_id/:comment_id/destroy' => "comments#destroy"

  # users
  get '/users/:id/show' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  post '/users/:id/destroy' => 'users#destroy'
  get '/users/new' => 'users#new'
  post '/users/update' => 'users#update'
  post 'users/create' => 'users#create'

  # user_sessions
  get '/login' => 'user_sessions#new'
  post '/login' => 'user_sessions#create'
  post '/logout' => 'user_sessions#destroy'

end
