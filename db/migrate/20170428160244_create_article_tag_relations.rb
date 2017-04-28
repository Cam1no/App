class CreateArticleTagRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :article_tag_relations do |t|
      t.integer :tag_id
      t.integer :article_id

      t.timestamps
    end
    add_index :article_tag_relations, :tag_id
    add_index :article_tag_relations, :article_id
    add_index :article_tag_relations, [:tag_id, :article_id], unique: true
  end
end
