class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.integer :count
      t.references :fav, foreign_key: true

      t.timestamps
    end
  end
end
