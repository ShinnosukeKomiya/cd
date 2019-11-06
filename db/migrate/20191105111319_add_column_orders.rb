class AddColumnOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :status, :boolean, null: false, default:0
  end
end
