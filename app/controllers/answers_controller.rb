class AnswersController < ApplicationController
  def create
    @word = Word.find params[:word_id]
    @answer = @word.answers.build answer_params
    if @answer.save
      flash[:success] = 'created answer!'
      redirect_to @word
    else
      flash.now[:danger] = 'Not succes!'
      render 'static_pages/home'
    end
  end
  
  def destroy
    @word = Word.find params[:word_id]
    @word.answers.find(params[:id]).destroy
    redirect_to @word
  end

  private
  
  def answer_params
    params.require(:answer).permit :content, :status, :word_id
  end
end