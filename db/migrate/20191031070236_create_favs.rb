class CreateFavs < ActiveRecord::Migration[5.1]
  def change
    create_table :favs do |t|
      t.references :user, foreign_key: true
      t.references :cd, foreign_key: true

      t.timestamps
    end
  end
end
