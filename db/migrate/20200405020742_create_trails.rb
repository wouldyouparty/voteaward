class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.text :body
      t.string :url
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :candidate, null: false, foreign_key: true
      t.boolean :verfied, default: false
      t.integer :likes_count, default: 0
      t.integer :dislikes_count, default: 0

      t.timestamps
    end
  end
end
