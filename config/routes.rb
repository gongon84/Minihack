Rails.application.routes.draw do

  root to: 'home#index'

  # home
  get "/" => "home#index"
  get '/about' => 'home#about'
  get '/about/account' => 'home#account'
  get "/test" => "home#test"

  # events
  get "/events/index" => "events#index"
  get "/events/:id/show" => "events#show"
  get "/events/new" => "events#new"
  post "/events/update" => "events#update"
  post "/events/create" => "events#create"
  get "/events/:id/edit" => "events#edit"
  post "/events/:id/destroy" => "events#destroy"

  # works
  get 'works/table' => 'works#table'
  get 'works/:event_id/edit' => 'works#edit'
  get 'works/:event_id/new' => 'works#new'
  post 'works/:event_id/update' => 'works#update'
  post 'works/:event_id/create' => 'works#create'
  post 'works/:event_id/destroy' => 'works#destroy'
  post 'works/:event_id/destroy_image' => 'works#destroy_image'

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
