class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Access denied!"
    flash.keep(:notice)
    redirect_to posts_path
  end
end  

