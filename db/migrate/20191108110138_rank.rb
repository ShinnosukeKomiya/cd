class Rank < ActiveRecord::Migration[5.1]
  def change
    drop_table :rankings
  end
end
