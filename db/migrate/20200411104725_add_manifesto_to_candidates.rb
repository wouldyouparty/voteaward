class AddManifestoToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :manifesto, :string
  end
end
