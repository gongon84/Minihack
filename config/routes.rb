Rails.application.routes.draw do
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

end
