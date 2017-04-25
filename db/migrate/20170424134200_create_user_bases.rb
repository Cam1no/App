class CreateUserBases < ActiveRecord::Migration[5.0]
  def change
    create_table :user_bases do |t|
      t.string :name
      t.string :email
    end
  end
end
