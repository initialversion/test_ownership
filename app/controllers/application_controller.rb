class ApplicationController < ActionController::Base
  before_action :authenticate_owner!

  protect_from_forgery with: :exception
end
