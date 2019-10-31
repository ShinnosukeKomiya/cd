class CreateCds < ActiveRecord::Migration[5.1]
  def change
    create_table :cds do |t|
      t.string :title
      t.string :artist
      t.integer :price
      t.string :icon
      t.references :genre

      t.timestamps
    end
  end
end
