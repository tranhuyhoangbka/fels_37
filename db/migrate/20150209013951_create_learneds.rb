class CreateLearneds < ActiveRecord::Migration
  def change
    create_table :learneds do |t|
      t.references :user, index: true
      t.references :word, index: true

      t.timestamps null: false
    end
    add_foreign_key :learneds, :users
    add_foreign_key :learneds, :words
  end
end
