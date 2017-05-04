class CreateIntermediateTableArticleFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :intermediate_table_article_favorites do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    add_index :intermediate_table_article_favorites, :user_id, name: "article_favorites_user_id"
    add_index :intermediate_table_article_favorites, :article_id, name: "article_favorites_article_id"
    add_index :intermediate_table_article_favorites, %i[user_id article_id], unique: true, name: "article_favorites_unique"
  end
end
