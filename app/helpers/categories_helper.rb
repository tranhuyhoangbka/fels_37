module CategoriesHelper
  def correct_answer?(word_id, answer_id)
    answers = Word.find(word_id).answers
    answers.correct.first.id == answer_id
  end
end
