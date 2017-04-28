class CreateArticleTags < ActiveRecord::Migration[5.0]
  def change
    create_table :article_tags do |t|
      t.string :name

      t.timestamps
    end
    add_index :article_tags, :name, unique: true
  end
end
