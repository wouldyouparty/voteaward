class AddUserToAwards < ActiveRecord::Migration[6.0]
  def up
    add_column :awards, :user_id, :integer, null: false
    add_index :awards, :user_id
  end

  def down
    remove_column :awards, :user_id
  end
end
