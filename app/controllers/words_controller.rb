class WordsController < ApplicationController
  before_action :user_logged_in, only: [:index, :new, :create, :destroy]
  before_action :admin_user, only: [:index, :new, :create, :destroy]
  
  def index
    @words = Word.paginate page: params[:page]
  end

  def new
    @word = Word.new
    @categories = Category.all
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = 'Creating word is success!'
      redirect_to root_url
    else
      flash.now[:danger] = 'Not success!'
      render 'new'
    end
  end

  def show
    @word = Word.find params[:id]
    @answers = @word.answers
  end

  def edit
    @word = Word.find params[:id]
    @categories = Category.all
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = 'updated word!'
      redirect_to words_url
    else
      flash.now[:danger] = 'Not success!'
      render 'edit'
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = 'Deleted Word'
    redirect_to words_url
  end

  private

  def word_params
    params.require(:word).permit :content, :category_id
  end
end