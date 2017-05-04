class CreateIntermediateTableUserRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :intermediate_table_user_relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
    add_index :intermediate_table_user_relationships, :follower_id, name: "user_relationships_follower_id"
    add_index :intermediate_table_user_relationships, :following_id, name: "user_relationships_following_id"
    add_index :intermediate_table_user_relationships, %i[follower_id following_id], unique: true, name: "user_relationships_unique"
  end
end
