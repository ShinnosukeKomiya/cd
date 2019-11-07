class Change < ActiveRecord::Migration[5.1]
  def change
    change_column_default :line_items, :quantity, 1
    change_column_null :line_items, :quantity, false
  end
end
