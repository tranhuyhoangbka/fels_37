class AddCategoryIdToLearneds < ActiveRecord::Migration
  def change
    add_reference :learneds, :category, index: true
    add_foreign_key :learneds, :categories
  end
end
