class OwnedThingsController < ApplicationController
  before_action :current_user_must_be_owned_thing_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_owned_thing_owner
    owned_thing = OwnedThing.find(params[:id])

    unless current_user == owned_thing.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @owned_things = OwnedThing.all

    render("owned_things/index.html.erb")
  end

  def show
    @owned_thing = OwnedThing.find(params[:id])

    render("owned_things/show.html.erb")
  end

  def new
    @owned_thing = OwnedThing.new

    render("owned_things/new.html.erb")
  end

  def create
    @owned_thing = OwnedThing.new

    

    save_status = @owned_thing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/owned_things/new", "/create_owned_thing"
        redirect_to("/owned_things")
      else
        redirect_back(:fallback_location => "/", :notice => "Owned thing created successfully.")
      end
    else
      render("owned_things/new.html.erb")
    end
  end

  def edit
    @owned_thing = OwnedThing.find(params[:id])

    render("owned_things/edit.html.erb")
  end

  def update
    @owned_thing = OwnedThing.find(params[:id])

    

    save_status = @owned_thing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/owned_things/#{@owned_thing.id}/edit", "/update_owned_thing"
        redirect_to("/owned_things/#{@owned_thing.id}", :notice => "Owned thing updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Owned thing updated successfully.")
      end
    else
      render("owned_things/edit.html.erb")
    end
  end

  def destroy
    @owned_thing = OwnedThing.find(params[:id])

    @owned_thing.destroy

    if URI(request.referer).path == "/owned_things/#{@owned_thing.id}"
      redirect_to("/", :notice => "Owned thing deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Owned thing deleted.")
    end
  end
end
