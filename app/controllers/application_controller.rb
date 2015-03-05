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

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end
  
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end