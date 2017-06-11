class CreateXmen < ActiveRecord::Migration
  def change
    create_table :xmen do |t|
      t.string :name
      t.string :power

      t.timestamps null: false
    end
  end
end
