class CreateUserPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_photos do |t|
      t.integer :user_id, null: false
      t.boolean :removed, default: false
      t.string :image_path
      t.string :image, null: false

      t.timestamps
    end
    add_index :user_photos, :user_id
  end
end
