class AddElectedToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :elected, :boolean, default: false
  end
end
