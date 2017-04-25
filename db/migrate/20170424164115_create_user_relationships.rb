class CreateUserRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps null: false
    end
    add_index :user_relationships, :follower_id
    add_index :user_relationships, :following_id
    add_index :user_relationships, [:follower_id, :following_id], unique: true
  end
end
