class AddColumnToCd < ActiveRecord::Migration[5.1]
  def change
    add_reference :stocks, :cd, foreign_key: true
  end
end
