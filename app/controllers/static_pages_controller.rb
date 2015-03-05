class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @learneds = current_user.learneds
      @activities = current_user.feed.paginate page: params[:page]
    end
  end

  def about
  end

  def help
  end
end