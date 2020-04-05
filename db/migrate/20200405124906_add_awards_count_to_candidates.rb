class AddAwardsCountToCandidates < ActiveRecord::Migration[6.0]
  def up
    add_column :candidates, :awards_count, :integer, :default => 0
  end

  def down
    remove_column :candidates, :awards_count
  end
end
