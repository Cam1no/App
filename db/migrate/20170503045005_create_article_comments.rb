class CreateArticleComments < ActiveRecord::Migration[5.0]
  def change
    create_table :article_comments do |t|
      t.integer :article_id, null: false
      t.integer :user_id, null: false
      t.text :text, null: false

      t.timestamps
    end
    add_index :article_comments, :article_id
    add_index :article_comments, :user_id
    add_index :article_comments, %i[article_id user_id]
  end
end
