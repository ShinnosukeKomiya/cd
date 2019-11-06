class AddStockIdToCds < ActiveRecord::Migration[5.1]
  def change
    add_reference :cds, :stock, foreign_key: true
  end
end
