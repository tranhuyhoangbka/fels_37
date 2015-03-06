class CategoriesController < ApplicationController
  before_action :user_logged_in, only: [:index, :show, :new, :create, :destroy]
  before_action :admin_user, only: [:new, :create, :destroy]
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
    @words = @category.words.order('RANDOM()').limit(20)
        
    if params[:result]
      @question_answer_id_list = params[:result]
      answer_ids = @question_answer_id_list.values
      @answers = Answer.where(id: answer_ids)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = 'Create category is success!'
      redirect_to categories_url
    else
      flash.now[:danger] = 'Not success!'
      render 'new'
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = 'updated category!'
      redirect_to categories_url
    else
      flash.now[:danger] = 'Not success!'
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = 'deleted category'
    redirect_to categories_url
  end
  
  private

  def category_params
    params.require(:category).permit :name
  end
end