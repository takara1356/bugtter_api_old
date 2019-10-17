class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :error_message, null: false
      t.string :description, null: false
      t.string :language, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
