class StaticPagesController < ApplicationController
  def home
    @learneds = current_user.learneds if logged_in?
  end

  def about
  end

  def help
  end
end
