class AddUseridToCartitems < ActiveRecord::Migration[5.1]
  def change
    remove_column :cartitems, :price, :integer
    add_reference :cartitems, :user, foreign_key: true
  end
end
