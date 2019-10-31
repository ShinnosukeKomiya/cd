class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :cardnumber
      t.string :duedate
      t.integer :security
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
