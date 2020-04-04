class AddCachedVotesToCandidates < ActiveRecord::Migration[6.0]
  def change
    def self.up
      add_column :candidates, :cached_votes_total, :integer, :default => 0
      add_column :candidates, :cached_votes_up, :integer, :default => 0
      add_column :candidates, :cached_votes_down, :integer, :default => 0
      add_index  :candidates, :cached_votes_total
      add_index  :candidates, :cached_votes_up
      add_index  :candidates, :cached_votes_down
    end

    def self.down
      remove_column :candidates, :cached_votes_total
      remove_column :candidates, :cached_votes_up
      remove_column :candidates, :cached_votes_down
    end
  end
end
