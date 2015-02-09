class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :activities, :users
  end
end
