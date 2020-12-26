Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"

  # events
  get "/events/index" => "events#index"
  get "/events/:id/show" => "events#show"
  get "/events/new" => "events#new"
  post "/events/update" => "events#update"
  post "/events/create" => "events#create"
  get "/events/:id/edit" => "events#edit"
  post "/events/:id/destroy" => "events#destroy"
end
