class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :amount

      t.timestamps null: false
    end
  end
end
