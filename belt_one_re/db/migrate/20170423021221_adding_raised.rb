class AddingRaised < ActiveRecord::Migration
  def change
  	add_column :borrowers, :raised, :integer
  end
end
