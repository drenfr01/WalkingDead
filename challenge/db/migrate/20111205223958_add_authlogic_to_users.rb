class AddAuthlogicToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :username, :login
      t.string :persistence_token
      t.index :login
      t.index :persistence_token
    end
  end
end
