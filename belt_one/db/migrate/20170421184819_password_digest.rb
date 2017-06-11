class PasswordDigest < ActiveRecord::Migration
  def change
  	rename_column :password, :password, :digest
  end
end
