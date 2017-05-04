class CreateIntermediateTableArticleTagRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :intermediate_table_article_tag_relations do |t|
      t.integer :tag_id
      t.integer :article_id

      t.timestamps
    end
    add_index :intermediate_table_article_tag_relations, :tag_id, name: "article_tag_relations_tag_id"
    add_index :intermediate_table_article_tag_relations, :article_id, name: "article_tag_relations_article_id"
    add_index :intermediate_table_article_tag_relations, %i[tag_id article_id], unique: true, name: "article_tag_relations_unique"
  end
end
