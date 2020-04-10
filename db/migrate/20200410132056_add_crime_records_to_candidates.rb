class AddCrimeRecordsToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :crime_records, :text
  end
end
