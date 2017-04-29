class CreateArticlePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :article_photos do |t|
      t.integer :article_id, null: false
      t.boolean :removed, default: false
      t.string :image_path
      t.string :image, null: false

      t.timestamps
    end
    add_index :article_photos, :article_id
  end
end
