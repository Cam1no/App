class CreateArticleBases < ActiveRecord::Migration[5.0]
  def change
    create_table :article_bases do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :article_bases, :user_id
    add_index :article_bases, :title
  end
end
