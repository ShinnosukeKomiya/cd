class AddIndexFavsUserId < ActiveRecord::Migration[5.1]
  def change
    add_index :favs, [:user_id, :cd_id], unique: true
  end
end
