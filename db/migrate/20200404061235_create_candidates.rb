class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.belongs_to :district, null: false, foreign_key: true
      t.belongs_to :party, null: false, foreign_key: true
      t.integer :gid # 공공데이터 ID
      t.string :name, null: false
      t.string :cname
      t.string :thumb
      t.string :picture
      t.string :no
      t.string :gender
      t.string :birthday
      t.integer :age
      t.string :address
      t.string :job
      t.text :education
      t.text :career
      t.string :property
      t.string :military
      t.integer :tax
      t.integer :tax_unpaid_5yrs
      t.integer :tax_unpaid_current
      t.integer :crime
      t.integer :candidate_count

      t.timestamps
    end
  end
end