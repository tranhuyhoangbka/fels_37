class WordListsController < ApplicationController
  before_action :user_logged_in, only: [:index, :new]
  def index
    @categories = Category.all

    if params[:category_id] && is_learned = params[:is_learned]
      category = Category.find params[:category_id]      
      word_ids = Learned.where(category: category, user: current_user).map(&:word_id)

      @words = if is_learned == '1'
        Word.where id: word_ids
      elsif is_learned == '2'
        category.words.where.not(id: word_ids)
      elsif is_learned == '3'
        category.words
      end
    end

    respond_to do |format|
      format.html
      format.js
    end  
  end
end