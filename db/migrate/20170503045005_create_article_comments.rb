class CreateArticleComments < ActiveRecord::Migration[5.0]
  def change
    create_table :article_comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :text

      t.timestamps
    end
    add_index :article_comments, :article_id
    add_index :article_comments, :user_id
    add_index :article_comments, [:article_id, :user_id], unique: true
  end
end
