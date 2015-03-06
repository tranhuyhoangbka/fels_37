class FollowingsController < ApplicationController
  before_action :user_logged_in

  def index
    @title = 'Following'
    @user  = User.find params[:user_id]
    @users = @user.following.paginate page: params[:page]
  end
end