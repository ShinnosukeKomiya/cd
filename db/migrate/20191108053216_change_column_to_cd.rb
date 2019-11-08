class ChangeColumnToCd < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :cds, :stocks
    remove_index :cds, :stock_id
    remove_reference :cds, :stock
  end
end
