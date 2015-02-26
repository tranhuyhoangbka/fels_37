class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include CategoriesHelper

  def user_logged_in
    unless logged_in?
      flash[:danger] = "Please login!"
      redirect_to login_path
    end
  end
end
