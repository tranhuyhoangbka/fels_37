class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  	  flash[:success] = "your account is created!"
  	  redirect_to root_url
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def show
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
