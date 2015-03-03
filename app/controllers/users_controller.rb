class UsersController < ApplicationController
  before_action :user_logged_in, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
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

  def index
    @users = User.paginate page: params[:page]
  end

  def edit    
  end

  def update    
    if @user.update_attributes user_params
      flash[:success] = "Update user is success!"
      redirect_to root_url
    else
      flash.now[:danger] = "not success!"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end