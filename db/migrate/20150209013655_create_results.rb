class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.text :list_word_id
      t.text :list_result
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :results, :users
  end
end
