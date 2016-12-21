Rails.application.routes.draw do
  devise_for :owners
  # Routes for the Owner resource:
  # READ
  get "/owners", :controller => "owners", :action => "index"
  get "/owners/:id", :controller => "owners", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
