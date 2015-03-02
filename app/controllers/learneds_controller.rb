class LearnedsController < ApplicationController
  def create
    params[:question].each do |word_id, answer_id|
      unless current_user.learneds.find_by(word_id: word_id.to_i)
        current_user.learneds.create word_id: word_id.to_i, category_id: 
          params[:category_id]
      end
    end
    category = Category.find params[:category_id]
    Activity.create content: "Learned 20 words in lession #{category.name}-(#{Time.now
      .strftime('%H:%M %d/%m/%Y')})", user: current_user
    redirect_to root_url
  end
end