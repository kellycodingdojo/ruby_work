class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.references :user, index: true, foreign_key: true
      t.string :state

      t.timestamps null: false
    end
  end
end
