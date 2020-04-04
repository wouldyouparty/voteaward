class ChangeNoToIntegerInCandidates < ActiveRecord::Migration[6.0]
  def change
    change_column :candidates, :no, 'integer USING CAST(no AS integer)'
  end
end
