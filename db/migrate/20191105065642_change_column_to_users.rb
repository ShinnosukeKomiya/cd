class ChangeColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :users, :stocks
    remove_index :users, :stock_id
    remove_reference :users, :stock
  end
end
