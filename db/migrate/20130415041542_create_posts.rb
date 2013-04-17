class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.string :title
      t.string :slug

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
    add_index :posts, :slug, {unique: true}
  end
end
