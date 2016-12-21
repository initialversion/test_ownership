Rails.application.routes.draw do
  root :to => "owned_things#index"
  # Routes for the Owned_thing resource:
  # CREATE
  get "/owned_things/new", :controller => "owned_things", :action => "new"
  post "/create_owned_thing", :controller => "owned_things", :action => "create"

  # READ
  get "/owned_things", :controller => "owned_things", :action => "index"
  get "/owned_things/:id", :controller => "owned_things", :action => "show"

  # UPDATE
  get "/owned_things/:id/edit", :controller => "owned_things", :action => "edit"
  post "/update_owned_thing/:id", :controller => "owned_things", :action => "update"

  # DELETE
  get "/delete_owned_thing/:id", :controller => "owned_things", :action => "destroy"
  #------------------------------

  devise_for :owners
  # Routes for the Owner resource:
  # READ
  get "/owners", :controller => "owners", :action => "index"
  get "/owners/:id", :controller => "owners", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
