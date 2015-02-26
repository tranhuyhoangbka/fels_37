class CategoriesController < ApplicationController
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
  end
end