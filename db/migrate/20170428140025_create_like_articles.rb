class CreateLikeArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :like_articles do |t|
      t.integer :user_id, null: false
      t.integer :article_id, null: false

      t.timestamps null: false
    end
    add_index :like_articles, :user_id
    add_index :like_articles, :article_id
    add_index :like_articles, [:user_id, :article_id], unique: true
  end
end
