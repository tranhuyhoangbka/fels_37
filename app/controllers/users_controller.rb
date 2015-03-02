class UsersController < ApplicationController
  before_action :user_logged_in, only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user      
      flash[:success] = 'wellcome E-Learning System'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
    @learneds = @user.learneds
    @activities = @user.activities.paginate page: params[:page], per_page: 15
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end