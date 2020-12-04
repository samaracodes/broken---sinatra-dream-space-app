class CreateDreamPosts < ActiveRecord::Migration
  def change
    create_table :dream_posts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
