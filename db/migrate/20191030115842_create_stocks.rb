class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :stock
      t.references :cd, foreign_key: true

      t.timestamps
    end
  end
end
