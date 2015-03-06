class FollowersController < ApplicationController
  before_action :user_logged_in

  def index
    @title = 'Followers'
    @user = User.find params[:user_id]
    @users = @user.followers.paginate page: params[:page]
  end
end