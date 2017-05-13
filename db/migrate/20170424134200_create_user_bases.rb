class CreateUserBases < ActiveRecord::Migration[5.0]
  def change
    create_table :user_bases do |t|
      t.string :name, null: false, default: 'Guest'
      t.string :email, null: false
      t.text :sentence
      t.string :image
    end
    add_index :user_bases, :name, unique: true
  end
end
