Rails.application.routes.draw do
  get "/" => "sites#home"
  get "/contact" => "sites#contact"
  # get "/projects" => "projects#index"
  # post "/projects" => "projects#create"
  # get "/projects/new" => "projects#new"
  # get "/projects/:project_id/entries" => "entries#index"
  # get "/projects/:project_id/entries/new" => "entries#new"
  # get "/projects/:id" => "projects#show"
  # post "/projects/:project_id/entries" => "entries#create", as: "project_entries"
  resources :projects do
    resources :entries, only: [:index, :new, :create]
  end

  resources :entries, only: [:edit, :update, :destroy]
end
