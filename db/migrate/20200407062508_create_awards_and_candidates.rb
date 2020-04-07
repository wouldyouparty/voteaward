class CreateAwardsAndCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :awards_candidates do |t|
      t.belongs_to :award
      t.belongs_to :candidate
    end
  end
end
